package com.team.interview.controller;




import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
import com.team.interview.vo.InterviewVO;
import com.team.interview.vo.KeywordVO;
import com.team.interview.vo.PageInfo;
import com.team.interview.vo.QuestionVO;

@Controller
@RequestMapping(value = "/interview")
public class InterviewController {

	@Autowired
	InterviewService service;

	@Autowired
	QuestionService questionService;
	
	@Autowired
	KeywordService keywordService;

	@RequestMapping(value = "/")
	public ModelAndView interviewMain() {
		ModelAndView mav = new ModelAndView("interview/main");
		mav.addObject("board-total", "board/total");
		return mav;
	}

	@RequestMapping(value = "/mentor")
	public ModelAndView interviewMentor() {
		ModelAndView mav = new ModelAndView("interview/mentor");
		mav.addObject("board-total", "board/total");
		return mav;
	}

	@RequestMapping(value = "/mentor/register")
	public ModelAndView interviewMentorRegister() {
		ModelAndView mav = new ModelAndView("interview/mentor_form");
		mav.addObject("board-total", "board/total");
		return mav;
	}

	@RequestMapping(value = "/nomal")
	public ModelAndView nomalinterview() {
		ModelAndView mav = new ModelAndView("interview/nomal");
		mav.addObject("board-total", "");
		return mav;
	}

	// 채용공고모드 : 기업채용공고를 불러온다.
	@RequestMapping(value = "/recruit", method = RequestMethod.GET)
	public ModelAndView interviewRecruit(@RequestParam(value = "page", required = false, defaultValue = "1") int page) {

//		System.out.println("==========recruit  controller==");

		ModelAndView mav = new ModelAndView("interview/recruit");
		PageInfo pageInfo = new PageInfo();

		ArrayList<InterviewVO> voList = service.searchRecruitPosting(page, pageInfo);

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
		return mav;
	}

	
	
	@RequestMapping(value = "/result")
	public ModelAndView interviewResult() {

		ModelAndView mav = new ModelAndView("interview/result");
		mav.addObject("board-total", "");
		return mav;

	}

	@RequestMapping(value = "/run")
	public ModelAndView interviewRun() {

		ModelAndView mav = new ModelAndView("interview/run");
		ArrayList<QuestionVO> questions;

		try {

			questions = questionService.questions();
			System.out.println(questions);
			mav.addObject("questions", questions);

		} catch (Exception e) {

			e.printStackTrace();

		}

		return mav;

	}
	
	
	@RequestMapping(value = "/custom")
	public ModelAndView customMode() {

		ModelAndView mav = new ModelAndView("interview/custom");
		ArrayList<KeywordVO> keywordList;

		try {

			keywordList = keywordService.keywordList();
			System.out.println(keywordList);
			mav.addObject("keywordList", keywordList);

		} catch (Exception e) {

			e.printStackTrace();

		}

		return mav;

	}

//	@ResponseBody // 비동기 통신할때 사용
//	@RequestMapping(value = "/questionvoice", method = RequestMethod.POST)
//	public void questionvoice(@RequestParam("ssml") String ssml,
//			@RequestParam(value = "content", required = false) String content, HttpServletResponse response) {
//
//		try {
//			if (content != null) {
//				// 답변 DB 저장
//			}
//
//			try (TextToSpeechClient textToSpeechClient = TextToSpeechClient.create()) {
//				SynthesisInput input = SynthesisInput.newBuilder().setSsml(
//						"<speak><prosody rate=\"90%\" pitch=\"1st\"><emphasis level=\"none\"><sub alias=\"오버로딩과\">﻿오버로딩(Overloading)과</sub></emphasis> 오버라이딩<sub alias=\"\">(Overriding)</sub>의 차이점을 간단하게 설명해 주세요.</prosody></speak>")
//						.build();
//				VoiceSelectionParams voice = VoiceSelectionParams.newBuilder().setLanguageCode("ko-KR")
//						.setSsmlGender(SsmlVoiceGender.MALE).build();
//
//				AudioConfig audioConfig = AudioConfig.newBuilder().setAudioEncoding(AudioEncoding.MP3).build();
//
//				SynthesizeSpeechResponse res = textToSpeechClient.synthesizeSpeech(input, voice, audioConfig);
//
//				ByteString audioContents = res.getAudioContent();
//
//				try (OutputStream out = response.getOutputStream()) {
//
//					out.write(audioContents.toByteArray());
//					out.close();
//
//				}
//			}
//
//		} catch (Exception e) {
//
//			e.printStackTrace();
//
//		}
//	}
}
