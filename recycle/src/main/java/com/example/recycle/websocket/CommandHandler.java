package com.example.recycle.websocket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class CommandHandler extends TextWebSocketHandler {

    private WebSocketSession session;
    
    @Autowired
    private SimpMessagingTemplate template;

    @Override
    public void afterConnectionEstablished(
            WebSocketSession session) {

        System.out.println("COMMAND CONNECT : " + session.getId());

        this.session = session;
    }
    
    @Override
    public void afterConnectionClosed(
            WebSocketSession session,
            CloseStatus status) throws Exception {

        System.out.println(
            "COMMAND DISCONNECT : "
            + session.getId()
            + " / "
            + status
        );

        this.session = null;

        template.convertAndSend(
            "/topic/status",
            "{\"type\":\"robot_connection\",\"status\":\"OFFLINE\"}"
        );
        
        System.out.println("COMMAND OFFLINE 메시지 전송");
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


    public void sendToRos(String data) throws Exception {

        if(session != null && session.isOpen()) {
            session.sendMessage(
                new TextMessage(data)
            );
        }
    }
}
