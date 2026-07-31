package com.example.recycle.dao;

import com.example.recycle.dto.EventLogDto;
import com.example.recycle.dto.SearchDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface EventLogDao {
    int getEventLogCount(EventLogDto eventLogDto) throws Exception;

    List<EventLogDto> getEventLogList(EventLogDto eventLogDto) throws Exception;

}
