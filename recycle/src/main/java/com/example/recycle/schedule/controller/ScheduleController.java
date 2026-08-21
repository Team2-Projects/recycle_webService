package com.example.recycle.schedule.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.recycle.dto.ScheduleDto;
import com.example.recycle.dto.VoiceCommandDto;
import com.example.recycle.schedule.service.ScheduleServiceI;

@Controller
public class ScheduleController {

    @Autowired
    private ScheduleServiceI scheduleService;

    @GetMapping("/schedule")
    public String eventLog() {
        return "forward:/pages/schedule.html";
    }

    @PostMapping("/schedule/list")
    @ResponseBody
    public List<ScheduleDto> getScheduleList(@RequestBody ScheduleDto scheduleDto) throws Exception {
        return scheduleService.getScheduleList(scheduleDto);
    }
    
    @PostMapping("/schedule/update")
    @ResponseBody
    public int updateSchedule(@RequestBody ScheduleDto scheduleDto) throws Exception{
    	return scheduleService.updateSchedule(scheduleDto);
    }
    
    @PostMapping("/schedule/insert")
    @ResponseBody
    public int insertSchedule(@RequestBody ScheduleDto scheduleDto) throws Exception{
    	scheduleService.insertSchedule(scheduleDto);
    	return scheduleDto.getUid();
    }
    
    @PostMapping("/schedule/delete")
    @ResponseBody
    public int deleteSchedule(@RequestBody ScheduleDto scheduleDto) throws Exception{
    	return scheduleService.deleteSchedule(scheduleDto);
    }
    
    @PostMapping("/schedule/voiceList")
    @ResponseBody
    public List<VoiceCommandDto> getVoiceCommandList(@RequestBody VoiceCommandDto voiceCommandDto) throws Exception{
    	return scheduleService.getVoiceCommandList(voiceCommandDto);
    }

}