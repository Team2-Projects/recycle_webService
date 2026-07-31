package com.example.recycle.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.recycle.dto.MapDto;

@Mapper
public interface MapDao {

	public MapDto getDefaultMap(MapDto mapDto) throws Exception;
	
}
