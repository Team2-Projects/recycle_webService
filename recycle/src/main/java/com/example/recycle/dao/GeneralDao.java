package com.example.recycle.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.recycle.dto.UserDto;

@Mapper
public interface GeneralDao {
	 UserDto findByUserId(String userId);
	 int join(UserDto userDto) throws Exception;
}
