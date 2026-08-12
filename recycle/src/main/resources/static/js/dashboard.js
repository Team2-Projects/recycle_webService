let todayCountList
let defaultMap

const img = document.querySelector("#mapImg");
const canvas = document.querySelector("#mapCanvas");
const ctx = canvas.getContext("2d");

const socket = new SockJS("/ws");
const stomp = Stomp.over(socket);

let todayCount

let robotPosition = null;
let robotMapPosition = null;
let navigationPastPath = [];
let navigationPath = [];
let startPosition = null;
let destination = null;

document.addEventListener("DOMContentLoaded", async () => {
	getRobotTask()
    getTodayCollectionCount()
	await getDefaultMap()
	await getRobotState()
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
		if (data.startDestinationX != null && data.startDestinationY != null) {
	        startPosition = convertMapToCanvas(
	            data.startDestinationX,
	            data.startDestinationY
	        );
	    }

	    if (data.goalDestinationX != null && data.goalDestinationY != null) {
	        destination = convertMapToCanvas(
	            data.goalDestinationX,
	            data.goalDestinationY
	        );
	    }
	}else{
		document.querySelector("#state").style.color = "red"
		document.querySelector("#startBtn").classList.remove("inactive-btn");
		document.querySelector("#stopBtn").classList.add("inactive-btn");
		navigationPastPath = [];
	    navigationPath = [];
	    startPosition = null;
	    destination = null;
	}

    drawMap();
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
	
	img.src = defaultMap.imagePath;
	
	img.onload = () => {
        canvas.width = img.clientWidth;
        canvas.height = img.clientHeight;

        drawMap();
    };	   
}

let convertMapToCanvas = (x, y) => {
	const mapX = (x - defaultMap.originX) / defaultMap.resolution;
	const mapY = defaultMap.height - ((y - defaultMap.originY) / defaultMap.resolution);

	const scaleX = img.clientWidth / defaultMap.width;
	const scaleY = img.clientHeight / defaultMap.height;
	
	return {
		x: mapX * scaleX,
		y: mapY * scaleY
	}
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
						document.querySelector("#battery").style.color = "orange"
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
						
						navigationPastPath = [];
				        navigationPath = [];
				        startPosition = null;
				        destination = null;

				        drawMap();
					}
					break;
	            case "robot_pose":					
					robotMapPosition = {x: data.x, y: data.y};
					robotPosition = convertMapToCanvas(data.x, data.y);					
					addPastPath(robotPosition.x, robotPosition.y)
					
					drawMap();
	                break;
				case "navigation_path":
				    navigationPath = data.path;
				    drawMap();
				    break;
				case "navigation_goal":
					navigationPastPath = [];
					if(robotPosition){
						startPosition = {
							x: robotPosition.x,
							y: robotPosition.y
						}
					}

				    destination = convertMapToCanvas(data.x, data.y);
					
					if(robotMapPosition){
						apiFetch("/robotStatus/updateDestination", "POST", {
							eventType: "state",
			                startDestinationX: robotMapPosition.x,
			                startDestinationY: robotMapPosition.y,
			                goalDestinationX: data.x,
			                goalDestinationY: data.y
						})
					}

				    drawMap();
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


let drawMap = () => {	
    ctx.clearRect(0, 0, canvas.width, canvas.height);
	// 지나온 길
    drawPastPath();
    // 앞으로 갈 길
    drawNavigationPath();
    // 출발지
    drawStartPosition();
    // 목적지
    drawDestination();
    // 현재 로봇은 제일 마지막
    drawRobot();
}

let drawStartPosition = () => {
	if (!startPosition)
        return;

    ctx.beginPath();

    ctx.arc(
        startPosition.x, startPosition.y, 6, 0, Math.PI * 2
    );

    ctx.fillStyle = "#4CAF50";
    ctx.fill();

    ctx.font = "12px Arial";
    ctx.fillStyle = "#4CAF50";

    ctx.fillText(
        "Start",
        startPosition.x + 9,
        startPosition.y - 8
    );
}

let addPastPath = (x, y) => {
	if(navigationPastPath.length == 0){
		navigationPastPath.push({x, y})
		return
	}
	
	const last = navigationPastPath[navigationPastPath.length - 1]
	const dx = x - last.x;
    const dy = y - last.y;

    const distance = Math.sqrt(dx * dx + dy * dy);

    if (distance >= 3) {
        navigationPastPath.push({ x, y });
    }
}

let drawPastPath = () => {
	if (navigationPastPath.length < 2)
        return;

    ctx.beginPath();

    ctx.moveTo(navigationPastPath[0].x, navigationPastPath[0].y); 

    for (let i = 1; i < navigationPastPath.length; i++) {
        ctx.lineTo(navigationPastPath[i].x, navigationPastPath[i].y);
    }

    ctx.strokeStyle = "#9E9E9E";
    ctx.lineWidth = 2;

    ctx.stroke();
}

let drawRobot = () => {
	if(!robotPosition)
        return;

    ctx.beginPath();
    ctx.arc(robotPosition.x, robotPosition.y, 6, 0, Math.PI * 2);
    ctx.fillStyle = "red";
    ctx.fill();
}

let drawNavigationPath = () => {
	if (!navigationPath || navigationPath.length < 2)
        return;

    const scaleX = img.clientWidth / defaultMap.width;
    const scaleY = img.clientHeight / defaultMap.height;

    ctx.beginPath();

    navigationPath.forEach((pose, index) => {
        const mapX = (pose.x - defaultMap.originX) / defaultMap.resolution;
        const mapY = defaultMap.height - ((pose.y - defaultMap.originY) / defaultMap.resolution);

        const canvasX = mapX * scaleX;
        const canvasY = mapY * scaleY;

        if (index === 0) {
            ctx.moveTo(canvasX, canvasY);
        } else {
            ctx.lineTo(canvasX, canvasY);
        }
    });

    ctx.strokeStyle = "#2196F3";
    ctx.lineWidth = 3;

    ctx.stroke();
}

let drawDestination = () => {
	if(!destination)
        return;

    ctx.beginPath();

    ctx.arc(destination.x, destination.y, 8, 0, Math.PI * 2);

    ctx.fillStyle = "green";

    ctx.fill();

    ctx.font = "12px Arial";
    ctx.fillStyle = "green";

    ctx.fillText(
        "Goal",
        destination.x + 10,
        destination.y - 10
    );
}