package com.team.interview;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

// basePackages 지정하지 않더라도 com.team.interview.* 를 탐색하며 스프링 빈 등록
//@Configuration
//@ComponentScan(basePackages = "com.team.interview")
//@MapperScan(value = {"com.team.interview.dao"})
public class AppConfig {
}

