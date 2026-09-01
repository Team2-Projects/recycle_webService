package com.example.recycle.websocket;

import java.nio.ByteBuffer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.handler.AbstractWebSocketHandler;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.example.recycle.dto.EventLogDto;
import com.example.recycle.dto.RecycleHistoryDto;
import com.example.recycle.dto.RobotStatus;
import com.example.recycle.eventLog.service.EventLogServiceI;
import com.example.recycle.general.service.GeneralServiceI;
import com.example.recycle.recycleHistory.service.RecycleHistoryServiceI;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Component
public class RobotHandler extends AbstractWebSocketHandler {


	@Autowired
    private SimpMessagingTemplate template;

    @Autowired
    private ObjectMapper objectMapper;
    
    @Autowired
    private GeneralServiceI generalServiceI;
    
    @Autowired
    private EventLogServiceI eventLogServiceI;
    
    @Autowired
    private RecycleHistoryServiceI recycleHistoryServiceI;
    
    
    private volatile byte[] latestFrame;
    
    
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {

        System.out.println("로봇 WebSocket 연결됨");

        template.convertAndSend(
            "/topic/status",
            "{\"type\":\"robot_connection\",\"status\":\"ONLINE\"}"
        );
    }
    
    @Override
    public void afterConnectionClosed(
            WebSocketSession session,
            CloseStatus status) throws Exception {

        System.out.println("로봇 WebSocket 연결 끊김");

        template.convertAndSend(
            "/topic/status",
            "{\"type\":\"robot_connection\",\"status\":\"OFFLINE\"}"
        );
    }
    
    @Override
    public void handleTransportError(
            WebSocketSession session,
            Throwable exception) throws Exception {

        System.out.println(
            "ROBOT TRANSPORT ERROR : "
            + exception.getMessage()
        );

        template.convertAndSend(
            "/topic/status",
            "{\"type\":\"robot_connection\",\"status\":\"OFFLINE\"}"
        );

        System.out.println("ROBOT TRANSPORT ERROR → OFFLINE 전송");
    }
 

    @Override
    protected void handleTextMessage(
            WebSocketSession session,
            TextMessage message)
            throws Exception {

        String data = message.getPayload();

        System.out.println(data);
        
        JsonNode json = objectMapper.readTree(data);

        switch (json.get("type").asText()) {
	        case "battery":
	        	break;
	
	        case "robot_pose":
	            break;
	            
	        case "navigation_goal":
	        	Double goalX = json.get("x").asDouble();
	            Double goalY = json.get("y").asDouble();

	            RobotStatus robotStatusDto = new RobotStatus();

	            robotStatusDto.setEventType("state");
	            robotStatusDto.setGoalDestinationX(goalX);
	            robotStatusDto.setGoalDestinationY(goalY);

	            generalServiceI.updateRobotStatus(robotStatusDto);
	        	
	        	break;
	        
	        case "navigation_path":
	        	break;
	        
	        case "detection":
	        	break;
	        	
	        case "recycleHistory":
            	String objectName = json.has("object_name") ? json.get("object_name").asText() : "";
                String status = json.has("status") ? json.get("status").asText() : "Success";
                
                RecycleHistoryDto dto = new RecycleHistoryDto();
                dto.setObjectType(objectName);
                dto.setStatus(status);
                
                recycleHistoryServiceI.insertRecycleHistory(dto);
                break;
                
	        case "robot_status":
        		RobotStatus robotStatus = new RobotStatus();

        	    robotStatus.setEventType(json.get("eventType").asText());
        	    robotStatus.setStatus(json.get("status").asText());
        	    
        	    RobotStatus getRobotStatus = new RobotStatus();
        	    getRobotStatus.setEventType("state");

        	    if(generalServiceI.getRobotStatusCount(getRobotStatus) > 0) {
        	    	generalServiceI.updateRobotStatus(robotStatus);
        	    }else {
        	    	generalServiceI.insertRobotStatus(robotStatus);
        	    }
        	    
        		break;
	        	
        	case "robot_task":
        		EventLogDto eventLogDto = new EventLogDto();
        		eventLogDto.setEventType(json.get("eventType").asText());
        		eventLogDto.setMessage(json.get("message").asText());
        		eventLogDto.setNote(json.get("note").asText());
        		eventLogDto.setStatus(json.get("status").asText());
        		
        		eventLogServiceI.insertEventLog(eventLogDto);
        		break;
        	
        	case "system":
        		break;
        }

        template.convertAndSend(
            "/topic/status",
            data
        );
    }
    
    @Override
    protected void handleBinaryMessage(
            WebSocketSession session, BinaryMessage message) {
    	
    	ByteBuffer buffer = message.getPayload();
        byte[] bytes = new byte[buffer.remaining()];
        buffer.get(bytes);

        latestFrame = bytes;
    }


    public byte[] getLatestFrame() {
        return latestFrame;
    }
}