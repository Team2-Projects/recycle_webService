package com.example.recycle.dto;

import lombok.Data;

@Data
public class EventLogDto {
    private int robotId;
    private String eventType;
    private String message;
    private String note;
    private String status;
    private String createTime;

    private SearchDto searchDto;
}
