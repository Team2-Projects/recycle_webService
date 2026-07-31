package com.example.recycle.eventLog.controller;

import com.example.recycle.dto.EventLogDto;
import com.example.recycle.dto.SearchDto;
import com.example.recycle.eventLog.service.EventLogServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class EventLogController {
    @Autowired
    private EventLogServiceI eventLogService;

    @GetMapping("/eventLog")
    public String eventLog() {
        return "forward:/pages/eventLog.html";
    }

    @ResponseBody
    @PostMapping("/eventLog/listCount")
    public int eventLogListCount(@RequestBody EventLogDto eventLogDto) throws Exception {
        return eventLogService.getEventLogListCount(eventLogDto);
    }

    @ResponseBody
    @PostMapping("/eventLog/list")
    public List<EventLogDto> eventLogList(@RequestBody EventLogDto eventLogDto) throws Exception {
        return eventLogService.getEventLogList(eventLogDto);
    }

}