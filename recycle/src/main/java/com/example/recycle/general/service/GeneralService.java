package com.example.recycle.general.service;

import com.example.recycle.dao.GeneralDao;
import com.example.recycle.dto.RobotStatus;
import com.example.recycle.dto.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GeneralService implements GeneralServiceI{

    @Autowired
    private GeneralDao generalDao;

    @Override
    public void join(UserDto userDto) throws Exception {
        generalDao.join(userDto);
    }

	@Override
	public void insertRobotStatus(RobotStatus robotStatus) throws Exception {
		generalDao.insertRobotStatus(robotStatus);
	}

	@Override
	public void updateRobotStatus(RobotStatus robotStatus) throws Exception {
		generalDao.updateRobotStatus(robotStatus);
	}

	@Override
	public int getRobotStatusCount(RobotStatus robotStatus) throws Exception {
		return generalDao.getRobotStatusCount(robotStatus);
	}

	@Override
	public RobotStatus getRobotStatus(RobotStatus robotStatus) throws Exception {
		return generalDao.getRobotStatus(robotStatus);
	}
}
