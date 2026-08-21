package com.example.recycle.schedule.service;

import java.util.List;

import com.example.recycle.dto.ScheduleDto;

public interface ScheduleServiceI {

    List<ScheduleDto> getScheduleList(ScheduleDto scheduleDto) throws Exception;

	int updateSchedule(ScheduleDto scheduleDto) throws Exception;
	int insertSchedule(ScheduleDto scheduleDto) throws Exception;
	int deleteSchedule(ScheduleDto scheduleDto) throws Exception;

}