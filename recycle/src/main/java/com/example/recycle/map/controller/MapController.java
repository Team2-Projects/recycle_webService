package com.example.recycle.map.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.recycle.dto.MapDto;
import com.example.recycle.map.service.MapServiceI;

@Controller
public class MapController {
	@Autowired
	private MapServiceI mapServiceI;
	
	@PostMapping("/map/getDefaultMap")
    @ResponseBody
    public MapDto getDefaultMap(@RequestBody MapDto mapDto) throws Exception{
        return mapServiceI.getDefaultMap(mapDto);
    }
}
