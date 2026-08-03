package com.example.recycle.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.stereotype.Controller;

import com.example.recycle.websocket.CommandHandler;

@Controller
public class StompController {
	
	 @Autowired
    private CommandHandler commandHandler;

	@MessageMapping("/command")
    public void command(String message) throws Exception {
        commandHandler.sendToRos(message);

    }
}
