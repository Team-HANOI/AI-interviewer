package com.team.interview.controller;


import java.io.PrintWriter;
import java.text.DecimalFormat;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.team.interview.dao.ReviewDAO;
import com.team.interview.service.ReviewService;
import com.team.interview.vo.FileVO;
import com.team.interview.vo.PageInfo;
import com.team.interview.vo.RCommVO;
import com.team.interview.vo.ReviewVO;

@Controller
@RequestMapping("/review")
public class ReviewControllerImpl implements ReviewController {
  @Autowired
  private ReviewService reviewService;

  private ReviewDAO reviewDAO;


  @Override
  @GetMapping("/write_review")
  public ModelAndView writeReview() {
    ModelAndView mv = new ModelAndView("main");
    mv.setViewName("redirect:/board/write");
    return mv;
  }

  @Override
  @PostMapping("/write_review")
  public ModelAndView writeReview(@ModelAttribute ReviewVO review, @RequestParam MultipartFile rImg,
      RedirectAttributes redirectAttrs) {
    ModelAndView mv = new ModelAndView();
    try {
      FileVO newFile = null;
      if (rImg != null && !rImg.isEmpty()) { // &&button name='1'
        newFile = new FileVO();
        newFile.setFileName(rImg.getOriginalFilename());
        newFile.setFileSize(rImg.getSize());
        newFile.setFileContentType(rImg.getContentType());
        newFile.setFileData(rImg.getBytes());
      }
      reviewService.writeReview(newFile, review);
      mv.setViewName("redirect:/review/board_review");
    } catch (Exception e) {
      e.printStackTrace();
      mv.addObject("err", "새 글 등록 실패");
      mv.setViewName("/board/err");
    }
    return mv;
  }



  @Override
  @RequestMapping(value = "board_review", method = {RequestMethod.GET, RequestMethod.POST})
  public ModelAndView boardList(
      @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
    PageInfo pageInfo = new PageInfo();
    ModelAndView mv = new ModelAndView();
    try {
      List<ReviewVO> articleList = reviewService.getBoardList(page, pageInfo); // pageInfo_출력해야해_만들어와
      mv.addObject("pageInfo", pageInfo); // 하단 page객체 넘길게
      mv.addObject("articleList", articleList); // 게시글10개 리스트 넘길게
      mv.setViewName("/board/review"); // 화면에 이걸 띄워줘
    } catch (Exception e) {
      e.printStackTrace();
      mv.addObject("err", e.getMessage());
      mv.setViewName("/board/err");
    }
    return mv;
  }


  @Override
  @RequestMapping(value = "board_review_key", method = {RequestMethod.GET, RequestMethod.POST})
  public ModelAndView boardKeyList(
      @RequestParam(value = "page", required = false, defaultValue = "1") int page,
      @RequestParam(defaultValue = "") String keyword) {
    PageInfo pageInfo = new PageInfo();
    ModelAndView mv = new ModelAndView();
    try {
      List<ReviewVO> articleList = reviewService.getBoardKeyList(page, pageInfo, keyword); // pageInfo_출력해야해_만들어와
      mv.addObject("pageInfo", pageInfo); // 하단 start end page값 넘길게
      mv.addObject("articleList", articleList); // 게시글10개 리스트 넘길게
      mv.setViewName("/board/review"); // 화면에 이걸 띄워줘
    } catch (Exception e) {
      e.printStackTrace();
      mv.addObject("err", e.getMessage());
      mv.setViewName("/board/err");
    }
    return mv;
  }


  // 공개 게시판 상세
  @Override
  @GetMapping("/board_review_detail")
  public ModelAndView boardDetail(@RequestParam("reviewId") int reviewId,
      @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
    ModelAndView mv = new ModelAndView();
    try {
      ReviewVO review = reviewService.getBoard(reviewId);
      FileVO file = reviewService.getFile(review.getFileId());
      int pfId = reviewService.selectPfId(review.getEmail());
      // 댓글목록 조회
      ArrayList<RCommVO> commList = reviewService.getRCommList(review.getReviewId());

      mv.addObject("commList", commList);
      mv.addObject("pfId", pfId);
      mv.addObject("file", file);
      mv.addObject("review", review);
      mv.addObject("page", page);
      mv.setViewName("/board/review_detail");
    } catch (Exception e) {
      e.printStackTrace();
      mv.addObject("err", "글 조회 실패");
      mv.setViewName("/board/err");
    }
    return mv;
  }


  // 이전 게시판 상세
  @Override
  @GetMapping("/r_detail_pre")
  public ModelAndView boardDetailPre(@RequestParam("reviewId") int reviewId,
      @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
    ModelAndView mv = new ModelAndView();
    try {
      ReviewVO review = reviewService.getBoardPre(reviewId);
      // review/board_review temp 0 이고 -1
      // mv.setViewName("redirect:/review/board_review_detail?reviewId=" + 1);

      FileVO file = reviewService.getFile(review.getFileId());
      int pfId = reviewService.selectPfId(review.getEmail());
      // 댓글목록 조회
      ArrayList<RCommVO> commList = reviewService.getRCommList(review.getReviewId());

      mv.addObject("commList", commList);
      mv.addObject("pfId", pfId);
      mv.addObject("file", file);
      mv.addObject("review", review);
      mv.addObject("page", page);
      mv.setViewName("/board/review_detail");

    } catch (Exception e) {
      e.printStackTrace();
      mv.addObject("err", "글 조회 실패");
      mv.setViewName("/board/err");
    }
    return mv;
  }


  // 다음 게시판 상세
  @Override
  @GetMapping("/r_detail_next")
  public ModelAndView boardDetailNext(@RequestParam("reviewId") int reviewId,
      @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
    ModelAndView mv = new ModelAndView();
    try {
      ReviewVO review = reviewService.getBoardNext(reviewId);
      FileVO file = reviewService.getFile(review.getFileId());
      int pfId = reviewService.selectPfId(review.getEmail());
      // 댓글목록 조회
      ArrayList<RCommVO> commList = reviewService.getRCommList(review.getReviewId());

      mv.addObject("commList", commList);
      mv.addObject("pfId", pfId);
      mv.addObject("file", file);
      mv.addObject("review", review);
      mv.addObject("page", page);
      mv.setViewName("/board/review_detail");
    } catch (Exception e) {
      e.printStackTrace();
      mv.addObject("err", "글 조회 실패");
      mv.setViewName("/board/err");
    }
    return mv;
  }

  // 게시판 상세 > 첨부파일
  @GetMapping(value = {"/img/{fileId}", "/pds/{fileId}"})
  public ResponseEntity<byte[]> getImageFile(@PathVariable int fileId) throws Exception { // @PathVariable_url값을_변수로_담는다
    FileVO file = reviewService.getFile(fileId);
    final HttpHeaders headers = new HttpHeaders(); // 상수화
    if (file != null) {
      String[] mtypes = file.getFileContentType().split("/");
      headers.setContentType(new MediaType(mtypes[0], mtypes[1]));
      headers.setContentDispositionFormData("attachment", file.getFileName());
      headers.setContentLength(file.getFileSize());
      return new ResponseEntity<byte[]>(file.getFileData(), headers, HttpStatus.OK);
    } else {
      return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
    }
  }


  // 게시판 상세 > 프로필
  @GetMapping(value = "/pfImg/{pfId}")
  public ResponseEntity<byte[]> getPfImg(@PathVariable int pfId) throws Exception { // @PathVariable_url값을_변수로_담는다
    FileVO file = reviewService.getPfImg(pfId);
    final HttpHeaders headers = new HttpHeaders(); // 상수화
    if (file != null) {
      String[] mtypes = file.getFileContentType().split("/");
      headers.setContentType(new MediaType(mtypes[0], mtypes[1]));
      headers.setContentDispositionFormData("attachment", file.getFileName());
      headers.setContentLength(file.getFileSize());
      return new ResponseEntity<byte[]>(file.getFileData(), headers, HttpStatus.OK);
    } else {
      return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
    }
  }



  // 게시판 상세 > 좋아요

  @Override
  @GetMapping("/reviewLikeCall")
  public void reviewLikeCall(@RequestParam(value = "reviewId", required = true) String reviewId,
      HttpServletResponse response) throws Exception {

    reviewService.updateLikeCount(reviewId);

    int likeCnt = reviewService.getLikeCount(reviewId);

    PrintWriter out = response.getWriter();
    DecimalFormat decFormat = new DecimalFormat("###,###");
    String likeCntStr = decFormat.format(likeCnt);

    out.append(likeCntStr);
    out.flush();
    System.out.println("reviewLikeCall reviewId : " + reviewId);
  }



  @Override
  @GetMapping("/modifyForm")
  public ModelAndView modifyForm(@RequestParam("reviewId") int reviewId) {
    ModelAndView mv = new ModelAndView();
    try {
      ReviewVO review = reviewService.getBoard(reviewId);
      mv.addObject("review", review);
      mv.setViewName("/board/modify");
    } catch (Exception e) {
      e.printStackTrace();
      mv.addObject("err", "조회 실패");
      mv.setViewName("/review/err");
    }
    return mv;
  }

  @Override
  @PostMapping("/modify")
  public ModelAndView boardModify(@ModelAttribute ReviewVO review) {
    ModelAndView mv = new ModelAndView();
    try {
      reviewService.modifyBoard(review);
      mv.addObject("reviewId", review.getReviewId());
      mv.setViewName("redirect:/review/board_review_detail");
    } catch (Exception e) {
      e.printStackTrace();
      mv.addObject("err", e.getMessage());
      mv.setViewName("/review/err");
    }
    return mv;
  }


  // 게시글 삭제
  @Override
  @GetMapping("/boarddelete")
  public ModelAndView removeBoard(@RequestParam("reviewId") int reviewId,
      @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
    ModelAndView mv = new ModelAndView();
    try {
      reviewService.removeBoardComm(reviewId);
      reviewService.removeBoard(reviewId);
      mv.addObject("page", page);
      mv.setViewName("redirect:/review/board_review");
    } catch (Exception e) {
      e.printStackTrace();
      mv.addObject("err", e.getMessage());
      mv.setViewName("/board/err");
    }
    return mv;
  }



  // 댓글 달기
  @Override
  @RequestMapping(value = "/addComm", method = RequestMethod.POST)
  public ModelAndView addRComm(@ModelAttribute RCommVO rComm) {
    System.out.println(rComm.getReviewId());
    System.out.println(rComm.getEmail());
    ModelAndView mv = new ModelAndView();

    try {
      reviewService.addRComm(rComm);
      mv.setViewName("redirect:/review/board_review_detail?reviewId=" + rComm.getReviewId());

    } catch (Exception e) {
      e.printStackTrace();
      mv.addObject("err", "오류 발생");
      mv.setViewName("/board/err");
    }
    return mv;
  }


  // 대댓글 달기
  @Override
  @RequestMapping(value = "/addCommChild", method = RequestMethod.POST)
  public ModelAndView addCommChild(@ModelAttribute RCommVO rComm) {
    System.out.println(rComm.getEmail());
    ModelAndView mv = new ModelAndView();

    try {
      reviewService.addRCommChild(rComm);
      mv.setViewName("redirect:/review/board_review_detail?reviewId=" + rComm.getReviewId());

    } catch (Exception e) {
      e.printStackTrace();
      mv.addObject("err", "오류 발생");
      mv.setViewName("/review/err");
    }
    return mv;
  }

  // 댓글 작성자 프로필사진
  @GetMapping(value = "/commImg/{email}")
  public ResponseEntity<byte[]> getcommImg(@PathVariable String email) throws Exception {
    FileVO file = reviewService.getCommImg(email);
    final HttpHeaders headers = new HttpHeaders(); // 상수화
    if (file != null) {
      String[] mtypes = file.getFileContentType().split("/");
      headers.setContentType(new MediaType(mtypes[0], mtypes[1]));
      headers.setContentDispositionFormData("attachment", file.getFileName());
      headers.setContentLength(file.getFileSize());
      return new ResponseEntity<byte[]>(file.getFileData(), headers, HttpStatus.OK);
    } else {
      return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
    }
  }

  // 댓글 삭제
  @Override
  @GetMapping("/boardcommdelete")
  public ModelAndView removeBoardComm(@RequestParam("reviewId") int reviewId,
      @RequestParam("comId") int comId) {
    System.out.println("comId:" + comId);
    ModelAndView mv = new ModelAndView();
    try {
      reviewService.removeBoardComm(comId);
      mv.setViewName("redirect:/review/board_review_detail?reviewId=" + reviewId);
    } catch (Exception e) {
      e.printStackTrace();
      mv.addObject("err", e.getMessage());
      mv.setViewName("/board/err");
    }
    return mv;
  }



}
