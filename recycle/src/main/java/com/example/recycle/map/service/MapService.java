package com.example.recycle.map.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.recycle.dao.MapDao;
import com.example.recycle.dto.MapDto;

@Service
public class MapService implements MapServiceI {
	@Autowired
	private MapDao mapDao;

	@Override
	public MapDto getDefaultMap(MapDto mapDto) throws Exception {
		return mapDao.getDefaultMap(mapDto);
	}

}
