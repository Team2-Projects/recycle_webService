package com.example.recycle.eventLog.service;

import com.example.recycle.dto.EventLogDto;
import com.example.recycle.dto.SearchDto;

import java.util.List;

public interface EventLogServiceI {
    int getEventLogListCount(EventLogDto eventLogDto) throws Exception;

    List<EventLogDto> getEventLogList(EventLogDto eventLogDto) throws Exception;
    
    void insertEventLog(EventLogDto eventLogDto) throws Exception;

	EventLogDto getLastTask() throws Exception;
    
}
