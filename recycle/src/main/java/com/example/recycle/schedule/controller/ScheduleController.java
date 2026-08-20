package com.example.recycle.schedule.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.recycle.schedule.service.ScheduleServiceI;

@Controller
public class ScheduleController {
	@Autowired
    private ScheduleServiceI scheduleService;

    @GetMapping("/schedule")
    public String eventLog() {
        return "forward:/pages/schedule.html";
    }
}
