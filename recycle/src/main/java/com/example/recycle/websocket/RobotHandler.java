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
    protected void handleTextMessage(
            WebSocketSession session,
            TextMessage message)
            throws Exception {

        String data = message.getPayload();

        System.out.println(data);
        
        JsonNode json = objectMapper.readTree(data);

        switch (json.get("type").asText()) {
        	case "robot_task":
        		EventLogDto eventLogDto = new EventLogDto();
        		eventLogDto.setEventType(json.get("eventType").asText());
        		eventLogDto.setMessage(json.get("message").asText());
        		eventLogDto.setNote(json.get("note").asText());
        		eventLogDto.setStatus(json.get("status").asText());
        		
        		eventLogServiceI.insertEventLog(eventLogDto);
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
            case "battery":
                break;

            case "robot_pose":
                break;

            case "recycleHistory":
            	String objectName = json.has("object_name") ? json.get("object_name").asText() : "";
                String status = json.has("status") ? json.get("status").asText() : "Success";
                
                RecycleHistoryDto dto = new RecycleHistoryDto();
                dto.setObjectType(objectName);
                dto.setStatus(status);
                
                recycleHistoryServiceI.insertRecycleHistory(dto);
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
        System.out.println(
                "camera frame : " + latestFrame.length
        );
    }


    public byte[] getLatestFrame() {
        return latestFrame;
    }
}