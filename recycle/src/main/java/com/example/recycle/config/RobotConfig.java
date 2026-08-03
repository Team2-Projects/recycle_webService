package com.example.recycle.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.standard.ServletServerContainerFactoryBean;

import com.example.recycle.websocket.CommandHandler;
import com.example.recycle.websocket.RobotHandler;

@Configuration
@EnableWebSocket
public class RobotConfig implements WebSocketConfigurer {

	@Autowired
    private RobotHandler robotHandler;
	@Autowired
    private CommandHandler commandHandler;


    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(robotHandler, "/robot").setAllowedOrigins("*");
        registry.addHandler(commandHandler, "/robot_command").setAllowedOrigins("*");
    }
    
    
    
    @Bean
    public ServletServerContainerFactoryBean createWebSocketContainer() {

        ServletServerContainerFactoryBean container =
                new ServletServerContainerFactoryBean();

        container.setMaxBinaryMessageBufferSize(1024 * 1024 * 5);
        container.setMaxTextMessageBufferSize(1024 * 1024);

        return container;
    }
}
