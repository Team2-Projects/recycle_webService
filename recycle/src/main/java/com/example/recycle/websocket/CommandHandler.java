package com.example.recycle.websocket;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class CommandHandler extends TextWebSocketHandler {

    private WebSocketSession session;

    @Override
    public void afterConnectionEstablished(
            WebSocketSession session) {

        System.out.println("COMMAND CONNECT : " + session.getId());

        this.session = session;
    }


    public void sendToRos(String data) throws Exception {

        if(session != null && session.isOpen()) {
            session.sendMessage(
                new TextMessage(data)
            );
        }
    }
}
