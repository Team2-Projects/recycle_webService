let todayCountList
let defaultMap

const socket = new SockJS("/ws");
const stomp = Stomp.over(socket);


document.addEventListener("DOMContentLoaded", async () => {
	
});

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
	    navigationPath = [];
	    destination = null;
	}
}

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

//paging
/*let paging = () => {
    let html = document.querySelector("#pageDiv")

    const totalPage = Math.ceil(eventLogCount / PAGE_SIZE);
    const currentBlock = Math.floor((pageNumber - 1) / BLOCK_SIZE);
    const startPage = currentBlock * BLOCK_SIZE + 1;
    const endPage = Math.min(startPage + BLOCK_SIZE - 1, totalPage);
    let content = "";

    if(startPage > 1){
        content += `
            <button onclick="movePage(${startPage - BLOCK_SIZE})">&lt;</button>
        `;
    }

    for(let i = startPage; i <= endPage; i++){
        content += `
            <button
                class="${pageNumber === i ? 'active' : ''}"
                onclick="movePage(${i})">
                ${i}
            </button>
        `;
    }

    if(endPage < totalPage){
        content += `
            <button onclick="movePage(${startPage + BLOCK_SIZE})">&gt;</button>
        `;
    }
    html.innerHTML = content;
}

let movePage = (page) => {
    getEventLogList(page);
    paging();
}*/