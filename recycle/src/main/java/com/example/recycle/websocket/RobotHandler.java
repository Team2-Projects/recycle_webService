package com.example.recycle.websocket;

import java.nio.ByteBuffer;

import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.handler.AbstractWebSocketHandler;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class RobotHandler extends AbstractWebSocketHandler {


    private final SimpMessagingTemplate template;
    
    private volatile byte[] latestFrame;


    public RobotHandler(SimpMessagingTemplate template) {
        this.template = template;
    }

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

    /*@Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

        String payload = message.getPayload();
        ObjectMapper mapper = new ObjectMapper();
        JsonNode json = mapper.readTree(payload);
        String topic = json.get("topic").asText();

        template.convertAndSend(
                "/topic/" + topic,
                json.get("data")
        );
    }*/
}