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

import com.example.recycle.dto.RobotStatus;
import com.example.recycle.general.service.GeneralServiceI;
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
    
    private volatile byte[] latestFrame;

//    @Override
//    public void afterConnectionEstablished(
//            WebSocketSession session) {
//
//        System.out.println(
//            "ROS CONNECT : " + session.getId()
//        );
//    }
//    @Override
//    public void afterConnectionClosed(
//            WebSocketSession session,
//            CloseStatus status) {
//
//        System.out.println(
//            "ROS CLOSED : " + status
//        );
//    }
    
    
    

    @Override
    protected void handleTextMessage(
            WebSocketSession session,
            TextMessage message)
            throws Exception {

        String data = message.getPayload();

        System.out.println(data);
        
        JsonNode json = objectMapper.readTree(data);

        switch (json.get("type").asText()) {

        	case "robot_status":
        		RobotStatus robotStatus = new RobotStatus();

        	    robotStatus.setEventType(json.get("eventType").asText());
        	    robotStatus.setStatus(json.get("status").asText());

        	    
        	    generalServiceI.insertRobotStatus(robotStatus);
        		break;
            case "event":
//                eventService.saveEvent(json);
                break;

            case "battery":
                break;

            case "robot_pose":
                break;

            case "detection":
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