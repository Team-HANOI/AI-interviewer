- GOOGLE (Text-To-Speech)

  - 한국어 음성기능

    ```java
    한국어(대한민국)	표준	ko-KR	ko-KR-Standard-A	여성	
    한국어(대한민국)	표준	ko-KR	ko-KR-Standard-B	여성	
    한국어(대한민국)	표준	ko-KR	ko-KR-Standard-C	남성	
    한국어(대한민국)	표준	ko-KR	ko-KR-Standard-D	남성	
    한국어(대한민국)	WaveNet	ko-KR	ko-KR-Wavenet-A	여성	
    한국어(대한민국)	WaveNet	ko-KR	ko-KR-Wavenet-B	여성	
    한국어(대한민국)	WaveNet	ko-KR	ko-KR-Wavenet-C	남성	
    한국어(대한민국)	WaveNet	ko-KR	ko-KR-Wavenet-D	남성
    ```

  - SSML(음성 합성 마크업 언어) 태그

    ```java
    https://cloud.google.com/text-to-speech/docs/ssml
    
    * 확인용 데모페이지
    https://cloud.google.com/text-to-speech/?_ga=2.100307742.-1231827561.1628327914#section-2
    ```

  - <break>

    ```java
    time	
    초나 밀리초 단위로 음성 중지의 길이를 설정합니다(예: '3s' 또는 '250ms').
    
    strength	
    출력 음성의 운율적 중지의 강도를 상대적 용어로 설정합니다. 유효한 값은 'x-weak', 'weak', 'medium', 'strong', 'x-strong'입니다. 'none' 값은 운율적 중지 경계가 출력되어서는 안 됨을 나타내며, 설정된 값이 없을 경우 프로세서가 생성하는 운율적 중지를 방지하는 데 사용할 수 있습니다. 다른 값은 토큰 사이의 점증적인(단조 비감소) 중지 강도를 나타냅니다. 일반적으로 중지 경계가 뚜렷하면 끊어 읽기가 됩니다.
    
    <speak>
      Step 1, take a deep breath. <break time="200ms"/>
      Step 2, exhale.
      Step 3, take a deep breath again. <break strength="weak"/>
      Step 4, exhale.
    </speak>
    ```

  - <say-as>

    ```java
    *cardinal
        
    <speak>
      <say-as interpret-as="cardinal">12345</say-as> // 만이천삼백사십오
    </speak>
        
    *ordinal
    <speak>
      <say-as interpret-as="ordinal">1</say-as> // 첫번째
    </speak>
    
    ```

  - <sub>

    ```java
    태그안의 W3C대신 alias에 있는 text를 speech한다
    <sub alias="World Wide Web Consortium">W3C</sub> // World Wide Web Consortium
    ```

  - <prosody>

    ```java
    요소에 포함된 텍스트의 높낮이, 말하기 속도, 볼륨을 맞춤설정하는 데 사용됩니다. 현재 rate, pitch, volume 속성이 지원됩니다.
    
    <prosody rate="slow" pitch="-2st">Can you hear me now?</prosody>
        
    <speak>
    	<prosody pitch="-2st">웹 통신의 큰 흐름 </prosody> <sub alias="에이치 티티피 구글 닷 컴에">http://google.com/</sub>접속할때 일어나는 일
    </speak>
    ```
  
  - <emphasis>
  
    ```java
    요소에 포함된 텍스트에서 강세를 추가하거나 제거하는 데 사용됩니다. <emphasis> 요소는 <prosody>와 유사하게 음성을 수정하지만 개별 음성 속성을 설정할 필요가 없습니다
        
    strong
    moderate
    none
    reduced
        
    <emphasis level="moderate">This is an important announcement</emphasis>
    ```
  
    
  

