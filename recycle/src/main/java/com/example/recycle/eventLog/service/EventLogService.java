package com.example.recycle.eventLog.service;

import com.example.recycle.dao.EventLogDao;
import com.example.recycle.dto.EventLogDto;
import com.example.recycle.dto.SearchDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EventLogService implements EventLogServiceI {
    @Autowired
    private EventLogDao eventLogDao;

    @Override
    public int getEventLogListCount(EventLogDto eventLogDto) throws Exception {
        return eventLogDao.getEventLogCount(eventLogDto);
    }

    public List<EventLogDto> getEventLogList(EventLogDto eventLogDto) throws Exception{
        return eventLogDao.getEventLogList(eventLogDto);
    }
}
