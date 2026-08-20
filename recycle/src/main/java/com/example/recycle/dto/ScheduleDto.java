package com.example.recycle.dto;

import java.time.LocalDate;
import java.time.LocalTime;

import lombok.Data;

@Data
public class ScheduleDto {

    private String scheduleId;       // CHAR(30)
    private String scheduleName;     // VARCHAR(100)
    private LocalDate scheduleDate;  // DATE
    private LocalTime executionTime; // TIME
    private String status;           // VARCHAR(20)
    private String task;             // VARCHAR(100)
    private String description;      // TEXT

}