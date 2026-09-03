package com.example.recycle.schedule.service;

import java.util.List;

import com.example.recycle.dto.ScheduleDto;
import com.example.recycle.dto.VoiceCommandDto;

public interface ScheduleServiceI {

    List<ScheduleDto> getScheduleList(ScheduleDto scheduleDto) throws Exception;

	int updateSchedule(ScheduleDto scheduleDto) throws Exception;
	long insertSchedule(ScheduleDto scheduleDto) throws Exception;
	int deleteSchedule(ScheduleDto scheduleDto) throws Exception;
	int updateRunningScheduleStatus(String status) throws Exception;
	
	List<VoiceCommandDto> getVoiceCommandList(VoiceCommandDto voiceCommandDto) throws Exception;
	
	List<ScheduleDto> getReadyScheduleList() throws Exception;

}