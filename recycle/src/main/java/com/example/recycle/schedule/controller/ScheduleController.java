package com.example.recycle.schedule.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.recycle.dto.ScheduleDto;
import com.example.recycle.schedule.service.ScheduleServiceI;

@Controller
public class ScheduleController {

    @Autowired
    private ScheduleServiceI scheduleService;

    @GetMapping("/schedule")
    public String eventLog() {
        return "forward:/pages/schedule.html";
    }

    @GetMapping("/schedule/list")
    @ResponseBody
    public List<ScheduleDto> getScheduleList() {
        return scheduleService.getScheduleList();
    }

}