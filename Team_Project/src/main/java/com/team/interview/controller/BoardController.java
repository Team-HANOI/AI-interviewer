package com.team.interview.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.interview.service.AllService;
import com.team.interview.service.KeywordService;
import com.team.interview.vo.AnswerVO;
import com.team.interview.vo.FileVO;
import com.team.interview.vo.KeywordVO;
import com.team.interview.vo.PageInfo;
import com.team.interview.vo.QuestionVO;

@Controller()
@RequestMapping(value = "/board")
public class BoardController {
  @Autowired
  private AllService allService;

  @Autowired
  KeywordService keywordService;

  @RequestMapping(value = "/")
  public ModelAndView boardTotal(@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
    PageInfo pageInfo = new PageInfo();
    ModelAndView mv = new ModelAndView();
    System.out.println("aa");
    ArrayList<KeywordVO> keywordList;

    try {
      List<QuestionVO> articleList = allService.getAllQList(page, pageInfo);

      keywordList = keywordService.keywordList();
      mv.addObject("keywordList", keywordList);

      mv.addObject("pageInfo", pageInfo);
      mv.addObject("articleList", articleList);

      // mv.addObject("page","Qlistform");
      System.out.println(articleList);
      mv.setViewName("board/total");

    } catch (Exception e) {
      e.printStackTrace();
      mv.addObject("err", e.getMessage());
      mv.addObject("page", "/err");
      mv.setViewName("main");
    }
    return mv;
  }

  @RequestMapping(value = "/total_detail")
  public ModelAndView boardTotalDetail(@RequestParam(value = "q_id") int q_id,
      @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
    PageInfo pageInfo = new PageInfo();
    ModelAndView mv = new ModelAndView();
    try {
      List<AnswerVO> articleList = allService.getAnsList(q_id, page, pageInfo);
      mv.addObject("pageInfo", pageInfo);
      mv.addObject("articleList", articleList);
      mv.setViewName("board/total_detail");
      System.out.println(articleList);
    } catch (Exception e) {
      e.printStackTrace();
      mv.addObject("err", e.getMessage());
      mv.addObject("page", "/err");
      mv.setViewName("main");
    }
    return mv;

  }

  @RequestMapping(value = "/best_answers")
  public ModelAndView boardBestAnswers() {
    ModelAndView mav = new ModelAndView("board/best_answers");
    mav.addObject("best_answers", "board/best_answers");
    return mav;
  }

  @RequestMapping(value = "/best_answers/detail")
  public ModelAndView boardBestAnwersDetail() {
    ModelAndView mav = new ModelAndView("board/best_answers_detail");
    mav.addObject("best_answers_detail", "");
    return mav;
  }

  @RequestMapping(value = "/free")
  public ModelAndView boardFree() {
    ModelAndView mav = new ModelAndView("board/free");
    mav.addObject("best_answers", "");
    return mav;
  }

  @RequestMapping(value = "/free/detail")
  public ModelAndView boardFreeDetail() {
    ModelAndView mav = new ModelAndView("board/free_detail");
    mav.addObject("best_answers_detail", "");
    return mav;
  }

  @RequestMapping(value = "/recommend")
  public ModelAndView boardRecommend() {
    ModelAndView mav = new ModelAndView("board/recommend");
    mav.addObject("best_answers_detail", "");
    return mav;
  }

  @RequestMapping(value = "/review")
  public ModelAndView boardReview() {
    ModelAndView mav = new ModelAndView("board/review");
    mav.addObject("best_answers_detail", "");
    return mav;
  }

  @RequestMapping(value = "/review/detail")
  public ModelAndView boardReviewDetail() {
    ModelAndView mav = new ModelAndView("board/review_detail");
    mav.addObject("best_answers_detail", "");
    return mav;
  }

  @RequestMapping(value = "/temporary")
  public ModelAndView boardTemporary() {
    ModelAndView mav = new ModelAndView("board/temporary");
    mav.addObject("best_answers_detail", "");
    return mav;
  }

  @RequestMapping(value = "/write")
  public ModelAndView boardWrite() {
    ModelAndView mav = new ModelAndView("board/write");
    mav.addObject("best_answers_detail", "");
    return mav;
  }

  @RequestMapping(value = "/allqlist", method = { RequestMethod.GET, RequestMethod.POST })
  public ModelAndView AllQList(@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
    PageInfo pageInfo = new PageInfo();
    ModelAndView mv = new ModelAndView();
    System.out.println("aa");
    try {
      List<QuestionVO> articleList = allService.getAllQList(page, pageInfo);
      mv.addObject("pageInfo", pageInfo);
      mv.addObject("articleList", articleList);
      // mv.addObject("page","Qlistform");
      System.out.println(articleList);
      mv.setViewName("board/total");

    } catch (Exception e) {
      e.printStackTrace();
      mv.addObject("err", e.getMessage());
      mv.addObject("page", "/err");
      mv.setViewName("main");
    }
    return mv;
  }

  @RequestMapping(value = "/allkwlist", method = { RequestMethod.POST })
  public ModelAndView AllkwQList(@RequestParam(value = "kw") String kw,
      @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
    PageInfo pageInfo = new PageInfo();
    ModelAndView mv = new ModelAndView();
    System.out.println("aa");
    try {
      List<QuestionVO> articleList = allService.getkwQList(kw, page, pageInfo);
      mv.addObject("pageInfo", pageInfo);
      mv.addObject("articleList", articleList);
      // mv.addObject("page","Qlistform");
      mv.setViewName("board/total");
    } catch (Exception e) {
      e.printStackTrace();
      mv.addObject("err", e.getMessage());
      mv.addObject("page", "/err");
      mv.setViewName("main");
    }
    return mv;
  }

  @RequestMapping("/totaldetail")
  public ModelAndView AllAnsList(@RequestParam(value = "q_id") int q_id,
      @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
    PageInfo pageInfo = new PageInfo();
    ModelAndView mv = new ModelAndView();
    try {
      List<AnswerVO> articleList = allService.getAnsList(q_id, page, pageInfo);
      mv.addObject("pageInfo", pageInfo);
      mv.addObject("articleList", articleList);
      mv.setViewName("board/total_detail");
      System.out.println(articleList);
    } catch (Exception e) {
      e.printStackTrace();
      mv.addObject("err", e.getMessage());
      mv.addObject("page", "/err");
      mv.setViewName("main");
    }
    return mv;
  }

  @GetMapping("/detailRCnt")
  public ModelAndView AllAnsListRcnt(@RequestParam(value = "q_id", required = true) int q_id,
      @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
    PageInfo pageInfo = new PageInfo();
    ModelAndView mv = new ModelAndView();
    System.out.println(q_id);
    try {
      List<AnswerVO> articleList = allService.getAnsListCnt(q_id, page, pageInfo);
      mv.addObject("pageInfo", pageInfo);
      mv.addObject("articleList", articleList);
      mv.setViewName("board/total_detail");
      System.out.println(articleList);
    } catch (Exception e) {
      e.printStackTrace();
      mv.addObject("err", e.getMessage());
      mv.addObject("page", "/err");
      mv.setViewName("main");
    }
    return mv;
  }

  @ResponseBody
  @PostMapping("/recommend")
  public String recommend(@RequestParam(value = "answerId", required = true) int answerId,
      HttpServletResponse response) throws Exception {

    String cnt = "";
    try {
      allService.recommend(answerId);
      cnt = allService.getRCnt(answerId) + "";
      System.out.println(cnt);
    } catch (Exception e) {
      e.printStackTrace();

    }

    return cnt;

  }

  @GetMapping(value = { "/img/{fileId}" })
  public ResponseEntity<byte[]> getImageFile(@PathVariable int fileId) throws Exception {
    {
      FileVO file = allService.getFile(fileId);
      final HttpHeaders headers = new HttpHeaders();
      if (file != null) {
        String[] mtypes = file.getFileContentType().split("/");
        headers.setContentType(new MediaType(mtypes[0], mtypes[1]));
        headers.setContentDispositionFormData("attachment", file.getFileName());
        headers.setContentLength(file.getFileSize());
        System.out.println(file.getFileName());
        return new ResponseEntity<byte[]>(file.getFileData(), headers, HttpStatus.OK);
      } else {
        System.out.println(file);
        return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
      }

    }
  }

}
