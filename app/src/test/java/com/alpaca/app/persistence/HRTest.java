package com.alpaca.app.persistence;

import com.alpaca.app.sample.mapper.HRMapper;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
public class HRTest {

    @Autowired
    private HRMapper hrMapper;

    //어노테이션 방식
    @Test
    public void testGetName() {
        log.info("member class name: " + hrMapper.getClass().getName());
        log.info("member  name: " + hrMapper.getName());
    }

    //xml 방식
    @Test
    public void testGetName2() {
        log.info("member class name: " + hrMapper.getClass().getName());
        log.info("member  name: " + hrMapper.getName2());
    }

}
