package com.care.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.modelDTO.MemberDTO;
import com.care.modelDTO.MyFriendDTO;
import com.care.modelDTO.PostDTO;
import com.care.service.FFriendAddService;
import com.care.service.FListService;
import com.care.service.FriendPostService;
import com.care.service.IService;
import com.care.service.MCategoryService;
import com.care.service.MFFindService;
import com.care.service.MInfoFixService;
import com.care.service.MLoginPostService;
import com.care.service.MLoginService;
import com.care.service.MMyInfoService;
import com.care.service.MRegisterService;
import com.care.service.PBoardListService;
import com.care.service.PWriteBoardService;

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
		Map<String, Object> map = model.asMap();
		String result = (String)map.get("login");
		System.out.println("loginchk : " + result );
		if(result.equals("2")) {
			System.out.println("result값 : " + result);
			HttpSession session = request.getSession();
			session.setAttribute("sid", request.getParameter("id"));
			session.setAttribute("mid", request.getParameter("id"));
			System.out.println(session.getAttribute("sid"));
			System.out.println(session.getAttribute("mid"));
		}
		return "loginchk";
	}
	/////////////////////////////////////////////////////////////////////////
	
	@RequestMapping("main")
	public String main(Model model,HttpServletRequest request,HttpSession session) {
		System.out.println(session.getAttribute("mid") + " : main들어갈 때");
		if(session.getAttribute("mid")==null) {
			return "main";
		}
		model.addAttribute("session",session);
		ser = context.getBean("MLoginPostService",MLoginPostService.class);
		ser.execute(model);
		//여기서 포스트글 가져와야 됨. 시발
		return "main";
	}
	

	//친구 게시글만 보는 페이지 
	@RequestMapping("f_page")
	public String f_page(Model model, HttpSession session) {
		model.addAttribute("friendLists", session);
		ser = context.getBean("FListService", FListService.class);
		ser.execute(model);
		ser = context.getBean("friendPostService", FriendPostService.class);
		ser.execute(model);
		return "f_page";
	}
	
	
	//////////////////////////////////11.22양진영/////////////////////////////////////
	ArrayList<PostDTO> list = new ArrayList<PostDTO>();
	@RequestMapping(value = "mypage")
	public String mypage(Model model,HttpSession session){
		model.addAttribute("sessionid",session.getAttribute("mid"));
		ser = context.getBean("PBoardListService", PBoardListService.class);
		ser.execute(model);
		Map<String, Object> map = model.asMap();
		list = (ArrayList<PostDTO>) map.get("board_list");
		return "mypage";
	}
	@RequestMapping(value = "fix_myinfo" , method = RequestMethod.POST)
	public String fix_myinfo(Model model, HttpServletRequest request){
		model.addAttribute("info_fix",request);
		ser = context.getBean("MInfoFixService", MInfoFixService.class);
		ser.execute(model);
		return "redirect:mypage";
	}
	/////////////////////////////////////제이손/////////////////////////////////
	
	@ResponseBody
	@RequestMapping(value = "my_info")
	public Map<String, Object> my_info(Model model, MemberDTO mdto) {
		String session_id = null;
		session_id = mdto.getM_id();
		model.addAttribute("session_id", session_id);
		//========================
		Map<String, Object> map = model.asMap();
		ser = context.getBean("MMyInfoService", MMyInfoService.class);
		ser.execute(model);	
		MemberDTO dto = (MemberDTO)map.get("myinfo");
		//=====================
		Map<String, Object> my_info = new HashMap<String, Object>();
		my_info.put("dto", dto);
		return my_info;
	}
	@ResponseBody
	@RequestMapping(value = "friend_find")
	public Map<String, Object> friend_find(Model model, MemberDTO mdto) {
		String f_friend = null;
		f_friend = mdto.getM_id();
		model.addAttribute("f_id", f_friend);
		//========================
		Map<String, Object> map = model.asMap();
		ser = context.getBean("MFFindService", MFFindService.class);
		ser.execute(model);	
		MemberDTO dto = (MemberDTO)map.get("finfo");
		
		//=====================
		Map<String, Object> test_map = new HashMap<String, Object>();
		test_map.put("dto", dto);
		return test_map;
	}
	@ResponseBody
	@RequestMapping(value = "friend_add")
	public void friend_add(Model model, MyFriendDTO mfdto) {
		String f_friend = null;
		f_friend = mfdto.getF_id();
		model.addAttribute("f_id", f_friend);
		//========================
		ser = context.getBean("FFriendAddService", FFriendAddService.class);
		ser.execute(model);	
	}
	@ResponseBody
	@RequestMapping(value = "write_board")
	public void write_board(Model model, PostDTO pdto) {
		model.addAttribute("w_board", pdto);
		//========================
		ser = context.getBean("PWriteBoardService", PWriteBoardService.class);
		ser.execute(model);
	}
	public static int cnt=0;
	@ResponseBody
	@RequestMapping(value = "test")
	public Map<String, Object> test(Model model, PostDTO podto) {
		
		Map<String, Object> test_map = new HashMap<String, Object>();
		int i = cnt;
		if(i<list.size()) {
			list.get(cnt);
			test_map.put("chk", "true");
			test_map.put("b_test", list.get(cnt));
			++cnt;
			return test_map;
		}else {
			test_map.put("chk", "false");
			cnt=0;
			return test_map;
		}
	}
	////////////////////////////////////////////////////////////////
}























