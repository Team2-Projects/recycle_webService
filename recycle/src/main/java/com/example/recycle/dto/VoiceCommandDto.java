package com.example.recycle.dto;

import java.time.LocalDate;
import java.time.LocalTime;

import lombok.Data;

@Data
public class VoiceCommandDto {
	private int uid;
    private String command;     
    private String createTime;   

}