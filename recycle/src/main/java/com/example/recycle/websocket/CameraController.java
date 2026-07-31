package com.example.recycle.websocket;

import java.io.OutputStream;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpServletResponse;

@RestController
@RequestMapping("/camera")
public class CameraController {

    private final RobotHandler robotHandler;

    public CameraController(RobotHandler robotHandler){
        this.robotHandler = robotHandler;
    }



    @GetMapping("/stream")
    public void stream(HttpServletResponse response) throws Exception {

        response.setContentType(
            "multipart/x-mixed-replace; boundary=frame"
        );

        OutputStream out = response.getOutputStream();

        while(true){
            byte[] image = robotHandler.getLatestFrame();

            if(image != null){
                out.write(
                    "--frame\r\n".getBytes()
                );
                out.write(
                    "Content-Type: image/jpeg\r\n\r\n"
                    .getBytes()
                );
                out.write(image);
                out.write(
                    "\r\n".getBytes()
                );
                out.flush();
            }

            Thread.sleep(100);
        }
    }
}