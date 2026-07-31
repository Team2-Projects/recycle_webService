package com.example.recycle.recycleHistory.service;

import com.example.recycle.dto.RecycleHistoryDto;

import java.util.List;

public interface RecycleHistoryServiceI {
    RecycleHistoryDto getCollectionCount(RecycleHistoryDto recycleHistoryDto) throws Exception;

    List<RecycleHistoryDto> getTypeChartData(RecycleHistoryDto recycleHistoryDto) throws Exception;

    List<RecycleHistoryDto> getDateChartData(RecycleHistoryDto recycleHistoryDto) throws Exception;
}
