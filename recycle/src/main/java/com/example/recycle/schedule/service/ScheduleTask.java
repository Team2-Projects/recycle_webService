package com.example.recycle.schedule.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.example.recycle.dto.ScheduleDto;
import com.example.recycle.websocket.CommandHandler;

@Component
public class ScheduleTask {

    @Autowired
    private ScheduleServiceI scheduleService;

    @Autowired
    private CommandHandler commandHandler;

    @Autowired
    private SimpMessagingTemplate template;

    // 1초마다 실행할 스케줄 확인
    @Scheduled(cron = "0 * * * * *")
    public void checkSchedule() {

        try {

            List<ScheduleDto> scheduleList =
                    scheduleService.getReadyScheduleList();

            for (ScheduleDto schedule : scheduleList) {

                System.out.println(
                    "예약 시간 도달 : "
                    + schedule.getScheduleName()
                    + " / "
                    + schedule.getExecutionTime()
                );

                // ROS로 START 신호 전송
                commandHandler.sendToRos(
                    "{\"type\":\"command\",\"command\":\"START\"}"
                );
                

                // 같은 스케줄이 계속 실행되는 것 방지
                schedule.setStatus("RUNNING");

                scheduleService.updateSchedule(schedule);
                
                template.convertAndSend(
                    "/topic/status",
                    "{\"type\":\"schedule_command\",\"command\":\"START\",\"status\":\"SENT\"}"
                );

                System.out.println(
                    "스케줄 START 완료 : "
                    + schedule.getScheduleName()
                );
            }

        } catch (Exception e) {

            System.out.println(
                "스케줄 자동 실행 오류 : "
                + e.getMessage()
            );

            e.printStackTrace();
        }
    }
}