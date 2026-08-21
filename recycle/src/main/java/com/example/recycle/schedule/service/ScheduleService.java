package com.example.recycle.schedule.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.recycle.dao.ScheduleDao;
import com.example.recycle.dto.ScheduleDto;
import com.example.recycle.dto.VoiceCommandDto;

@Service
public class ScheduleService implements ScheduleServiceI {

    @Autowired
    private ScheduleDao scheduleDao;

    @Override
    public List<ScheduleDto> getScheduleList(ScheduleDto scheduleDto) throws Exception {
        return scheduleDao.getScheduleList(scheduleDto);
    }

	@Override
	public int updateSchedule(ScheduleDto scheduleDto) throws Exception {
		return scheduleDao.updateSchedule(scheduleDto);
	}

	@Override
	public int insertSchedule(ScheduleDto scheduleDto) throws Exception {
		return scheduleDao.insertSchedule(scheduleDto);
	}

	@Override
	public int deleteSchedule(ScheduleDto scheduleDto) throws Exception {
		return scheduleDao.deleteSchedule(scheduleDto);
	}

	@Override
	public List<VoiceCommandDto> getVoiceCommandList(VoiceCommandDto voiceCommandDto) throws Exception {
		return scheduleDao.getVoiceCommandList(voiceCommandDto);
	}

}