const socket = new SockJS("/ws");
const stomp = Stomp.over(socket);

let currentDate = new Date();

document.addEventListener("DOMContentLoaded", async () => {
	setWeekDate(currentDate)
	
	flatpickr("#scheduleDate", {
	    dateFormat: "Y-m-d",
	    allowInput: true
	});
	
	flatpickr("#executeTime", {
	    enableTime: true,
	    noCalendar: true,
	    dateFormat: "H:i",
	    time_24hr: true,
	    allowInput: true
	});
});

let setWeekDate = (baseDate) => {
	const dateList = document.querySelector("#dateList");
	dateList.innerHTML = ``
	const dayNames = ["일", "월", "화", "수", "목", "금", "토"];
	const today = new Date();

	const startOfWeek = new Date(baseDate);
	startOfWeek.setDate(baseDate.getDate() - baseDate.getDay());

	for (let i = 0; i < 7; i++) {
	    const date = new Date(startOfWeek);
	    date.setDate(startOfWeek.getDate() + i);

	    const button = document.createElement("button");
	    button.type = "button";
	    button.classList.add("date_item");

	    if (date.getFullYear() === today.getFullYear() && date.getMonth() === today.getMonth() && date.getDate() === today.getDate()) {
	        button.classList.add("active");
	    }

	    button.innerHTML = `
	        <span class="day_name">${dayNames[date.getDay()]}</span>
	        <span class="day_num">${date.getDate()}</span>
	    `;

	    dateList.appendChild(button);
	}
}

document.querySelector("#prevWeekBtn").addEventListener("click", () => {
	currentDate.setDate(currentDate.getDate() - 7);
	setWeekDate(currentDate);
});

document.querySelector("#nextWeekBtn").addEventListener("click", () => {
	currentDate.setDate(currentDate.getDate() + 7);
	setWeekDate(currentDate);
});

let resetData = () => {
	document.querySelector("#scheduleName").value = ""
	document.querySelector("#scheduleName").disabled = true;
	document.querySelector("#scheduleDate").disabled = true;
	document.querySelector("#executeTime").disabled = true;
	document.querySelector("#statusSelect").disabled = true;
}

document.querySelector("#scheduleAdd").addEventListener("click", () => {
	document.querySelector("#scheduleDelete").style.display = "none"
	document.querySelector("#scheduleCancel").style.display = ""
	document.querySelector("#scheduleUpdate").style.display = "none"
	document.querySelector("#scheduleSave").style.display = ""
	
	document.querySelector("#scheduleName").disabled = false;
	document.querySelector("#scheduleDate").disabled = false;
	document.querySelector("#executeTime").disabled = false;
	document.querySelector("#statusSelect").disabled = false;
})

document.querySelector("#scheduleCancel").addEventListener("click", () => {
	resetData()
	document.querySelector("#scheduleDelete").style.display = "none"
	document.querySelector("#scheduleCancel").style.display = "none"
	document.querySelector("#scheduleUpdate").style.display = "none"
	document.querySelector("#scheduleSave").style.display = "none"
})


stomp.connect({}, function(){
    stomp.subscribe(
        "/topic/status",
        function(message){
			let data = JSON.parse(message.body);
			
	        switch(data.type){
            }
        }
    );
});
