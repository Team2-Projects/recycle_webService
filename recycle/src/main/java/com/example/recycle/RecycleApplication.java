package com.example.recycle;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class RecycleApplication {

    public static void main(String[] args) {
        SpringApplication.run(RecycleApplication.class, args);
    }

}