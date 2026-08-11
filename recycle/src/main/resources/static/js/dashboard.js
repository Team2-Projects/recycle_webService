let todayCountList
let defaultMap

const img = document.querySelector("#mapImg");
const canvas = document.querySelector("#mapCanvas");
const ctx = canvas.getContext("2d");

const socket = new SockJS("/ws");
const stomp = Stomp.over(socket);

let todayCount

document.addEventListener("DOMContentLoaded", () => {
	getRobotState()
	getRobotTask()
    getTodayCollectionCount()
	getDefaultMap()
});

document.querySelector("#startBtn").addEventListener("click", () => {
	sendRobotCommand("START");
})
document.querySelector("#stopBtn").addEventListener("click", () => {
	sendRobotCommand("STOP");
})

let sendRobotCommand = (command) => {
	const data = {
		type: "command",
		command: command
	}
	
	stomp.send("/app/command", {}, JSON.stringify(data))
}

let getRobotState = async () => {
	let data = await apiFetch("/robotStatus", "POST", {
		eventType: "state"
	})
	document.querySelector("#state").innerHTML = data.status
	if(data.status == "Running"){
		document.querySelector("#state").style.color = "#4CAF50";
		document.querySelector("#startBtn").classList.add("inactive-btn");
		document.querySelector("#stopBtn").classList.remove("inactive-btn");
	}else{
		document.querySelector("#state").style.color = "red"
		document.querySelector("#startBtn").classList.remove("inactive-btn");
		document.querySelector("#stopBtn").classList.add("inactive-btn");
	}
}

let getRobotTask = async () => {
	let data = await apiFetch("/eventLog/getLastTask", "POST", {})
	document.querySelector("#mission").innerHTML = data.message
}

let getTodayCollectionCount = async () => {
    let data = {
        searchDto: {
            startDate: formatDate(new Date()),
            endDate: formatDate(new Date()) + ' 23:59:59'
        }
    }
    todayCountList = await apiFetch("/recycleHistory/getCollectionCount", "POST", data)
	todayCount = todayCountList.successCount
    document.querySelector("#todaySuccess").innerHTML = todayCount
}

let getDefaultMap = async() => {
	let data = {}
	defaultMap= await apiFetch("/map/getDefaultMap", "POST", data)
	
	document.querySelector("#mapImg").src = defaultMap.imagePath;

	canvas.width = img.width;
    canvas.height = img.height;	   
}

stomp.connect({}, function(){
    stomp.subscribe(
        "/topic/status",
        function(message){
			let data = JSON.parse(message.body);
			
	        switch(data.type){
	            case "battery":					
					let battery = Math.round(data.battery)
					
	                document.querySelector("#battery").innerHTML = battery >= 100 ? 100 + " %" : battery + " %";
					if(battery <= 30){
						document.querySelector("#battery").style.color = "red"						
					}else if(battery <= 70){
						document.querySelector("#battery").style.color = "yellow"
					}else{
						document.querySelector("#battery").style.color = "green"
					}
					
	                break;
				case "robot_status":
					document.querySelector("#state").innerHTML = data.status
					if(data.status == "Running"){
						document.querySelector("#state").style.color = "#4CAF50";
						document.querySelector("#startBtn").classList.add("inactive-btn");
						document.querySelector("#stopBtn").classList.remove("inactive-btn");
					}else{
						document.querySelector("#state").style.color = "red"
						document.querySelector("#startBtn").classList.remove("inactive-btn");
						document.querySelector("#stopBtn").classList.add("inactive-btn");
					}
					break;
	            case "robot_pose":					
					const mapX = (data.x - defaultMap.originX) / defaultMap.resolution;
					const mapY = defaultMap.height - ((data.y - defaultMap.originY) / defaultMap.resolution);

					const scaleX = mapImg.clientWidth / defaultMap.width;
					const scaleY = mapImg.clientHeight / defaultMap.height;

					const canvasX = mapX * scaleX;
					const canvasY = mapY * scaleY;

					drawRobot(canvasX, canvasY);
	                break;
				case "detection":
					document.querySelector("#object").innerHTML = data.object_name;
					document.querySelector("#confidence").innerHTML = Number(data.confidence) ? Number(data.confidence).toFixed(1) + " %" : "- %";
					break;
				case "robot_task":
					document.querySelector("#mission").innerHTML = data.message;
					break;
				case "recycleHistory":
					document.querySelector("#todaySuccess").innerHTML = todayCount += 1
					document.querySelector("#object").innerHTML = "-";
					document.querySelector("#confidence").innerHTML = "- %";
					break;
	        }
        }
    );
});


let drawRobot = (x, y) => {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    ctx.beginPath();
    ctx.arc(x, y, 6, 0, Math.PI * 2);
    ctx.fillStyle = "red";
    ctx.fill();
}