package com.example.recycle.recycleHistory.service;

import com.example.recycle.dao.RecycleHistoryDao;
import com.example.recycle.dto.RecycleHistoryDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RecycleHistoryService implements RecycleHistoryServiceI{
    @Autowired
    private RecycleHistoryDao recycleHistoryDao;

    @Override
    public RecycleHistoryDto getCollectionCount(RecycleHistoryDto recycleHistoryDto) throws Exception {
        return recycleHistoryDao.getCollectionCount(recycleHistoryDto);
    }

    @Override
    public List<RecycleHistoryDto> getTypeChartData(RecycleHistoryDto recycleHistoryDto) throws Exception {
        return recycleHistoryDao.getTypeChartData(recycleHistoryDto);
    }

    @Override
    public List<RecycleHistoryDto> getDateChartData(RecycleHistoryDto recycleHistoryDto) throws Exception {
        return recycleHistoryDao.getDateChartData(recycleHistoryDto);
    }
}
