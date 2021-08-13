- **GSON API를 사용한 JSON핸들링**
  - **준비물 https://mvnrepository.com/search?q=gson 에서 [Gson](https://mvnrepository.com/artifact/com.google.code.gson/gson) 2.8.5**

```java
json형태로 변환하고 받아올 자료형 준비 (vo)
    
*vo 정보
    private String title;
	private int price;
	private String company;
	private int page;

public class Gson {

	public static void main(String[] args) {
		
		// Object(BookDTO) -> JSON(String)
		BookDTO dto = new BookDTO("자바",21000,"구구콘",670); 
		
		Gson g=new Gson();
		
		String json = g.toJson(dto); // json형태로 dto를 변환 
		System.out.println("json형태로 dto를 변환  : "+json); 
        // json 출력 {"title":"자바","price":21000,"company":"구구콘","page":670}
		System.out.println();
		
		BookDTO dto1 = g.fromJson(json, BookDTO.class); 
        // json형태로 변환된 dto를 데이터 타입으로 변환
		System.out.println("json형태로 변환된 dto를 데이터 타입으로 변환: "+dto1); 
        // BookDTO [title=자바, price=21000, company=구구콘, page=670]
		System.out.println();
		
		// Object(List<BookDTO>) -> JSON(String)형태로 변환 
		// 배열 객체	
		List<BookDTO> lst = new ArrayList<BookDTO>();
		lst.add(new BookDTO("자바1",11000,"구구콘",970));
		lst.add(new BookDTO("자바2",21000,"팔팔콘",870));
		lst.add(new BookDTO("자바3",31000,"칠칠콘",770));
		
		String lstJson = g.toJson(lst);
		System.out.println("List<>를 JSON형태로 변환 : "+lstJson);
		System.out.println();
		
		// JSON(String) -> Object(List<BookDTO>)
		// reflect -> 무슨 기능일까...
        // * reflection기능 설명 : https://gyrfalcon.tistory.com/entry/Java-Reflection
		List<BookDTO> lst1 = g.fromJson(lstJson, new TypeToken<List<BookDTO>>() {}.getType()); // LstJson안에 들어있는 배열의 타입 정보를 내부적으로 만들어줌
		
		for(BookDTO vo : lst1) { // 이렇게 하나씩 뺴온다.
			
			System.out.println("배열형태의json object를 하나씩 뺴옴 : "+vo);
			
		}
	}
}
```

```java
출력값
json형태로 dto를 변환  : {"title":"자바","price":21000,"company":"구구콘","page":670}

json형태로 변환된 dto를 데이터 타입으로 변환: 
BookDTO [title=자바, price=21000, company=구구콘, page=670]

List<>를 JSON형태로 변환 : [{"title":"자바1","price":11000,"company":"구구콘","page":970},{"title":"자바2","price":21000,"company":"팔팔콘","page":870},{"title":"자바3","price":31000,"company":"칠칠콘","page":770}]

배열형태의json object를 하나씩 뺴옴 : 
BookDTO [title=자바1, price=11000, company=구구콘, page=970]
    
배열형태의json object를 하나씩 뺴옴 : 
BookDTO [title=자바2, price=21000, company=팔팔콘, page=870]
    
배열형태의json object를 하나씩 뺴옴 : 
BookDTO [title=자바3, price=31000, company=칠칠콘, page=770]
```

```java
단점 : JSON방식으로 호출된 vo를 직접 전부 생성해야됨(KEY값이 많고 타입찾기가 귀찮음) 
	  부분 파싱이 안됨? 암튼 오류남
```

```java
*TIP http://jsoneditoronline.org/  JSON데이터 분석 사이트 , 아래 이미지 참조
     https://mvnrepository.com/    API저장소 사이트
```

![KakaoTalk_20210729_015139751](md-images/KakaoTalk_20210729_015139751.png)

---

---

---

- **ORG API를 사용한 JSON핸들링**
  - **준비물 https://mvnrepository.com/search?q=json에서 -> JSON In Java -> 20180813 버전**

```java
step1] json형태로 만들기
```

```java
public class Org {
	public static void main(String[] args) {
		// JSON-Java(org.json)
		JSONArray students = new JSONArray();

		JSONObject student = new JSONObject();

		// 학생 정보 입력
		student.put("name", "홍길동");
		student.put("phone", "010-1111-1111");
		student.put("address", "너의 마음속 ^^");
		System.out.println(student); // JSON형태로 student변환
		students.put(student); // students 배열에 student저장
		System.out.println();

		// 추가 학생 정보 입력
		student = new JSONObject();
		student.put("name", "김길동");
		student.put("phone", "010-2222-2222");
		student.put("address", "너의 마음속 ^^");
		students.put(student);// students 배열에 student저장

		// 저장된 학생정보들을 json 형태로 변환
		System.out.println(students);
		System.out.println();

		// {"lst":[{},{}]} ArrayObject를 감싸는 대괄호 역할
		JSONObject object = new JSONObject();
		object.put("students", students);

		System.out.println(object);
		System.out.println();

		// JSON형태의 데이터를 출력할때 object.toString(1~n)속성을 걸어주면 보기 좋게 들여쓰기 해서 나타내준다(1~n은 들여쓰기 레벨)
		System.out.println(object.toString(1));

	}
}
```

```java
출력값
{"address":"너의 마음속 ^^","phone":"010-1111-1111","name":"홍길동"}

[{"address":"너의 마음속 ^^","phone":"010-1111-1111","name":"홍길동"},{"address":"너의 마음속 ^^","phone":"010-2222-2222","name":"김길동"}]

{"students":[{"address":"너의 마음속 ^^","phone":"010-1111-1111","name":"홍길동"},{"address":"너의 마음속 ^^","phone":"010-2222-2222","name":"김길동"}]}

{"students": [
 {
  "address": "너의 마음속 ^^",
  "phone": "010-1111-1111",
  "name": "홍길동"
 },
 {
  "address": "너의 마음속 ^^",
  "phone": "010-2222-2222",
  "name": "김길동"
 }
]}
```

```java
step2] json형태를 데이터로 받아오기
```

```java
* 받아온 json형태의 문서를 해당 프로젝트폴더에 위치 시킨다.
    
*활용된 info.json 파일
    
{"students": [
 {
  "address": "너의 마음속 ^^",
  "phone": "010-1111-1111",
  "name": "홍길동"
 },
 {
  "address": "너의 마음속 ^^",
  "phone": "010-2222-2222",
  "name": "김길동"
 }
]}

public class Org {

	public static void main(String[] args) {
		
		String src = "info.json";
		
		// IO->Stream(스트림) 파일을 읽어 들어야함
		InputStream is = Org.class.getResourceAsStream(src); 
        // Org가 만들어진 위치에서 src(info.json)을 연결해라!
		
		// 해당 경로에 파일이 없을 경우의 예외처리
		if(is == null) throw new NullPointerException("파일을 찾을수 없습니다 ㅠ ");
		
		// 문자열을 JSON형태의 구조로 메모리에 올리는 작업 
        // token이 뭘까 ....
        // *token라이브러리 설명 : https://reakwon.tistory.com/90
		JSONTokener tokener = new JSONTokener(is);
		
		JSONObject object = new JSONObject(tokener);
		
		JSONArray students = object.getJSONArray("students");
		
		for(int i = 0; i<students.length(); i++) {
			
			JSONObject student = (JSONObject)students.get(i);
			System.out.println("이름 : "+student.get("name")+"\t"+
							   "주소 : "+student.get("address")+"\t\t"+
					           "전화번호 : "+student.get("phone"));
		}			
	}
}
```

```java
단점 어려움
```

---

---

---

---

```java
*네이버 영화 검색 api를 활용한 영화정보(특정 컬럼 추출)검색 .... ㅠ 
```

```java
package quest1;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONTokener;

public class serchMovie {

	public static void main(String[] args) throws UnsupportedEncodingException {

		
		String clientId = ""; // 애플리케이션 클라이언트 아이디값"
		String clientSecret = ""; // 애플리케이션 클라이언트 시크릿값"
		String text = null;

		Scanner sc = new Scanner(System.in);
		String name = sc.nextLine();
		
		name = URLEncoder.encode(name, "UTF-8");
		String apiURL = "https://openapi.naver.com/v1/search/movie?query=" + name;
		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("X-Naver-Client-Id", clientId);
		requestHeaders.put("X-Naver-Client-Secret", clientSecret);
		String responseBody = get(apiURL, requestHeaders);
		System.out.println(responseBody);
	
		// 해당 경로에 파일이 없을 경우의 예외처리
		// 문자열을 JSON형태의 구조로 메모리에 올리는 작업 
		JSONTokener tokener = new JSONTokener(responseBody);
		
		JSONObject object = new JSONObject(tokener);
		
		JSONArray items = object.getJSONArray("items");
		
		for(int i = 0; i<items.length(); i++) {
			
			JSONObject chaos = (JSONObject)items.get(i);
			System.out.println("영화 이름 : "+chaos.get("title")+"\t"+
							   "이미지 링크 : "+chaos.get("image")+"\t\t"+
					           "주연 배우 : "+chaos.get("actor"));

		}			
	}

//		List<BookDTO> lst1 = g.fromJson(lstJson, new TypeToken<List<BookDTO>>() {}.getType()); // LstJson안에 들어있는 배열의 타입 정보를 내부적으로 만들어줌
//		
//		for(BookDTO vo : lst1) { // 이렇게 하나씩 뺴온다.
//			System.out.println(vo);
//		}
//		
		
	private static String get(String apiUrl, Map<String, String> requestHeaders) {

		HttpURLConnection con = connect(apiUrl);

		try {

			con.setRequestMethod("GET");
			for (Map.Entry<String, String> header : requestHeaders.entrySet()) {

				con.setRequestProperty(header.getKey(), header.getValue());

			}

			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출

				return readBody(con.getInputStream());

			} else { // 에러 발생

				return readBody(con.getErrorStream());

			}
		} catch (IOException e) {

			throw new RuntimeException("API 요청과 응답 실패", e);

		} finally {

			con.disconnect();

		}
	}

	private static HttpURLConnection connect(String apiUrl) {

		try {

			URL url = new URL(apiUrl);
			return (HttpURLConnection) url.openConnection();

		} catch (MalformedURLException e) {

			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);

		} catch (IOException e) {

			throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);

		}
	}

	private static String readBody(InputStream body) {

		InputStreamReader streamReader = new InputStreamReader(body);

		try (BufferedReader lineReader = new BufferedReader(streamReader)) {

			StringBuilder responseBody = new StringBuilder();
			String line;

			while ((line = lineReader.readLine()) != null) {

				responseBody.append(line);

			}

			return responseBody.toString();

		} catch (IOException e) {

			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);

		}
	}
}
```

```ava
출력

입력값 : 해리포터
*부분 파싱 전
{"lastBuildDate": "Thu, 29 Jul 2021 03:17:32 +0900","total": 10,"start": 1,"display": 10,"items": [{"title": "<b>해리포터</b>와 잉크 마법사의 여행","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=203098","image": "https://ssl.pstatic.net/imgmovie/mdi/mit110/2030/203098_P01_154544.jpg","subtitle": "Literary Ink","pubDate": "2020","director": "액설 아르졸라|","actor": "","userRating": "0.00"},{"title": "<b>해리 포터</b>와 죽음의 성물 - 2부","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=47528","image": "https://ssl.pstatic.net/imgmovie/mdi/mit110/0475/47528_P50_144916.jpg","subtitle": "Harry Potter And The Deathly Hallows: Part 2","pubDate": "2011","director": "데이빗 예이츠|","actor": "다니엘 래드클리프|엠마 왓슨|루퍼트 그린트|","userRating": "9.32"},{"title": "<b>해리 포터</b>와 죽음의 성물 - 1부","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=67901","image": "https://ssl.pstatic.net/imgmovie/mdi/mit110/0679/67901_P52_160214.jpg","subtitle": "Harry Potter And The Deathly Hallows: Part 1","pubDate": "2010","director": "데이빗 예이츠|","actor": "다니엘 래드클리프|엠마 왓슨|루퍼트 그린트|","userRating": "8.20"},{"title": "<b>해리 포터</b>와 혼혈 왕자","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=67900","image": "https://ssl.pstatic.net/imgmovie/mdi/mit110/0679/67900_P01_130458.jpg","subtitle": "Harry Potter And The Half-Blood Prince","pubDate": "2009","director": "데이빗 예이츠|","actor": "다니엘 래드클리프|엠마 왓슨|루퍼트 그린트|","userRating": "6.96"},{"title": "<b>해리 포터</b>와 불사조 기사단","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=57095","image": "https://ssl.pstatic.net/imgmovie/mdi/mit110/0570/E7095-00.jpg","subtitle": "Harry Potter And The Order Of The Phoenix","pubDate": "2007","director": "데이빗 예이츠|","actor": "다니엘 래드클리프|엠마 왓슨|루퍼트 그린트|","userRating": "7.02"},{"title": "<b>해리 포터</b>와 불의 잔","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=37883","image": "https://ssl.pstatic.net/imgmovie/mdi/mit110/0378/37883_P158_182652.jpg","subtitle": "Harry Potter And The Goblet Of Fire","pubDate": "2005","director": "마이크 뉴웰|","actor": "다니엘 래드클리프|엠마 왓슨|루퍼트 그린트|","userRating": "8.03"},{"title": "<b>해리 포터</b>와 아즈카반의 죄수","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=35546","image": "https://ssl.pstatic.net/imgmovie/mdi/mit110/0355/35546_P88_142722.jpg","subtitle": "Harry Potter And The Prisoner Of Azkaban","pubDate": "2004","director": "알폰소 쿠아론|","actor": "다니엘 래드클리프|엠마 왓슨|루퍼트 그린트|","userRating": "8.74"},{"title": "<b>해리 포터</b>와 비밀의 방","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=33930","image": "https://ssl.pstatic.net/imgmovie/mdi/mit110/0339/C3930-06.jpg","subtitle": "Harry Potter And The Chamber Of Secrets","pubDate": "2002","director": "크리스 콜럼버스|","actor": "다니엘 래드클리프|루퍼트 그린트|엠마 왓슨|","userRating": "8.90"},{"title": "<b>해리 포터</b>와 마법사의 돌","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=30688","image": "https://ssl.pstatic.net/imgmovie/mdi/mit110/0306/30688_P28_142632.jpg","subtitle": "Harry Potter And The Sorcerer's Stone","pubDate": "2001","director": "크리스 콜럼버스|","actor": "다니엘 래드클리프|루퍼트 그린트|엠마 왓슨|","userRating": "9.34"},{"title": "<b>해리 포터</b> 주차장","link": "https://movie.naver.com/movie/bi/mi/basic.nhn?code=33952","image": "","subtitle": "Harry Potter Parking Lot","pubDate": "","director": "","actor": "","userRating": "9.15"}]}

*부분 파싱 후 
영화 이름 : <b>해리포터</b>와 잉크 마법사의 여행	이미지 링크 : https://ssl.pstatic.net/imgmovie/mdi/mit110/2030/203098_P01_154544.jpg		
주연 배우 : 

영화 이름 : <b>해리 포터</b>와 죽음의 성물 - 2부	이미지 링크 : https://ssl.pstatic.net/imgmovie/mdi/mit110/0475/47528_P50_144916.jpg		
주연 배우 : 다니엘 래드클리프|엠마 왓슨|루퍼트 그린트|

영화 이름 : <b>해리 포터</b>와 죽음의 성물 - 1부	
이미지 링크 : https://ssl.pstatic.net/imgmovie/mdi/mit110/0679/67901_P52_160214.jpg		
주연 배우 : 다니엘 래드클리프|엠마 왓슨|루퍼트 그린트|

영화 이름 : <b>해리 포터</b>와 혼혈 왕자	
이미지 링크 : https://ssl.pstatic.net/imgmovie/mdi/mit110/0679/67900_P01_130458.jpg		
주연 배우 : 다니엘 래드클리프|엠마 왓슨|루퍼트 그린트|

영화 이름 : <b>해리 포터</b>와 불사조 기사단	
이미지 링크 : https://ssl.pstatic.net/imgmovie/mdi/mit110/0570/E7095-00.jpg		
주연 배우 : 다니엘 래드클리프|엠마 왓슨|루퍼트 그린트|

영화 이름 : <b>해리 포터</b>와 불의 잔	
이미지 링크 : https://ssl.pstatic.net/imgmovie/mdi/mit110/0378/37883_P158_182652.jpg		
주연 배우 : 다니엘 래드클리프|엠마 왓슨|루퍼트 그린트|

영화 이름 : <b>해리 포터</b>와 아즈카반의 죄수	
이미지 링크 : https://ssl.pstatic.net/imgmovie/mdi/mit110/0355/35546_P88_142722.jpg		
주연 배우 : 다니엘 래드클리프|엠마 왓슨|루퍼트 그린트|

영화 이름 : <b>해리 포터</b>와 비밀의 방	이미지 링크 : https://ssl.pstatic.net/imgmovie/mdi/mit110/0339/C3930-06.jpg		
주연 배우 : 다니엘 래드클리프|루퍼트 그린트|엠마 왓슨|

영화 이름 : <b>해리 포터</b>와 마법사의 돌	
이미지 링크 : https://ssl.pstatic.net/imgmovie/mdi/mit110/0306/30688_P28_142632.jpg		
주연 배우 : 다니엘 래드클리프|루퍼트 그린트|엠마 왓슨|

영화 이름 : <b>해리 포터</b> 주차장	이미지 링크 : 		주연 배우 : 
```

```java
***** 실무에서 자주 쓰인다는 API 'Jackson' 알아보기
```

