package com.example.recycle.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.recycle.dto.ScheduleDto;
import com.example.recycle.dto.VoiceCommandDto;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ScheduleDao {

    List<ScheduleDto> getScheduleList(ScheduleDto scheduleDto) throws Exception;

	int updateSchedule(ScheduleDto scheduleDto) throws Exception;
	int insertSchedule(ScheduleDto scheduleDto) throws Exception;
	int deleteSchedule(ScheduleDto scheduleDto) throws Exception;
	int updateRunningScheduleStatus(@Param("status") String status) throws Exception;

	List<VoiceCommandDto> getVoiceCommandList(VoiceCommandDto voiceCommandDto) throws Exception;
	
	List<ScheduleDto> getReadyScheduleList() throws Exception;
}