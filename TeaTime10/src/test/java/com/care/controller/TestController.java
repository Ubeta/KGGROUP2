package com.care.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {

	@RequestMapping("l_header")
	public String l_header() {
		return "l_header";
	}
	@RequestMapping("m_header")
	public String m_header() {
		return "m_header";
	}
	
	
}
