package com.care.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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

import com.care.modelDTO.PostDTO;
import com.care.modelDTO.ReplyDTO;
import com.care.service.IService;
import com.care.service.UAcceptFriendRequestService;
import com.care.service.UCancelFriendRequestService;
import com.care.service.UCheckFriendService;
import com.care.service.UGetFriendRequestListService;
import com.care.service.UGetReplyOneService;
import com.care.service.UGetReplyPacketService;
import com.care.service.ULookUpService;
import com.care.service.UPostAllScopeService;
import com.care.service.UPostFriendScopeService;
import com.care.service.UPostService;
import com.care.service.URejectFriendRequestService;
import com.care.service.URemoveFriendService;
import com.care.service.UReplyInputService;
import com.care.service.USendFriendRequestService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	IService ser;
	private static int userPostCount = 3;
	private static int userReplyCount = 0;

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
	@RequestMapping("/header/u_header")
	public String u_header() {
		return "/header/u_header";
	}
	@RequestMapping("login")
	public String login() {
		return "login";
	}
	@RequestMapping("u_page")
	public String u_page(Model model, HttpServletRequest request) {
		userPostCount = 3;
		model.addAttribute("request", request);
		ser = context.getBean("ULookUpService", ULookUpService.class);
		ser.execute(model);
		
		ser = context.getBean("UCheckFriendService", UCheckFriendService.class);
		ser.execute(model);
		Map<String, Object> map = model.asMap();
		String isFriend = (String)map.get("isFriend");
		if (isFriend.equals("2")) {
			ser = context.getBean("UPostFriendScopeService", UPostFriendScopeService.class);
			ser.execute(model);
		} else {
			ser = context.getBean("UPostAllScopeService", UPostAllScopeService.class);
			ser.execute(model);
		}
		
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
	@ResponseBody
	@RequestMapping(value="u_page_friendReject")
	public String u_page_friendReject(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		ser = context.getBean("URejectFriendRequestService", URejectFriendRequestService.class);
		ser.execute(model);
		Map<String, Object> map = model.asMap();
		String result = (String) map.get("addFriendSuccess");
		return result;
	}
	@ResponseBody
	@RequestMapping("show_more_user_posts")
	public Map<String, Object> showMoreUserPosts(Model model, HttpServletRequest request){
		model.addAttribute("request", request);
		
		ser = context.getBean("UCheckFriendService", UCheckFriendService.class);
		ser.execute(model);
		Map<String, Object> map = model.asMap();
		String isFriend = (String)map.get("isFriend");
		if (isFriend.equals("2")) {
			ser = context.getBean("UPostFriendScopeService", UPostFriendScopeService.class);
			ser.execute(model);
		} else {
			ser = context.getBean("UPostAllScopeService", UPostAllScopeService.class);
			ser.execute(model);
		}
		
		int postCount = userPostCount;
		Map<String, Object> userPosts = new HashMap<String, Object>();
		Map<String, Object> map2 = model.asMap();
		List<PostDTO> postList = (ArrayList<PostDTO>)map2.get("userPosts");
		
		System.out.println(postList);
		
		if (postCount < postList.size()) {
			userPosts.put("post", postList.get(postCount));
			userPosts.put("morePosts", true);
			System.out.println(postList.get(postCount).getP_cat());
			userPostCount++;
			return userPosts;
		} else {
			userPosts.put("morePosts", false);
			return userPosts;
		}
	}
	
	@ResponseBody
	@RequestMapping(value="reply_post_send")
	public String replyPostSend(Model model, ReplyDTO redto) {
		System.out.println("replyDTO idgroup: " + redto.getM_id());
		System.out.println("replyDTO idgroup: " + redto.getR_idgroup());
		System.out.println("replyDTO idgroup: " + redto.getR_content());
		model.addAttribute("redto", redto);
		ser = context.getBean("UReplyInputService", UReplyInputService.class);
		ser.execute(model);
		Map<String, Object> map = model.asMap();
		String result = (String) map.get("replyAddSuccess");
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="post_reply_show")
	public Map<String, Object> postReplyShow(Model model, HttpServletRequest request) {
		int originalCounter = Integer.parseInt(request.getParameter("counter"));

		int lowerBoundCounter = originalCounter - 2;
		int upperBoundCounter = originalCounter + 2;
		model.addAttribute("request", request);
		model.addAttribute("lowerBound", lowerBoundCounter);
		model.addAttribute("upperBound", upperBoundCounter);
		
		ser = context.getBean("UGetReplyPacketService", UGetReplyPacketService.class);
		ser.execute(model);
		
		Map<String, Object> map = model.asMap();
		ArrayList<ReplyDTO> replyPacketList = (ArrayList<ReplyDTO>)map.get("replyPackets");
		
		Map<String, Object> replyPackets = new HashMap<String, Object>();
		replyPackets.put("reply", replyPacketList);
		return replyPackets;
		
	}
	
	@ResponseBody
	@RequestMapping("post_reply_show_one")
	public Map<String, Object> postReplyShowOne(Model model, HttpServletRequest request){
		model.addAttribute("request", request);
		ser = context.getBean("UGetReplyOneService", UGetReplyOneService.class);
		ser.execute(model);
		
		Map<String, Object> oneReply = new HashMap<String, Object>();
		Map<String, Object> map = model.asMap();
		ReplyDTO reply = (ReplyDTO) map.get("replyOne");
		oneReply.put("oneReply", reply);
		return oneReply;
		
	}

}
