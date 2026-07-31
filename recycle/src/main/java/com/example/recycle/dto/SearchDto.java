package com.example.recycle.dto;

import lombok.Data;

@Data
public class SearchDto {
    private int page;
    private int pageSize;
    private int offset;

    private String startDate;
    private String endDate;

    private String type;
}
