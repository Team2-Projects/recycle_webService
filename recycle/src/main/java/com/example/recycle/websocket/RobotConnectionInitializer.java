package com.example.recycle.websocket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import jakarta.annotation.PostConstruct;

import com.example.recycle.dto.RobotStatus;
import com.example.recycle.general.service.GeneralServiceI;

@Component
public class RobotConnectionInitializer {

    @Autowired
    private GeneralServiceI generalServiceI;

    @PostConstruct
    public void init() throws Exception {

        RobotStatus robotStatus = new RobotStatus();

        robotStatus.setEventType("state");
        robotStatus.setConnect("DISCONNECT");

        generalServiceI.updateRobotStatus(robotStatus);
    }
}