package com.example.recycle.dto;

import lombok.Data;

@Data
public class MapDto {
	private int uid;
	private String mapName;
	private String imagePath;
	private double resolution;
	private double originX;
	private double originY;
	private double originTheta;
	private int width;
	private int height;
	private Boolean isDefault;
}
