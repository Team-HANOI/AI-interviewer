package com.alpaca.app.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface HRMapper {

    @Select("SELECT mem_id FROM tbl_member  where mno= 40")
    public String getName();

    public String getName2();
}
