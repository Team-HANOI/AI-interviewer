package com.alpaca.app.board.service;

import java.util.List;

import com.alpaca.app.board.vo.PgInfo;
import com.alpaca.app.board.vo.Quest;


public interface AllService {
    List<Quest> getAllQList(int pg, PgInfo pgInfo) throws Exception;
    
}
