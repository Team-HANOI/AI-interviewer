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
public interface HRMapper {

    /**
     * 어노테이션으로 SQL 실행하는 법 예시
     *  플젝이랑 관련없음. 디비 테스트
     * @return 아이디
     */
    @Select("SELECT mem_id FROM tbl_member  where mno= 40")
    public String getName();

    /**
     * xml로 SQL 실행하는 법 예시
     * @return 아이디
     */
    public String getName2();
}
