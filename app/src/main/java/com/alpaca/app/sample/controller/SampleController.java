package com.alpaca.app.sample.controller;

import com.alpaca.app.security.dto.AuthMemberDTO;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Log4j2
@RequestMapping("/sample/")
public class SampleController {

    /**
     *  회원 비회원 모두 접근 가능
     */
    @GetMapping("/all")
    public void exAll(){
        log.info("exAll..........");
    }

    /**
     *  회원만 접근 가능
     * @param authMemberDTO
     */
    @GetMapping("/member")
    public void exMember(@AuthenticationPrincipal AuthMemberDTO authMemberDTO){
        log.info("exMember..........");
        log.info("--------------------------");
        log.info(authMemberDTO);
    }

    /**
     *  관리자만 접근 가능
     */
    @GetMapping("/admin")
    public void exAdmin(){
        log.info("exAdmin..........");
    }

}