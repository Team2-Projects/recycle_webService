package com.example.recycle.setting.controller;

import com.example.recycle.dto.RobotDto;
import com.example.recycle.setting.service.SettingServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SettingController {
    @Autowired
    public SettingServiceI settingService;

    @GetMapping("/setting")
    public String dashboard() {
        return "forward:/pages/setting.html";
    }

    @PostMapping("/setting/getRobotInfo")
    @ResponseBody
    public RobotDto getRobotInfo() throws Exception {
        return settingService.getRobotInfo();
    }
}
