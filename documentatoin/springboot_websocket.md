

# 스프링부트 웹 소켓사용 설정
```java
@Configuration
public class WebsocketConfig {
    @Bean
    public ServerEndpointExporter serverEndpointExporter() {
        return new ServerEndpointExporter();
    }
}
```

<br>

# 핸들러 등록
* 컴퍼넌트 등록
* Endpoint 설정: /sock으로 들어오는 세션은 웹소켓으로 간주
```java
@Component
@ServerEndpoint(value = "/sock")
@Log
public class SocketHandler {
    private Session session;
    private static Set<SocketHandler> sockets = new CopyOnWriteArraySet<>();
    private static int onlineCount = 0;

    /***
     * 소켓이 연결될 때
     * @param session
     */
    @OnOpen
    public void onOpen(Session session){
        this.session = session;
        onlineCount++;
        sockets.add(this); // 소켓 추가
        log.info("[*] Connected : ");
    }

    /***
     * 클라이어트로부터 메세지를 전달 받을 떄
     * @param message
     */
    @OnMessage
    public void onMessage(String message){
        log.info("[*] onMessage called : " + message);
    }

    /***
     * 연결 종료
     */
    @OnClose
    public void onClose(){
        sockets.remove(this);
        onlineCount--;
        log.info("[*] Disconnected");
    }
}
```

<br>

# 참고자료
* [1] 중국 github-jsch&websocket 연동: https://github.com/r0n9/web-ssh/blob/af7a6ed1b5a693a3b0eb2b2e57521930f32be744/src/main/java/vip/r0n9/ws/WebSshHandler.java
* [2] 중국 블로그-websocket&ssh 연동: https://www.jianshu.com/p/b4ff8dcb8413
* [3] 블로그-springboot webscoekt 시작코드: https://kouzie.github.io/spring/Spring-Boot-%EC%8A%A4%ED%94%84%EB%A7%81-%EB%B6%80%ED%8A%B8-WebSocket/#polling-long-polling