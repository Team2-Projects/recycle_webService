package com.example.recycle.setting.service;

import com.example.recycle.dao.SettingDao;
import com.example.recycle.dto.RobotDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SettingService implements SettingServiceI{
    @Autowired
    public SettingDao settingDao;

    @Override
    public RobotDto getRobotInfo() throws Exception {
        return settingDao.getRobotInfo();
    }
}
