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
import com.care.service.MInfoFixService;
import com.care.service.MLoginPostService;
import com.care.service.MLoginService;
import com.care.service.MMyInfoService;
import com.care.service.MRegisterService;
import com.care.service.MUserFindService;
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
		ser.execute(model); // du = ok
		ser = context.getBean("MCategoryService", MCategoryService.class);
		ser.execute(model); //
		return "registerchk";
	}
	@RequestMapping("loginchk")
	public String loginchk(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		ser = context.getBean("MLoginService", MLoginService.class);
		ser.execute(model);
		Map<String, Object> map = model.asMap();
		String result = (String)map.get("login");
		if(result.equals("2")) {
			System.out.println("result값 : " + result);
			HttpSession session = request.getSession();
			session.setAttribute("mid", request.getParameter("id"));
			System.out.println("깃허브테스트때문에 쓴거임");
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
	
	
	//============================양진영=============================
		//============================내 페이지===========================
		ArrayList<PostDTO> list = new ArrayList<PostDTO>();
		@RequestMapping(value = "mypage")
		public String mypage(Model model,HttpSession session){
			String sessionid = (String)session.getAttribute("mid");
			model.addAttribute("sessionid",sessionid);
			ser = context.getBean("PBoardListService", PBoardListService.class);
			ser.execute(model);
			Map<String, Object> map = model.asMap();
			list = (ArrayList<PostDTO>) map.get("boardlist");
			cnt=1;
			return "mypage";
		}
		//===========================회원정보 수정 후 리다이렉트================
		@RequestMapping(value = "fix_myinfo" , method = RequestMethod.POST)
		public String fix_myinfo(Model model, HttpServletRequest request){
			model.addAttribute("info_fix",request);
			ser = context.getBean("MInfoFixService", MInfoFixService.class);
			ser.execute(model);
			return "redirect:mypage";
		}
		//===========================내정보 리스트 받기===========================
		@ResponseBody
		@RequestMapping(value = "my_info")
		public Map<String, Object> my_info(Model model, HttpSession session) {
			String sessionid = (String)session.getAttribute("mid");
			model.addAttribute("sessionid",sessionid);
			ser = context.getBean("MMyInfoService", MMyInfoService.class);
			ser.execute(model);	
			//========================
			Map<String, Object> map = model.asMap();
			MemberDTO dto = (MemberDTO)map.get("myinfo");
			//=====================
			Map<String, Object> my_info = new HashMap<String, Object>();
			my_info.put("memdto", dto);
			return my_info;
		}
		//===========================유저 찾기===========================
		@ResponseBody
		@RequestMapping(value = "user_find")
		public Map<String, Object> user_find(Model model, MemberDTO mdto) {
			String user_friend = mdto.getM_id();
			model.addAttribute("user_id", user_friend);
			//========================
			Map<String, Object> map = model.asMap();
			ser = context.getBean("MUserFindService", MUserFindService.class);
			ser.execute(model);	
			MemberDTO dto = (MemberDTO)map.get("userinfo");
			//=====================
			Map<String, Object> user_info = new HashMap<String, Object>();
			user_info.put("dto", dto);
			return user_info;
		}
		//===========================친구 추가===========================
		@ResponseBody
		@RequestMapping(value = "friend_add")
		public Map<String, Object> friend_add(Model model, MyFriendDTO mfdto) {
			String f_friend = mfdto.getF_id();
			model.addAttribute("f_id", f_friend);
			ser = context.getBean("FFriendAddService", FFriendAddService.class);
			ser.execute(model);
			Map<String, Object> map = model.asMap();
			int chk = (Integer)map.get("chk");
			Map<String, Object> chkmap = new HashMap<String, Object>();
			chkmap.put("chk", chk);
			return chkmap;
		}
		//===========================개시글 작성===========================
		@ResponseBody
		@RequestMapping(value = "write_board")
		public void write_board(Model model, PostDTO pdto) {
			model.addAttribute("write_board", pdto);
			ser = context.getBean("PWriteBoardService", PWriteBoardService.class);
			ser.execute(model);
		}
		//===========================개시글 리스트===========================
		public static int cnt=1;
		@ResponseBody
		@RequestMapping(value = "boardlist")
		public Map<String, Object> boardlist(Model model, PostDTO podto) {
			Map<String, Object> boardlist_map = new HashMap<String, Object>();
			int i = cnt;
			if(i<list.size()) {
				boardlist_map.put("chk", "true");
				boardlist_map.put("boardlist", list.get(i));
				Map<String, Object> map = model.asMap();
				
				++cnt;
				return boardlist_map;
			}else {
				boardlist_map.put("chk", "false");
				return boardlist_map;
			}
		}
	////////////////////////////////////////////////////////////////
}























