- 질문을 2가지 버전으로 따로 관리하려는 이유 

  -  음성으로 출력하는 과정에서 기존 텍스트 수정하지 않고 출력은 ssml버전으로 따로 관리함으로 질문 원본의 보존성 상승, ssml문법을 사용하여 면접자에게 더욱 질좋은 서비스를 제공 가능 할것으로 기대됨.


---

---

---

```java
테스트 시간 : 3시간, 테스트하는데 고려된 질문갯수 약 50개
*  기존 텍스트 버젼 EX.MP3파일
*  SSML버전 EX.ssml.MP3파일
```

- 예외 상황 1 ]  특정 문맥에서 특수문자를 면접자가 알아듣기 힘들게 말하는 경우

```java
EX1 : "웹 통신의 큰 흐름 http://google.com/ 접속할때 일어나는 일"
```

```java
EX1.ssml : 
<speak>
	<prosody pitch="-2st">웹 통신의 큰 흐름.</prosody> 
    <sub alias="에이치 티티피 구글 닷 컴에">http://google.com/</sub>
	접속할때 일어나는 일.
</speak>
```

- 예외 상황 2 ] 영어와 한국어의 연결음이 부자연스러울때

```java
EX2 : "TCP와 UDP의 차이점에 대해서 설명해보세요."
```

```java
EX2.ssml : 
<speak> 
    TCP와 UDP<break time="250ms"/> 의 차이점에 대해서 설명해보세요.
</speak>
```

- 예외 상황 3 ] 숫자뒤에 영어의 연결음이 부자연스러울때( 개선은 됐으나 숫자를 끊어서 말할때 부자연 스러움 )

```java
EX3 : "TCP3, 4 way handshake에 대해서 설명해보세요."
```

```java
EX3.ssml : 
<speak>
    <prosody pitch="-5st">TCP 3,4 way handshake에 대해서 설명해보세요.</prosody>
</speak>
```

- 예외 상황 4 ] gRPC와 RPG의 발음이 비슷하게 들려 인식하기 힘든 경우

```java
EX4 : "gRPC는 무엇이며, RPC는 무엇인가요? 왜 쓸까요?"
```

```java
EX4.ssml : 
<speak>
	G<break time="50ms"/>RPC는 무엇이며, RPC는 무엇인가요? 왜 쓸까요?
</speak>
```

- 예외 상황 5 ]  괄호안의 문자를 읽을 필요가 없을 경우

```java
EX5 :
"점진적 향상법(progressive enhancement)과 우아한 성능저하법(graceful degradation)의 차이를 설명하실 수 있습니까?"
```

```java
EX5.ssml : 
<speak>
점진적 향상법과<sub alias="">(progressive enhancement)</sub>
    우아한 성능저하법<sub alias="">(graceful degradation)</sub>의 차이를 설명하실 수 있습니까?
</speak>
```

