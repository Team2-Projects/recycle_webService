package com.example.recycle.general.service;

import com.example.recycle.dao.GeneralDao;
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
}
