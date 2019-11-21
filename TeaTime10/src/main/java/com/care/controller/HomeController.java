package com.care.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.service.IService;
import com.care.service.UAcceptFriendRequestService;
import com.care.service.UCancelFriendRequestService;
import com.care.service.UCheckFriendService;
import com.care.service.UGetFriendRequestListService;
import com.care.service.ULookUpService;
import com.care.service.UPostService;
import com.care.service.URemoveFriendService;
import com.care.service.USendFriendRequestService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	IService ser;

	@Autowired
	ApplicationContext context = ApplicationContextprovider.applicationContext;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate );

		return "home";
	}

	//Testing
	@RequestMapping("/header/l_header")
	public String l_header() {
		return "/header/l_header";
	}
	@RequestMapping("/header/m_header")
	public String m_header() {
		return "/header/m_header";
	}
	@RequestMapping("/header/f_header")
	public String f_header() {
		return "/header/f_header";
	}
	@RequestMapping("/header/my_header")
	public String my_header() {
		return "/header/my_header";
	}
	@RequestMapping("login")
	public String login() {
		return "login";
	}
	@RequestMapping("u_page")
	public String u_page(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		ser = context.getBean("ULookUpService", ULookUpService.class);
		ser.execute(model);
		ser = context.getBean("UPostService", UPostService.class);
		ser.execute(model);
		ser = context.getBean("UCheckFriendService", UCheckFriendService.class);
		ser.execute(model);
		ser = context.getBean("UGetFriendRequestListService", UGetFriendRequestListService.class);
		ser.execute(model);
		return "u_page";
	}
	
	@ResponseBody
	@RequestMapping(value="u_page_friendsend")
	public String u_page_friendAdd(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		
		ser = context.getBean("USendFriendRequestService", USendFriendRequestService.class);
		ser.execute(model);
		
		Map<String, Object> map = model.asMap();
		String result = (String) map.get("result");
		
		return result;
		
	}
	@ResponseBody
	@RequestMapping(value="u_page_friendCancel")
	public String u_page_friendCancel(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		
		ser = context.getBean("UCancelFriendRequestService", UCancelFriendRequestService.class);
		ser.execute(model);
		
		Map<String, Object> map = model.asMap();
		String result = (String) map.get("result");
		
		return result;
	}
	@ResponseBody
	@RequestMapping(value="u_page_friendRemove")
	public String u_page_friendRemove(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		ser = context.getBean("URemoveFriendService", URemoveFriendService.class);
		ser.execute(model);
		Map<String, Object> map = model.asMap();
		String result = (String) map.get("removeFriendSuccess");
		return result;
	}
	@ResponseBody
	@RequestMapping(value="u_page_friendAccept")
	public String u_page_friendAccept(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		ser = context.getBean("UAcceptFriendRequestService", UAcceptFriendRequestService.class);
		ser.execute(model);
		Map<String, Object> map = model.asMap();
		String result = (String) map.get("addFriendSuccess");
		return result;
	}

}
