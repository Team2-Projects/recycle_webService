let todayCountList
let defaultMap

const img = document.querySelector("#mapImage");
const canvas = document.querySelector("#mapCanvas");
const ctx = canvas.getContext("2d");

document.addEventListener("DOMContentLoaded", () => {
    getTodayCollectionCount()
	getDefaultMap()
});

let getDefaultMap = async() => {
	let data = {}
	defaultMap= await apiFetch("/map/getDefaultMap", "POST", data)
	
	document.querySelector("#mapImg").src = defaultMap.imagePath;

	canvas.width = img.width;
    canvas.height = img.height;	    	
}

let getTodayCollectionCount = async () => {
    let data = {
        searchDto: {
            startDate: formatDate(new Date()),
            endDate: formatDate(new Date()) + ' 23:59:59'
        }
    }
    todayCountList = await apiFetch("/recycleHistory/getCollectionCount", "POST", data)

    document.querySelector("#todayCount").innerHTML = todayCountList.collectionCount
    document.querySelector("#todaySuccess").innerHTML = todayCountList.successCount
    document.querySelector("#todayFail").innerHTML = todayCountList.failCount
}

const socket = new SockJS("/ws");
const stomp = Stomp.over(socket);

let displayBattery = null;

stomp.connect({}, function(){
    stomp.subscribe(
        "/topic/status",
        function(message){
			let data = JSON.parse(message.body);
			
	        switch(data.type){
	            case "battery":
					let battery = data.battery
					const alpha = 0.8;

			        if(displayBattery === null){
			            displayBattery = battery;
			        } else {
			            displayBattery =
			                displayBattery * alpha +
			                battery * (1 - alpha);
			        }
	                document.querySelector("#battery").innerHTML = Math.round(displayBattery) >= 100 ? 100 + " %" : Math.round(displayBattery) + " %";
	                break;
				case "state":
					break;
	            case "robot_pose":
					console.log(data)
					const x = (data.x - defaultMap.originX) / defaultMap.resolution;
				    const y = canvas.height - ((data.y - defaultMap.originY) / defaultMap.resolution);
					drawRobot(x, y)
	                break;
				case "detection":
					document.querySelector("#object").innerHTML = data.object_name;
					document.querySelector("#confidence").innerHTML = data.confidence.toFixed(1) + " %";
					break;
	        }
        }
    );

});


/*let worldToCanvas = (odomX, odomY) => {
	const x = (odomX - defaultMap.originX) / defaultMap.resolution;

    const y = canvas.height - ((odomY - defaultMap.originY) / defaultMap.resolution);

	//const canvasX = OFFSET_X + odomX * SCALE;
    //const canvasY = OFFSET_Y - odomY * SCALE;
	
    return {
        x:x,
        y:y
    };
}*/

let drawRobot = (x, y) => {

    ctx.clearRect(0, 0, canvas.width, canvas.height);
    ctx.beginPath();
    ctx.arc(x, y, 6, 0, Math.PI * 2);
    ctx.fillStyle = "red";
    ctx.fill();
}