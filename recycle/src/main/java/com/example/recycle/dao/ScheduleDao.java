package com.example.recycle.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.recycle.dto.ScheduleDto;

@Mapper
public interface ScheduleDao {

    List<ScheduleDto> getScheduleList(ScheduleDto scheduleDto) throws Exception;

	int updateSchedule(ScheduleDto scheduleDto) throws Exception;
	int insertSchedule(ScheduleDto scheduleDto) throws Exception;
	int deleteSchedule(ScheduleDto scheduleDto) throws Exception;
}