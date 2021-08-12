package com.alpaca.app.sample.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
/**
 * Created by Hyunsik Lee on 2021-08-11
 * Blog : https://hs95blue.github.io/
 * Github : https://github.com/hs95blue
 */
@Mapper
@Repository
public interface TimeMapper {

    /**
     * 어노테이션 방식 예시
      * @return 시간을 String으로
     */
    @Select("select sysdate from dual")
    public String getTime();

    /**
     * XML 방식 예시
     * @return 시간을 String으로
     */
    public String getTime2();


}
