let todayCountList
let defaultMap

const img = document.querySelector("#mapImg");
const canvas = document.querySelector("#mapCanvas");
const ctx = canvas.getContext("2d");

const socket = new SockJS("/ws");
const stomp = Stomp.over(socket);

const cameraImg = document.querySelector("#cameraImg");
let currentCameraUrl = null;

const robotImg = new Image();
robotImg.src = "/image/robot3.png";

let todayCount

let robotPosition = null;
let robotMapPosition = null;
let navigationPath = [];

document.addEventListener("DOMContentLoaded", async () => {
	getTodayCollectionCount()
	await getDefaultMap()
	await getRobotState()
	
	setInterval(getCameraFrame, 200);
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
	
	if(data.connect == "CONNECT"){
		document.querySelector("#state").innerHTML = data.status
		if(data.status == "Running"){
			document.querySelector("#state").style.color = "#4CAF50";
			document.querySelector("#startBtn").classList.add("inactive-btn");
			document.querySelector("#stopBtn").classList.remove("inactive-btn");
			
			await getRobotTask()
		}else{
			document.querySelector("#state").style.color = "red"
			document.querySelector("#startBtn").classList.remove("inactive-btn");
			document.querySelector("#stopBtn").classList.add("inactive-btn");
		    navigationPath = [];
		}
	}else{
		document.querySelector("#state").innerHTML = data.connect
		document.querySelector("#state").style.color = "orange";
		document.querySelector("#startBtn").classList.add("inactive-btn");
		document.querySelector("#stopBtn").classList.add("inactive-btn");
		navigationPath = [];
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

const getCameraFrame = async () => {
    try {
        const response = await fetch("/camera/frame");
        // 카메라 데이터 없음
        if (response.status === 204) {
            return;
        }
		
        if (!response.ok) {
            return;
        }
		
        const blob = await response.blob();
        const imageUrl = URL.createObjectURL(blob);
		
        cameraImg.src = imageUrl;
        if (currentCameraUrl) {
            URL.revokeObjectURL(currentCameraUrl);
        }
		
        currentCameraUrl = imageUrl;
    } catch (error) {
        console.log("카메라 데이터 없음");
    }
}

let getDefaultMap = async() => {
	let data = {}
	defaultMap= await apiFetch("/map/getDefaultMap", "POST", data)
	
	img.src = defaultMap.imagePath;
	
	await new Promise((resolve, reject) => {
        img.onload = () => {
            canvas.width = img.clientWidth;
            canvas.height = img.clientHeight;

            // 확인용 로봇 위치
            robotPosition = {
                x: canvas.width / 3,
                y: canvas.height / 2
            };

            drawMap();

            resolve();
        };

        img.onerror = reject;
    });  
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
			const data = JSON.parse(message.body);
			switch(data.type){
				case "robot_connection":
					if(data.status === "OFFLINE"){
						getRobotState()
						document.querySelector("#battery").innerHTML = "-"
						document.querySelector("#mission").innerHTML = "-"
						document.querySelector("#object").innerHTML = "-";
						document.querySelector("#confidence").innerHTML = "- %";
					}
					break;
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
					if(data.status == "Starting"){
						document.querySelector("#state").style.color = "#4CAF50";
						document.querySelector("#startBtn").classList.add("inactive-btn");
						document.querySelector("#stopBtn").classList.add("inactive-btn");
					}else if(data.status == "Running"){
						document.querySelector("#state").style.color = "#4CAF50";
						document.querySelector("#startBtn").classList.add("inactive-btn");
						document.querySelector("#stopBtn").classList.remove("inactive-btn");
					}else if(data.status === "Return Home"){
						document.querySelector("#state").style.color = "red"
						document.querySelector("#startBtn").classList.add("inactive-btn");
						document.querySelector("#stopBtn").classList.add("inactive-btn");
					}else{
						document.querySelector("#state").style.color = "red"
						document.querySelector("#startBtn").classList.remove("inactive-btn");
						document.querySelector("#stopBtn").classList.add("inactive-btn");
						
				        navigationPath = [];

				        drawMap();
					}
					break;
		        case "robot_pose":					
					robotMapPosition = {x: data.x, y: data.y, yaw: data.yaw};
					robotPosition = convertMapToCanvas(data.x, data.y);		
					
					drawMap();
		            break;
				case "navigation_path":
				    navigationPath = data.path;
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

const areaLabels = ["플라스틱", "캔", "종이", "일반쓰레기"];

let getCurrentAreaIndex = () => {
    if (!robotPosition) return -1;

    const areaLeft = 10;
    const areaWidth = 90;
    const areaTop = 10;
    const areaHeight = canvas.height - 20;

    // ★ 로봇이 왼쪽 구역 표시 영역 밖이면 아무 구역도 선택하지 않음
    if (
        robotPosition.x < areaLeft ||
        robotPosition.x > areaLeft + areaWidth ||
        robotPosition.y < areaTop ||
        robotPosition.y > areaTop + areaHeight
    ) {
        return -1;
    }

    const sectionHeight = areaHeight / 5;

    return Math.floor(
        (robotPosition.y - areaTop) / sectionHeight
    );
}

let drawAreaLabels = () => {
    const sectionHeight = canvas.height / 4;
    const labelX = 20;
    const currentAreaIndex = getCurrentAreaIndex();

    for (let i = 0; i < 4; i++) {
        const y = i * sectionHeight;

        // 구역 경계선
        ctx.beginPath();
        ctx.moveTo(0, y);
        ctx.lineTo(80, y);
        ctx.strokeStyle = "#CCCCCC";
        ctx.lineWidth = 1;
        ctx.stroke();

        // 현재 로봇이 있는 구역 강조
        if (i === currentAreaIndex) {
            ctx.fillStyle = "rgba(76, 175, 80, 0.18)";
            ctx.fillRect(0, y, 80, sectionHeight);

            ctx.fillStyle = "#2E7D32";
            ctx.font = "bold 16px Arial";
        } else {
            ctx.fillStyle = "#666";
            ctx.font = "14px Arial";
        }

        // 글자
        ctx.fillText(
            areaLabels[i],
            labelX,
            y + sectionHeight / 2
        );
    }

    // 마지막 아래 경계선
    ctx.beginPath();
    ctx.moveTo(0, canvas.height);
    ctx.lineTo(80, canvas.height);
    ctx.strokeStyle = "#CCCCCC";
    ctx.lineWidth = 1;
    ctx.stroke();
}


let drawMap = () => {	
    ctx.clearRect(0, 0, canvas.width, canvas.height);
	drawAreaLabels();
	
    // 앞으로 갈 길
    drawNavigationPath();
    // 현재 로봇은 제일 마지막
    drawRobot();
}

let drawRobot = () => {
	if (!robotPosition)
        return;

	if (!robotImg.complete || robotImg.naturalWidth === 0)
        return;

    const robotWidth = 50
	const robotHeight = 50
	
	ctx.save();

    ctx.translate(
        robotPosition.x, robotPosition.y
    );

    ctx.drawImage(
        robotImg,
        -robotWidth / 2,
        -robotHeight / 2,
        robotWidth,
        robotHeight
    );

    ctx.restore();
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
