package com.example.recycle.dto;

import lombok.Data;

@Data
public class RobotStatus {

    private int battery;
    private double x;
    private double y;
    private double speed;
    private String state;
}