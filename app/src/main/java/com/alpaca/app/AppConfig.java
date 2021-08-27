package com.alpaca.app;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

// basePackages 吏��젙�븯吏� �븡�뜑�씪�룄 com.alpaca.app.* 瑜� �깘�깋�븯硫� �뒪�봽留� 鍮� �벑濡�
@Configuration
@ComponentScan(basePackages = "com.alpaca.app")
@MapperScan(value = {"com.alpaca.app.sample.mapper"})
@MapperScan(value = {"com.alpaca.app.board.dao"})
public class AppConfig {

}

