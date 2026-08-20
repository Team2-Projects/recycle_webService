package com.example.recycle.schedule.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.recycle.dao.ScheduleDao;
import com.example.recycle.dto.ScheduleDto;

@Service
public class ScheduleService implements ScheduleServiceI {

    @Autowired
    private ScheduleDao scheduleDao;

    @Override
    public List<ScheduleDto> getScheduleList() {
        return scheduleDao.getScheduleList();
    }

}