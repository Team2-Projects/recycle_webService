package com.example.recycle.dto;

import lombok.Data;

@Data
public class RobotStatus {

    private int battery;
    private double x;
    private double y;
    private double speed;
    private String state;
    
    private int robotId;
    private String eventType;
    private String status;
    
    private String connect;

    private double goalDestinationX;
    private double goalDestinationY;
}