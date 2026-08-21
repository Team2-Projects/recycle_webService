package com.example.recycle.dto;

import java.time.LocalDate;
import java.time.LocalTime;

import lombok.Data;

@Data
public class ScheduleDto {
	private int uid;
    private String scheduleId;     
    private String scheduleName;   
    private String scheduleDate; 
    private String executionTime; 
    private String status;        
    private String task;          
    private String description;   

}