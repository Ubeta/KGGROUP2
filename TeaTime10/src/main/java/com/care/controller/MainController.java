package com.care.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.modelDTO.MemberDTO;
import com.care.service.FListService;
import com.care.service.IService;
import com.care.service.MCategoryService;
//import com.care.service.MCategoryService;
import com.care.service.MLoginService;
import com.care.service.MRegisterService;

@Controller
public class MainController {
	IService ser;
	
	@Autowired
	ApplicationContext context = ApplicationContextprovider.applicationContext;
	
	
	@RequestMapping(value = "register")
	public String register(Model model, HttpServletRequest request) {
		return "register";
	}
	
	@RequestMapping(value = "register_chk")
	public String register_chk(Model model, MultipartHttpServletRequest request) {
		model.addAttribute("register", request);
		//model.addAttribute("multipartRequest", multipartRequest);
		ser = context.getBean("MRegisterService", MRegisterService.class);
		ser.execute(model);
		ser = context.getBean("MCategoryService", MCategoryService.class);
		ser.execute(model);
		return "registerchk";
	}
	@RequestMapping("loginchk")
	public String loginchk(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		ser = context.getBean("MLoginService", MLoginService.class);
		ser.execute(model);
		return "loginchk";
	}
	@RequestMapping("main")
	public String main(Model model,HttpServletRequest request) {
		System.out.println("abc"+request.getAttribute("id"));
		return "main";
	}
	@RequestMapping(value = "mypage")
	public String mypage(){
		return "mypage";
	}
	//친구 게시글만 보는 페이지 
		@RequestMapping("f_page")
		public String f_page(Model model) {
			ser = context.getBean("FListService", FListService.class);
			ser.execute(model);
			return "f_page";
		}
}
