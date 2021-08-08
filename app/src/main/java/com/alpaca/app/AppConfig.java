package com.alpaca.app;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

// basePackages 지정하지 않더라도 com.alpaca.app.* 를 탐색하며 스프링 빈 등록
@Configuration
@ComponentScan(basePackages = "com.alpaca.app")
// @MapperScan(value = {"com.alpaca.app.mapper"})
public class AppConfig {

}

