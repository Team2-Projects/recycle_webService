package com.example.recycle.websocket;


import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/camera")
public class CameraController {

    private final RobotHandler robotHandler;

    public CameraController(RobotHandler robotHandler){
        this.robotHandler = robotHandler;
    }



    @GetMapping(value = "/frame", produces = MediaType.IMAGE_JPEG_VALUE)
    public ResponseEntity<byte[]> getFrame() {

        byte[] image = robotHandler.getLatestFrame();

        // 아직 카메라 데이터가 없는 경우
        if (image == null) {
            return ResponseEntity.noContent().build();
        }

        return ResponseEntity
                .ok()
                .contentType(MediaType.IMAGE_JPEG)
                .body(image);
    }
}