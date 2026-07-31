package com.example.recycle.recycleHistory.controller;

import com.example.recycle.dto.RecycleHistoryDto;
import com.example.recycle.recycleHistory.service.RecycleHistoryServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class RecycleHistoryController {
    @Autowired
    private RecycleHistoryServiceI recycleHistoryService;

    @GetMapping("/recycleHistory")
    public String eventLog() {
        return "forward:/pages/recycleHistory.html";
    }

    @PostMapping("/recycleHistory/getCollectionCount")
    @ResponseBody
    public RecycleHistoryDto getCollectionCount(@RequestBody RecycleHistoryDto recycleHistoryDto) throws Exception{
        return recycleHistoryService.getCollectionCount(recycleHistoryDto);
    }

    @PostMapping("/recycleHistory/getTypeChartData")
    @ResponseBody
    public List<RecycleHistoryDto> getTypeChartData(@RequestBody RecycleHistoryDto recycleHistoryDto) throws Exception{
        return recycleHistoryService.getTypeChartData(recycleHistoryDto);
    }

    @PostMapping("/recycleHistory/getDateChartData")
    @ResponseBody
    public List<RecycleHistoryDto> getDateChartData(@RequestBody RecycleHistoryDto recycleHistoryDto) throws Exception{
        return recycleHistoryService.getDateChartData(recycleHistoryDto);
    }
}
