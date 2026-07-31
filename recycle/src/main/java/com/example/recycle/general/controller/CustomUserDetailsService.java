package com.example.recycle.general.controller;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;

import com.example.recycle.dao.GeneralDao;
import com.example.recycle.dto.UserDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
    private final GeneralDao generalDao;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        UserDto user = generalDao.findByUserId(username);

        if(user == null){
            throw new UsernameNotFoundException(username);
        }

        return User.builder()
                .username(user.getId())
                .password(user.getPassword())
                .build();
    }
}