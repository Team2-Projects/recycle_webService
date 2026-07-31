package com.example.recycle.general.controller;

import com.example.recycle.general.service.GeneralService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.example.recycle.dto.UserDto;

@Controller
public class GeneralController {
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private GeneralService generalService;

	// 로그인 페이지
    @GetMapping("/login")
    public String login() {
        return "forward:/index.html";
    }

    // 메인 페이지
    @GetMapping("/")
    public String home() {
        return "forward:/index.html";
    }

    // 로그인 성공 후 이동할 페이지
    @GetMapping("/dashboard")
    public String dashboard() {
        return "forward:/pages/dashboard.html";
    }

    @PostMapping("/join")
    @ResponseBody
    public ResponseEntity<Void> join(@RequestBody UserDto userDto) throws Exception{
        userDto.setPassword(passwordEncoder.encode(userDto.getPassword()));

        generalService.join(userDto);
        return ResponseEntity.ok().build();
    }
}