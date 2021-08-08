package com.alpaca.app.sample.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface TimeMapper {

    //xml 대신 어노테이션으로도 SQL을 쓸 수 있음. 취향껏 선택할 것
    @Select("select sysdate from dual")
    public String getTime();

    //XML 방식
    public String getTime2();


}
