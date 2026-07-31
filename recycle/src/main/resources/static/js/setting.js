let robotInfo

document.addEventListener("DOMContentLoaded", () => {
    getRobotInfo()
});


let getRobotInfo = async () => {
    robotInfo = await apiFetch("/setting/getRobotInfo", "POST", {})

    document.querySelector("#robotName").innerHTML= robotInfo.name
    document.querySelector("#robotModel").innerHTML = robotInfo.model
    document.querySelector("#rosVersion").innerHTML = robotInfo.rosVersion
}

//websocket
const socket = new SockJS("/ws");
const stomp = Stomp.over(socket);

stomp.connect({}, function(){
    console.log("WebSocket connected");
    stomp.subscribe(
        "/topic/status",
        function(message){
            console.log(message.body);
        }
    );

});