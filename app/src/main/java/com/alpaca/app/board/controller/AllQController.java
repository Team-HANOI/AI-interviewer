package com.alpaca.app.board.controller;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface AllQController{
	ModelAndView AllQList(@RequestParam(value="pg", required=false, defaultValue="1") int pg);
}
