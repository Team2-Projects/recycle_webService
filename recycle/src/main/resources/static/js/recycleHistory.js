let totalCountList
let todayCountList

let typeChartData
let dateChartData

let typeChart
let dateChart

document.addEventListener("DOMContentLoaded", () => {
    document.querySelector("#startDate").value = formatDate(new Date(), { months: -1 });
    document.querySelector("#endDate").value = formatDate(new Date());

    getTodayCollectionCount()
    getCollectionCount()
});

let getTodayCollectionCount = async () => {
    let data = {
        searchDto: {
            startDate: formatDate(new Date()),
            endDate: formatDate(new Date()) + ' 23:59:59'
        }
    }
    todayCountList = await apiFetch("/recycleHistory/getCollectionCount", "POST", data)
    document.querySelector("#todayCount").innerHTML = todayCountList.collectionCount
}

let getCollectionCount = async () => {
    let startDate = document.querySelector("#startDate").value
    let endDate = document.querySelector("#endDate").value
    let data = {
        searchDto: {
            startDate: startDate === "" ? null : startDate,
            endDate: endDate === "" ? null : endDate + ' 23:59:59'
        }
    }

    totalCountList = await apiFetch("/recycleHistory/getCollectionCount", "POST", data)
    document.querySelector("#totalCount").innerHTML = totalCountList.collectionCount

    typeChartData = await apiFetch("/recycleHistory/getTypeChartData", "POST", data)
    dateChartData = await apiFetch("/recycleHistory/getDateChartData", "POST", data)
    dataSetting()
}

let dataSetting = () => {
    let typeChartLabel = []
    let typeChartCount = []
    let dateChartLabel = []
    let dateChartCount = []

    typeChartData.forEach(d => {
        typeChartLabel.push(d.objectType)
        typeChartCount.push(d.collectionCount)
    })

    const dateMap = new Map();

    dateChartData.forEach(d => {
        dateMap.set(d.createTime, d);
    });

    const start = new Date(document.querySelector("#startDate").value);
    const end = new Date(document.querySelector("#endDate").value);

    while (start <= end) {
        const date = formatDate(start);

        dateChartLabel.push(date);

        if (dateMap.has(date)) {
            dateChartCount.push(dateMap.get(date).collectionCount);
        } else {
            dateChartCount.push(null);
        }

        start.setDate(start.getDate() + 1);
    }
    /*dateChartData.forEach(d => {
        dateChartLabel.push(d.createTime)
        dateChartCount.push(d.collectionCount)
    })*/

    if (!typeChart) {
        typeChartCreate(typeChartLabel, typeChartCount)
    } else {
        typeChart.data.labels = typeChartLabel;
        typeChart.data.datasets[0].data = typeChartCount;
        typeChart.update();
    }

    if (!dateChart) {
        dateChartCreate(dateChartLabel, dateChartCount)
    } else {
        dateChart.data.labels = dateChartLabel;
        dateChart.data.datasets[0].data = dateChartCount;
        dateChart.update();
    }
}

Chart.register(ChartDataLabels);

let typeChartCreate = (typeChartLabel, typeChartCount) => {
    const typeCtx = document.getElementById("typeChart").getContext("2d");

    typeChart = new Chart(typeCtx, {
        type: "bar",
        data: {
            labels: typeChartLabel,
            datasets: [{
                label: "Collection Count",
                data: typeChartCount,
                backgroundColor: [
                    "#42a5f5",
                    "#66bb6a",
                    "#ffa726",
                    "#ab47bc"
                ],
                borderRadius: 8,
                borderSkipped: false
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    display: false
                },
                tooltip: {
                    enabled: false
                },
                datalabels: {
                    display: true,
                    clip: false,
                    clamp: true,
                    anchor: "end",
                    align: "top",
                    color: "#070707",
                    font: {
                        size: 15,
                        weight: "bold"
                    },
                    formatter: value => value
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    grace: "10%"
                }
            }
        }
    });
}

let dateChartCreate = (dateChartLabel, dateChartCount) => {
    const dateCtx = document.getElementById("dateChart").getContext("2d");

    dateChart = new Chart(dateCtx, {
        type: "line",
        data: {
            labels: dateChartLabel,
            datasets: [{
                label: "Daily Collection",
                data: dateChartCount,
                borderColor: "#1976d2",
                tension: 0.3,
                pointRadius: 5,
                pointHoverRadius: 7
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    display: false
                },
                tooltip: {
                    /*displayColors: false,
                    callbacks: {
                        label: function(context) {
                            const data = dateChartData[context.dataIndex];

                            let result = [`Total : ${data.collectionCount}`];

                            data.recycleList.forEach(item => {
                                result.push(`${item.objectType} : ${item.collectionCount}`);
                            });

                            return result;
                        }
                    }*/
                    enabled:false,
                    external: externalTooltipHandler
                },
                datalabels: {
                    display: false
                }
            },
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
}

const externalTooltipHandler = (context) => {
    const {chart, tooltip} = context;

    let tooltipEl = document.getElementById("chart-tooltip");

    if (!tooltipEl) {
        tooltipEl = document.createElement("div");
        tooltipEl.id = "chart-tooltip";
        tooltipEl.className = "chart-tooltip";
        document.body.appendChild(tooltipEl);
    }

    if (tooltip.opacity === 0) {
        tooltipEl.style.opacity = 0;
        return;
    }

    const label = tooltip.dataPoints[0].label;
    const data = dateChartData.find(d => d.createTime === label);

    let html = ``

    if (!data) {
        html = `
            <div class="title">${label}</div>
            <div class="total">Total : -</div>
        `;
    }else{
        html = `
            <div class="title">${data.createTime}</div>
            <div class="total">Total : ${data.collectionCount}</div>
        `;
        data.recycleList.forEach(item=>{
            html += `<div class="item">${item.objectType} : ${item.collectionCount}</div>`;
        });
    }

    tooltipEl.innerHTML = html;

    //위치 계산
    const rect = chart.canvas.getBoundingClientRect();
    //툴팁 너비, 높이
    const tooltipWidth = tooltipEl.offsetWidth;
    const tooltipHeight = tooltipEl.offsetHeight;

    let left;
    let top;
    //tooltip.caretX: 마우스 위치
    if (tooltip.caretX + tooltipWidth + 20 < chart.width) {
        left = rect.left + window.scrollX + tooltip.caretX + 15;
    } else {
        left = rect.left + window.scrollX + tooltip.caretX - tooltipWidth - 15;
    }

    if (tooltip.caretY + tooltipHeight + 20 < chart.height) {
        top = rect.top + window.scrollY + tooltip.caretY + 15;
    } else {
        top = rect.top + window.scrollY + tooltip.caretY - tooltipHeight - 15;
    }

    tooltipEl.style.opacity = 1;
    tooltipEl.style.left = left + "px";
    tooltipEl.style.top = top + "px";
};