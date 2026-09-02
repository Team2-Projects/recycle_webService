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
			const data = JSON.parse(message.body);
			switch(data.type){
				case "robot_connection":
					getRobotState()
					break;
					
				case "schedule_command":
			        console.log(
			            "예약 START 송신 확인 :",
			            data.command,
			            data.status
			        );

			        getScheduleList(selectedDate);
			        break;
			}
        }
    );
});

let currentDate = new Date();
let selectedDate = formatDate(new Date());
let scheduleDatePicker;
let executeTimePicker;

document.addEventListener("DOMContentLoaded", async () => {
	getRobotState()
	setWeekDate(currentDate)
	
    const todayButton = document.querySelector(
        `#dateList .date_item[data-date="${selectedDate}"]`
    );

    if (todayButton) {
        todayButton.click();
    }
	
	scheduleDatePicker = flatpickr("#scheduleDate", {
	    dateFormat: "Y-m-d",
	    allowInput: true
	});
	
	executeTimePicker = flatpickr("#executeTime", {
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
		button.dataset.date = formatDate(date);

	    button.innerHTML = `
	        <span class="day_name">${dayNames[date.getDay()]}</span>
	        <span class="day_num">${date.getDate()}</span>
	    `;
		
		if (button.dataset.date === selectedDate) {
		    button.classList.add("active");
		}
		
		button.addEventListener("click", () => {
			dateClickEvent(button)
		})

	    dateList.appendChild(button);
	}
}

let dateClickEvent = (button) => {
	document.querySelectorAll("#dateList .date_item").forEach(item => {
        item.classList.remove("active");
    });
	
	button.classList.add("active");
	selectedDate = button.dataset.date;
	
	getScheduleList(selectedDate)
	getVoiceCommandList(selectedDate)
}

document.querySelector("#prevWeekBtn").addEventListener("click", () => {
	currentDate.setDate(currentDate.getDate() - 7);
	setWeekDate(currentDate);
});

document.querySelector("#nextWeekBtn").addEventListener("click", () => {
	currentDate.setDate(currentDate.getDate() + 7);
	setWeekDate(currentDate);
});

let getVoiceCommandList = async (date) => {
	let data = {
		createTime: date
	}
	let voiceCommandList = await apiFetch("/schedule/voiceList", "POST", data)
	
	let voiceListHtml = document.querySelector("#voiceList")
	voiceListHtml.innerHTML = ``
	
	let html = ''
	if(voiceCommandList.length == 0){
		html = `
			<div class="voice_item voice_box_no_data_item">
                <div>
                    No Data
                </div>
            </div>
		`
	}
	
	voiceCommandList.forEach(d => {
		html += `
			<div class="voice_item">
	            <div class="voice_text">
	                ${d.command}
	            </div>
	            <div class="voice_date">
	                ${d.createTime.split(" ")[1].substring(0, 5)}
	            </div>
	        </div>
		`
	})
	voiceListHtml.innerHTML = html
}

let getScheduleList = async (date) => {
	let data = {
		scheduleDate: date	
	}
	let selectedUid = document.querySelector("#scheduleName").dataset.uid
	
	let scheduleListHtml = document.querySelector("#scheduleList")
	scheduleListHtml.innerHTML = ``
	let scheduleList = await apiFetch("/schedule/list", "POST", data)
	
	if(scheduleList.length == 0){
		scheduleListHtml.innerHTML = `
			<button type="button" class="schedule_item_no_data">
                <div class="schedule_item_row">
                    <div class="schedule_name">
                        No Data
                    </div>
                </div>
            </button>
		`		
	}
	
	scheduleList.forEach((d, i) => {
		let state = "대기"
		let stateClass = "wait"

		if(d.status === "RUNNING"){
		    state = "실행중"
		    stateClass = "running"
		}else if(d.status === "COMPLETE"){
		    state = "완료"
		    stateClass = "done"
		}else if(d.status === "CANCEL"){
		    state = "취소"
		    stateClass = "cancel"
		}
		
		let button = document.createElement("button");
	    button.type = "button";
	    button.classList.add("schedule_item");
		
		button.innerHTML = `
            <div class="schedule_item_row">
                <div class="schedule_time">
                    ${d.executionTime.substring(0, 5)}
                </div>
                <div class="schedule_name">
                    ${d.scheduleName}
                </div>
                <div class="schedule_status ${stateClass}">
                    ${state}
                </div>
            </div>	 
		`
		
		if (selectedUid != '' && d.uid == selectedUid) {
		    button.classList.add("active");
		}
		
		button.addEventListener("click", () => {
	        setDetailSchedule(button, d);
	    });
		scheduleListHtml.appendChild(button)
	})
}

let setDetailSchedule = (button, d) => {
	document.querySelectorAll("#scheduleList .schedule_item").forEach(item => {
        item.classList.remove("active");
    });
	button.classList.add("active");
	
	document.querySelector("#scheduleDelete").style.display = ""
	document.querySelector("#scheduleCancel").style.display = ""
	document.querySelector("#scheduleUpdate").style.display = ""
	document.querySelector("#scheduleSave").style.display = "none"
	
	document.querySelector("#scheduleName").value = d.scheduleName
	document.querySelector("#scheduleName").dataset.uid = d.uid
	document.querySelector("#scheduleDate").value = d.scheduleDate
	scheduleDatePicker.setDate(d.scheduleDate, true, "Y-m-d")
	document.querySelector("#executeTime").value = d.executionTime.substring(0, 5)
	executeTimePicker.setDate(d.executionTime.substring(0, 5), true, "H:i");
	document.querySelector("#statusSelect").value = d.status
	document.querySelector("#textareaBox").value = d.description
	
	document.querySelector("#scheduleName").disabled = false;
	document.querySelector("#scheduleDate").disabled = false;
	document.querySelector("#executeTime").disabled = false;
	document.querySelector("#statusSelect").disabled = false;
	document.querySelector("#taskSelect").disabled = false;
	document.querySelector("#textareaBox").disabled = false;
}

document.querySelector("#scheduleAdd").addEventListener("click", () => {
	document.querySelectorAll("#scheduleList .schedule_item").forEach(item => {
        item.classList.remove("active");
    });
	
	document.querySelector("#scheduleDelete").style.display = "none"
	document.querySelector("#scheduleCancel").style.display = ""
	document.querySelector("#scheduleUpdate").style.display = "none"
	document.querySelector("#scheduleSave").style.display = ""
	
	document.querySelector("#scheduleName").value = ""
	document.querySelector("#scheduleName").dataset.uid = ""
	document.querySelector("#scheduleDate").value = ""
	document.querySelector("#executeTime").value = ""
	document.querySelector("#statusSelect").value = "WAIT"
	document.querySelector("#textareaBox").value = ''
	
	document.querySelector("#scheduleName").disabled = false;
	document.querySelector("#scheduleDate").disabled = false;
	document.querySelector("#executeTime").disabled = false;
	document.querySelector("#statusSelect").disabled = false;
	document.querySelector("#taskSelect").disabled = false;
	document.querySelector("#textareaBox").disabled = false;
})

let resetData = () => {
	document.querySelectorAll("#scheduleList .schedule_item").forEach(item => {
        item.classList.remove("active");
    });
	
	document.querySelector("#scheduleDelete").style.display = "none"
	document.querySelector("#scheduleCancel").style.display = "none"
	document.querySelector("#scheduleUpdate").style.display = "none"
	document.querySelector("#scheduleSave").style.display = "none"
	
	document.querySelector("#scheduleName").value = ""
	document.querySelector("#scheduleName").dataset.uid = ""
	document.querySelector("#scheduleName").disabled = true;
	document.querySelector("#scheduleDate").value = ""
	document.querySelector("#scheduleDate").disabled = true;
	document.querySelector("#executeTime").value = ""
	document.querySelector("#executeTime").disabled = true;
	document.querySelector("#statusSelect").value = "WAIT"
	document.querySelector("#statusSelect").disabled = true;
	document.querySelector("#taskSelect").disabled = true;
	document.querySelector("#textareaBox").value = ''
	document.querySelector("#textareaBox").disabled = true;
}

document.querySelector("#scheduleCancel").addEventListener("click", () => {
	resetData()
})

document.querySelector("#scheduleUpdate").addEventListener("click", async () => {
	if(!confirm("스케줄을 수정하시겠습니까?")){
		return
	}
	saveSchedule("update")
})

document.querySelector("#scheduleSave").addEventListener("click", async () => {
	if(!confirm("스케줄을 저장하시겠습니까?")){
		return
	}
	saveSchedule("insert")
})

let checkData = (data) => {
	if(data.scheduleName === ""){
		return false
	}else if(data.scheduleDate === ""){
		return false
	}else if(data.executionTime === ""){
		return false
	}else{
		return true
	}
}

let saveSchedule = async (type) => {
	let data = {
		uid: document.querySelector("#scheduleName").dataset.uid,
		scheduleId: "SCH001",
		scheduleName: document.querySelector("#scheduleName").value,
		scheduleDate: document.querySelector("#scheduleDate").value,
		executionTime: document.querySelector("#executeTime").value,
		status: document.querySelector("#statusSelect").value,
		task: document.querySelector("#taskSelect").selectedOptions[0].text,
		description: document.querySelector("#textareaBox").value
	}
	let count = 0;
	if(checkData(data)){
		count = await apiFetch(`/schedule/${type}`, "POST", data)		
	}else{
		confirm("데이터를 확인해 주세요.")
		return 
	}
	
	if(type == "insert"){
		document.querySelector("#scheduleName").dataset.uid = count
	}
	
	currentDate = new Date(data.scheduleDate);
	setWeekDate(currentDate);
	selectedDate = data.scheduleDate;
	const dateButton = document.querySelector(
        `#dateList .date_item[data-date="${data.scheduleDate}"]`
    );

    if (dateButton) {
        dateButton.click();
    }
}

document.querySelector("#scheduleDelete").addEventListener("click", async () => {
	if(!confirm("스케줄을 삭제하시겠습니까?")){
		return
	}
	
	let data = {
		uid: document.querySelector("#scheduleName").dataset.uid,
	}
	let count = await apiFetch("/schedule/delete", "POST", data)
	getScheduleList(selectedDate)
	resetData()
})

