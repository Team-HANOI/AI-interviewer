package com.team.interview.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import com.team.interview.security.dto.AuthMemberDTO;
import com.team.interview.service.InterviewAnswerService;
//import com.google.cloud.texttospeech.v1.AudioConfig;
//import com.google.cloud.texttospeech.v1.AudioEncoding;
//import com.google.cloud.texttospeech.v1.SsmlVoiceGender;
//import com.google.cloud.texttospeech.v1.SynthesisInput;
//import com.google.cloud.texttospeech.v1.SynthesizeSpeechResponse;
//import com.google.cloud.texttospeech.v1.TextToSpeechClient;
//import com.google.cloud.texttospeech.v1.VoiceSelectionParams;
//import com.google.protobuf.ByteString;
import com.team.interview.service.InterviewService;
import com.team.interview.service.KeywordService;
import com.team.interview.service.QuestionService;
import com.team.interview.vo.FileVO;
import com.team.interview.vo.InterviewAnswerVO;
import com.team.interview.vo.InterviewRecordVO;
import com.team.interview.vo.InterviewVO;
import com.team.interview.vo.KeywordVO;
import com.team.interview.vo.MentormodeVO;
import com.team.interview.vo.PageInfo;
import com.team.interview.vo.QuestionVO;

@Controller
@RequestMapping(value = "/interview")
public class InterviewController {

  @Autowired
  InterviewService interviewService;	//	면접서비스, 회사별모드 관련

  @Autowired
  QuestionService questionService;	//	질문뽑아오는 서비스, 면접 모드에서 질문 다르게 가져오는거

  @Autowired
  KeywordService keywordService;	//	키워드관련 서비스, 맞춤모드에서 키워드 목록을 가져오기 위해 사용했음.

  @Autowired
  InterviewAnswerService interviewAnswerService;	//	면접기록 서비스, 면접을 기록하기 위해 사용

  @RequestMapping(value = "/")
  public ModelAndView interviewMain() {
    ModelAndView mav = new ModelAndView("interview/main");
    mav.addObject("board-total", "board/total");
    return mav;
  }

  @InitBinder
  public void initBinder(WebDataBinder binder) {   
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");     
    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
  }


  @RequestMapping(value = "/mentor")
  public ModelAndView interviewMentor(@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
    PageInfo pageInfo = new PageInfo();
    ModelAndView mv = new ModelAndView();
    System.out.println("aa");
    try {
      List<MentormodeVO> articleList = interviewService.getMentorList(page, pageInfo);
      mv.addObject("pageInfo", pageInfo);
      mv.addObject("articleList", articleList);
      System.out.println(articleList);
      mv.setViewName("/interview/mentor");

    } catch (Exception e) {
      e.printStackTrace();
      mv.addObject("err", e.getMessage());
      mv.addObject("page", "/err");
      mv.setViewName("main");
    }
    return mv;
  }

  @RequestMapping(value = "/mentor/register")
  public String interviewMentorRegister() {
    return "/interview/mentor_form";
  }

  @RequestMapping(value = "/mentor/mentorform", method = RequestMethod.POST)
  public ModelAndView joinPage(@ModelAttribute("mentor") MentormodeVO mentor, @AuthenticationPrincipal AuthMemberDTO authMemberDTO) {
    System.out.println("여기되나");
    ModelAndView mav = new ModelAndView();
    try {
      //      SimpleDateFormat transFormat1 = new SimpleDateFormat("yyyy-MM-dd");
      //      String mentorDateString = transFormat1.format(mentor.getMentorDate());


    mentor.setMentorName(authMemberDTO.getName());
      mentor.setMentorEmail(authMemberDTO.getEmail());
      interviewService.regMentor(mentor);
      mav.setViewName("interview");
    } catch (Exception e) {
      e.printStackTrace();
      mav.setViewName("err");
    }

    return mav;

  }
  
  @RequestMapping(value = "/apply", method = RequestMethod.GET)
  public ModelAndView applyPage(@ModelAttribute("mentor") MentormodeVO mentor, @RequestParam(value="mentorEmail") String mentorEmail,@AuthenticationPrincipal AuthMemberDTO authMemberDTO) {

    System.out.println("여기되나");
    ModelAndView mav = new ModelAndView();
    try {
      mentor.setMentorEmail(mentorEmail);
      mentor.setApplEmail(authMemberDTO.getEmail());
      System.out.println(mentor.getApplEmail());
      System.out.println(mentor.getMentorEmail());
      interviewService.appMentor(mentor);
      mav.setViewName("interview/mentor");
    } catch (Exception e) {
      e.printStackTrace();
      mav.setViewName("err");
    }

    return mav;

  }

  

  //	일반모드, 회사별 모드, 맞춤모드 컨트롤러
  
  
  
	//	일반모드 : 백앤드,프론트앤드로 분기 하여 면접 진행 
  @RequestMapping(value = "/nomal") 
  public ModelAndView nomalinterview() {	 //	백앤드,프론트 분기컨트롤러
    ModelAndView mav = new ModelAndView("interview/nomal");
    mav.addObject("board-total", "");
    return mav;
  }
  
  // 일반모드 => backEnd 포지션
  @RequestMapping(value = "/backEnd")
  public ModelAndView backEndQ() {	 // backEnd

    ModelAndView mav = new ModelAndView("interview/backEnd");
    ArrayList<QuestionVO> questions;

    try {

      questions = questionService.backQuestion();
      System.out.println(questions);
      mav.addObject("questions", questions);

    } catch (Exception e) {

      e.printStackTrace();

    }

    return mav;

  }

  // 일반모드 => frontEnd 포지션
  @RequestMapping(value = "/frontEnd") 
  public ModelAndView frontEndQ() {	// frontEnd

    ModelAndView mav = new ModelAndView("interview/frontEnd");
    ArrayList<QuestionVO> questions;

    try {

      questions = questionService.frontQuestion();
      System.out.println(questions);
      mav.addObject("questions", questions);

    } catch (Exception e) {

      e.printStackTrace();

    }

    return mav;

  }
  //	일반모드 끝
  
  
  
  
  
  
  // 회사별 모드 : 크롤링하여 저장한 기업채용공고를 이용하여 면접을 진행시켜줌.
  @RequestMapping(value = "/recruit", method = RequestMethod.GET)
  public ModelAndView interviewRecruit(@RequestParam(value = "page", required = false, defaultValue = "1") int page) {

    //		System.out.println("==========recruit  controller==");

    ModelAndView mav = new ModelAndView("interview/recruit");
    PageInfo pageInfo = new PageInfo();

    ArrayList<InterviewVO> voList = interviewService.searchRecruitPosting(page, pageInfo);

    for (InterviewVO vo : voList) {
      //		System.out.println("==========recruit==="+vo.getKw()+"===========");		
      if (vo.getKw() != null) {

        String[] kw = vo.getKw().split(",");
        ArrayList<String> kwList = new ArrayList<String>();

        for (int i = 0; i < kw.length; i++) {

          kwList.add(kw[i]);

        }

        vo.setKwList(kwList);

      }
      //				System.out.println("==========kwList==="+vo.getKwList()+"===========");	
    }
    mav.addObject("voList", voList);
    mav.addObject("pageInfo", pageInfo);
	mav.addObject("type",2);
    return mav;
  }

  //	받아온 정보를 면접페이지로(customMode를 같이사용) 넘긴다
	@RequestMapping(value = "/recruitMode" )
	public ModelAndView recruitMode(@RequestParam(value="kwList") List<String> kwList) {
	
		ModelAndView mav = new ModelAndView("interview/customMode");	//	받아온 정보를 면접페이지로(customMode를 같이사용) 넘긴다
		return mav;
		
	}
	// 회사별 모드 끝
  
	
	
	
	
	
	
//	맞춤모드 : 질문에 포함되는 기술 스택 keyword를 선택하여 면접을 진행시켜줌
  @RequestMapping(value = "/custom")
  public ModelAndView custom() {

    ModelAndView mav = new ModelAndView("interview/custom");
    ArrayList<KeywordVO> keywordList;

    try {

      keywordList = keywordService.keywordList();
      System.out.println(keywordList);	//	키워드 잘 받아와지나?

      mav.addObject("keywordList", keywordList);
	  mav.addObject("type",3);
    } catch (Exception e) {

      e.printStackTrace();

    }
    return mav;
  }

  @RequestMapping(value = "/customMode" )
  public ModelAndView customMode(@RequestParam(value="keyword") String[] keyword,
		  						 @RequestParam(value="type") int type) {

    ModelAndView mav = new ModelAndView("interview/customMode");
    ArrayList<QuestionVO> questions;

    try {

      questions = questionService.customQuestion(keyword);			
      System.out.println(questions);
      mav.addObject("questions", questions);

      String str = "";
      for(int i = 0; i < keyword.length; i++) {

        str += keyword[i]+",";

      }
      System.out.println(str);
      mav.addObject("keyword",str);
	  mav.addObject("type",type);	//	타입 받아오기
		
    } catch (Exception e) {

      e.printStackTrace();

    }

    return mav;

  }
  //	맞춤모드 끝
	
  
  
	




  // 질문 음성으로 내보내기(clova api)
  @ResponseBody
  @PostMapping(value = "/questionvoice")
  public void ttvoice(@RequestParam(value = "question", required = false) String question,
      HttpServletResponse response) {

    System.out.println(question);

    String clientId = "cqr4vhpfn2";// 애플리케이션 클라이언트 아이디값";
    String clientSecret = "6i4rSpBl3kAz16XjPWthJ7YWw8aOz0JXpsJ57JqM";// 애플리케이션 클라이언트 시크릿값";
    try {
      String text = URLEncoder.encode(question, "UTF-8");
      String apiURL = "https://naveropenapi.apigw.ntruss.com/tts-premium/v1/tts";
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection) url.openConnection();
      con.setRequestMethod("POST");
      con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
      con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
      // post request
      String postParams = "speaker=njihun&volume=0&speed=0&pitch=0&format=mp3&text=" + text;
      con.setDoOutput(true);
      DataOutputStream wr = new DataOutputStream(con.getOutputStream());
      wr.writeBytes(postParams);
      wr.flush();
      wr.close();
      int responseCode = con.getResponseCode();
      BufferedReader br;

      System.out.println(responseCode);

      if (responseCode == 200) { // 정상 호출
        InputStream is = con.getInputStream();
        int read = 0;
        byte[] bytes = new byte[1024];
        OutputStream outputStream = response.getOutputStream();
        while ((read = is.read(bytes)) != -1) {
          outputStream.write(bytes, 0, read);
        }
        is.close();
      } else { // 오류 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
        String inputLine;
        StringBuffer res = new StringBuffer();
        while ((inputLine = br.readLine()) != null) {
          res.append(inputLine);
        }
        br.close();
        System.out.println(response.toString());
      }
    } catch (Exception e) {
      System.out.println(e);
    }
  }
  //	tts끝
  
  

  
  // 답변 text로 내보내기
  @ResponseBody
  @PostMapping("/answertext")
  public ResponseEntity<String> voiceToText(MultipartHttpServletRequest multi) throws Exception {

    MultipartFile orgfile = multi.getFile("data");
    System.out.println(orgfile.getSize());
    InputStream instream = orgfile.getInputStream();
    String text = reqcsr(instream);
    JSONParser parser = new JSONParser();
    JSONObject jsonObject = (JSONObject) parser.parse(text);
    String result = (String) jsonObject.get("text");
    System.out.println(result);
    return new ResponseEntity<String>(result, HttpStatus.OK);
  }

  public String reqcsr(InputStream voiceStream) {
    String clientId = "a4re5zitov"; // Application Client ID";
    String clientSecret = "5z7STcraUcZvxx3dwMl8qWomLhBtDRUueZhETJwu"; // Application Client Secret";
    StringBuffer response = new StringBuffer();

    try {
      String language = "Kor"; // 언어 코드 ( Kor, Jpn, Eng, Chn )
      String apiURL = "https://naveropenapi.apigw.ntruss.com/recog/v1/stt?lang=" + language;
      URL url = new URL(apiURL);

      HttpURLConnection conn = (HttpURLConnection) url.openConnection();
      conn.setUseCaches(false);
      conn.setDoOutput(true);
      conn.setDoInput(true);
      conn.setRequestProperty("Content-Type", "application/octet-stream");
      conn.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
      conn.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);

      OutputStream outputStream = conn.getOutputStream();
      byte[] buffer = new byte[4096];
      int bytesRead = -1;
      while ((bytesRead = voiceStream.read(buffer)) != -1) {
        outputStream.write(buffer, 0, bytesRead);
      }
      outputStream.flush();
      voiceStream.close();
      BufferedReader br = null;
      int responseCode = conn.getResponseCode();
      System.out.println(responseCode);
      if (responseCode == 200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
      } else { // 오류 발생
        System.out.println("error!!!!!!! responseCode= " + responseCode);
        br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
      }
      String inputLine;

      if (br != null) {
        while ((inputLine = br.readLine()) != null) {
          response.append(inputLine);
        }
        br.close();
      }
    } catch (Exception e) {
      System.out.println(e);
    }
    return response.toString();
  }
  //	stt끝
  


  // 답변 저장
  @ResponseBody
  @PostMapping("/saveanswervoice")
  public void saveAnswerVoice(@AuthenticationPrincipal AuthMemberDTO authMemberDTO, MultipartHttpServletRequest multi,
      @RequestParam("type") int type, @RequestParam(value = "pos", required = false) String pos,
      @RequestParam(value = "kws", required = false) String kws, @RequestParam("qIds") List<String> qIds,
      @RequestParam("answers") List<String> answers) throws Exception {

    try {

      //	String email = "shguddnr2@Naver.com"; //

      String email = authMemberDTO.getEmail(); // 세선email받아오기
      //	면접 기록 저장 interviewAnswerService
      //	면접의 타입에 따라 달라짐
      InterviewRecordVO interviewRecord = new InterviewRecordVO();
      interviewRecord.setiTypeId(type);
      interviewRecord.setEmail(email);
      int interviewNumber = 0;

      if (type == 1) {

        interviewRecord.setChosenPos(pos);
        interviewRecord.setChosenKw("");
        interviewNumber = interviewAnswerService.regInterviewRecord(interviewRecord);

      } else if (type == 2 || type == 3) {

        interviewRecord.setChosenPos("");
        interviewRecord.setChosenKw(kws);
        interviewNumber = interviewAnswerService.regInterviewRecord(interviewRecord);

      }

      int cnt = Integer.parseInt(multi.getParameter("cnt"));

      for (int i = 0; i < cnt; i++) {

        MultipartFile file = multi.getFile("data" + i);

        System.out.println(file.getSize());

        FileVO newFile = new FileVO();
        newFile.setFileName("" + interviewNumber + i);
        newFile.setFileSize(file.getSize());
        newFile.setFileContentType(file.getContentType());
        newFile.setFileData(file.getBytes());

        int voiceNextNum = interviewAnswerService.regVoiceAnswer(newFile);

        InterviewAnswerVO interviewAnswer = new InterviewAnswerVO();
        interviewAnswer.setVoiceNum(voiceNextNum);
        interviewAnswer.setiRecordId(interviewNumber);
        interviewAnswer.setqId(Integer.parseInt(qIds.get(i)));
        interviewAnswer.setContent(answers.get(i));
        interviewAnswer.setrCnt(0);
        interviewAnswerService.regInterviewAnswer(interviewAnswer);

      }

    } catch (Exception e) {
      e.printStackTrace();
    }
  }
  // 답변 저장 끝
  
  
  

	//	dummy 
	//  @GetMapping("/successinterview")
	//  public String successInterview() {
	//    return "success";
	//  }
  
	//  @RequestMapping(value = "/result")
	//  public ModelAndView interviewResult() {
	//
	//    ModelAndView mav = new ModelAndView("interview/result");
	//
	//
	//    mav.addObject("board-total", "");
	//    return mav;
	//
	//  }

}
