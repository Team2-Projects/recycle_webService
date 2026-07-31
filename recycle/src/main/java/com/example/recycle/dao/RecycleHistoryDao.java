package com.example.recycle.dao;

import com.example.recycle.dto.EventLogDto;
import com.example.recycle.dto.RecycleHistoryDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RecycleHistoryDao {

    RecycleHistoryDto getCollectionCount(RecycleHistoryDto recycleHistoryDto) throws Exception;

    List<RecycleHistoryDto> getTypeChartData(RecycleHistoryDto recycleHistoryDto) throws Exception;

    List<RecycleHistoryDto> getDateChartData(RecycleHistoryDto recycleHistoryDto) throws Exception;
}
