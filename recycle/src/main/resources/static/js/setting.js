let robotInfo

document.addEventListener("DOMContentLoaded", () => {
	getRobotState()
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

let getRobotState = async () => {
	let data = await apiFetch("/robotStatus", "POST", {
		eventType: "state"
	})
	
	if(data.connect == "DISCONNECT"){
		document.querySelector("#connectAlarm").style.display = "block"
	}else{
		document.querySelector("#connectAlarm").style.display = "none"
	}
}

stomp.connect({}, function(){    
    stomp.subscribe(
        "/topic/status",
        function(message){
            try {
                const data = JSON.parse(message.body);

                if (data.type === "system") {
                    const cpuUsage = data.cpu.toFixed(1); 
					const cpuText = document.querySelector("#cpu_usage");
                    if (cpuText) cpuText.innerText = `${cpuUsage}%`;
                    const cpuProgressBar = document.querySelector("#cpu_progress-bar");
                    if (cpuProgressBar) cpuProgressBar.style.width = `${cpuUsage}%`;
					
					const memoryUsage = data.memory.toFixed(1); 
					const memoryText = document.querySelector("#memory_usage");
	                if (memoryText) memoryText.innerText = `${memoryUsage}%`;
	                const memoryProgressBar = document.querySelector("#memory_progress-bar");
	                if (memoryProgressBar) memoryProgressBar.style.width = `${memoryUsage}%`;
					
					const diskUsage = data.disk.toFixed(1); 
                    const diskText = document.querySelector("#disk_usage");
                    if (diskText) diskText.innerText = `${diskUsage}%`;
                    const diskProgressBar = document.querySelector("#disk_progress-bar");
                    if (diskProgressBar) diskProgressBar.style.width = `${diskUsage}%`;
                }else if(data.type === "robot_connection"){
					getRobotState()
				}
								
            } catch (e) {
                console.error("JSON 파싱 및 UI 업데이트 오류:", e);
            }
        }
    );
});