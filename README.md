- recycle project: https://github.com/Team2-Projects/recycle_project

# Recycle Robot Monitoring Dashboard (쓰레기 분리수거 로봇 모니터링 대시보드)
- 자율 순찰 및 재활용품 수거 로봇을 실시간으로 모니터링하는 Web Dashboard

## 기술 스택
Backend
- Java 17
- Spring Boot 3.5.3
- Spring Security
- WebSocket
- MyBatis

Frontend
- HTML5
- CSS3
- JavaScript
- Chart.js

Database
- MySQL 8.0

## Architecture
```
ROS2 Robot
      │
      ▼
ROS Bridge
      │ WebSocket
      ▼
Spring Boot
      │
      ├── MySQL
      └── Dashboard
```
- Ros2 Topic 데이터를 Ros Bridge Node에서 수집
- WebSocket을 통해 Spring Boot 서버로 실시간 전달
- Dashboard에서 로봇 상태 및 작업 현황 시각화

## Feature
### Real-time Communication
- Websocket기반 실시간 데이터 송수신
- RobotHandler를 통한 로봇 데이터 수신
- CommandHandler를 통한 로봇 제어 명령 전달
### Robot Monitoring
- 로봇 배터리, 위치, 속도, 작업 상태 실시간 모니터링
- 로봇 CPU, Disk, Memory 상태 확인
### Recycle Management
- 객체 감지 결과 확인
- 수거 작업 이력 관리
- 수거 데이터 통계 및 시각

## 프로젝트 구조
```
com.recycle
 ├── controller
 ├── service
 ├── mapper
 ├── websocket
   ├── RobotHandler
   ├── CommandHandler
 ├── config
```
- MVC 패턴 기반으로 Controller, Service, Mapper 계층을 분리하여 구현
- Controller는 요청 처리, Service는 비즈니스 로직, Mapper는 DB 접근 담당
- WebSocket 패키지를 별도로 구성하여 실시간 로봇 데이터 통신 처리
- 로봇에서 데이터를 받아오는 RobotHandler와 로봇으로 데이터를 보내는 CommandHandler로 파일 구분

## DB
|Table|설명|
|--|--|
|user|사용자 정보 데이터 관리|
|robot|로봇 이름, 모델 버전 데이터 관리|
|robotStatus|로봇의 실시간 상태 데이터 관리|
|map|맵 이미지 위치 데이터 관리|
|eventLog|이벤트 로그 데이터 관리|
|recycleHistory|쓰레기 수거 현황 데이터 관리|

## 화면
### 대시보드
<img width="1919" height="943" alt="image" src="https://github.com/user-attachments/assets/cd133add-a156-4618-9c7e-fe0b3ff0302a" />

#### 주요 기능
- 실시간 배터리, 로봇 상태, 감지된 물체, 현재 진행중인 작업 표시
- 카메라 영상 스트리밍
- 로봇 위치 및 이동 경로, 도착지 표시
- 수동 제어(Start, Stop / Return Home) 기능
- WebSocket 기반으로 배터리, 위치, 작업 상태를 실시간 갱신

### 이벤트 로그
<img width="1919" height="945" alt="image" src="https://github.com/user-attachments/assets/91c72691-7905-41dc-8d61-f7e485c36518" />

#### 주요 기능
- 로봇 작업 이력 조회
- 이벤트 발생 시간 기록
- 순찰 시작, 순찰 종료, 객체 감지, 수거 성공, 사용자 명령 로그 확인

### 쓰레기 수거 현황
<img width="1919" height="944" alt="image" src="https://github.com/user-attachments/assets/12d6ef7d-e9f0-4905-9c28-e92aa3e3248b" />

#### 주요 기능
- 기간동안 수거한 전체 쓰레기 개수, 품목별 쓰레기 개수 표시
- 오늘 수거한 쓰레기 개수, 품목별 쓰레기 개수 표시
- Chart.js를 이용한 시각화

### 설정/정보
<img width="1919" height="944" alt="image" src="https://github.com/user-attachments/assets/307b89c5-d6ad-43dd-a1c6-f83934bf82ed" />

#### 주요 기능
- 로봇 이름, 모델, 버전 확인
- CPU, Disk, Memory 사용량 확인
