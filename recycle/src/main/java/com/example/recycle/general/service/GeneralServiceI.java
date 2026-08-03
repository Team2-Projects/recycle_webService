package com.example.recycle.general.service;

import com.example.recycle.dto.RobotStatus;
import com.example.recycle.dto.UserDto;

public interface GeneralServiceI {
    void join(UserDto userDto) throws Exception;
    
    RobotStatus getRobotStatus(RobotStatus robotStatus) throws Exception;
    int getRobotStatusCount(RobotStatus robotStatus) throws Exception;
    void insertRobotStatus(RobotStatus robotStatus) throws Exception;
    void updateRobotStatus(RobotStatus robotStatsu) throws Exception;
}
