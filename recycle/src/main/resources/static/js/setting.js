let robotInfo

document.addEventListener("DOMContentLoaded", () => {
    getRobotInfo()
});

let getRobotInfo = async () => {
    robotInfo = await apiFetch("/setting/getRobotInfo", "POST", {})

    document.querySelector("#robotName").innerHTML = robotInfo.name
    document.querySelector("#robotModel").innerHTML = robotInfo.model
    document.querySelector("#rosVersion").innerHTML = robotInfo.rosVersion
}

// websocket
const socket = new SockJS("/ws");
const stomp = Stomp.over(socket);

stomp.connect({}, function(){
    console.log("WebSocket connected");
    
    stomp.subscribe(
        "/topic/status",
        function(message){
            console.log(message.body);

            try {
                const data = JSON.parse(message.body);

                if (data.type === "cpu") {
                    const cpuUsage = data.cpu_usage.toFixed(1); 
					const cpuText = document.querySelector("#cpu_usage");
                    if (cpuText) cpuText.innerText = `${cpuUsage}%`;
                    const progressBar = document.querySelector("#cpu_progress-bar");
                    if (progressBar) progressBar.style.width = `${cpuUsage}%`;
                }
				if (data.type === "memory") {
                    const memoryUsage = data.memory_usage.toFixed(1); 
					const memoryText = document.querySelector("#memory_usage");
                    if (memoryText) memoryText.innerText = `${memoryUsage}%`;
                    const progressBar = document.querySelector("#memory_progress-bar");
                    if (progressBar) progressBar.style.width = `${memoryUsage}%`;
				}
				if (data.type === "disk") {
                    const diskUsage = data.disk_usage.toFixed(1); 
                    const diskText = document.querySelector("#disk_usage");
                    if (diskText) diskText.innerText = `${diskUsage}%`;
                    const progressBar = document.querySelector("#disk_progress-bar");
                    if (progressBar) progressBar.style.width = `${diskUsage}%`;
                }
								
            } catch (e) {
                console.error("JSON 파싱 및 UI 업데이트 오류:", e);
            }
        }
    );
});