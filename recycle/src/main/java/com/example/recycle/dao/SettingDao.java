package com.example.recycle.dao;

import com.example.recycle.dto.RobotDto;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface SettingDao {
    RobotDto getRobotInfo() throws Exception;
}
