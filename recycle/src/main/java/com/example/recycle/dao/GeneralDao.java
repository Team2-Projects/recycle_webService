package com.example.recycle.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.recycle.dto.RobotStatus;
import com.example.recycle.dto.UserDto;

@Mapper
public interface GeneralDao {
	 UserDto findByUserId(String userId);
	 int join(UserDto userDto) throws Exception;
	 
	 RobotStatus getRobotStatus(RobotStatus robotStatus) throws Exception;
	 int getRobotStatusCount(RobotStatus robotStatus) throws Exception;
	 void insertRobotStatus(RobotStatus robotStatus) throws Exception;
	 void updateRobotStatus(RobotStatus robotStatus) throws Exception;
}
