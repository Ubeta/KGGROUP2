package com.care.controller;

import org.springframework.stereotype.Controller;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.modelDTO.CategoryDTO;
import com.care.modelDTO.MemberDTO;
import com.care.modelDTO.PostDTO;
import com.care.service.CategoryCall;
import com.care.service.CategoryUpdate;
import com.care.service.IService;
import com.care.service.KakaoLoginService;
import com.care.service.MCategoryService;
import com.care.service.MLoginPostService;
import com.care.service.MRegisterService;
import com.care.service.NaverLoginBO;
import com.care.service.NaverLoginService;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
public class APILoginController {
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	private IService ser;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	@Autowired
	ApplicationContext context = ApplicationContextprovider.applicationContext;

	//로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		//네이버
		model.addAttribute("url", naverAuthUrl);
		return "login";
	}

	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		//1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
		/** apiResult json 구조
	{"resultcode":"00",
	"message":"success",
	"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/
		//2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		//3. 데이터 파싱
		//Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		// 회원된 아이디가 있는지 확인
		model.addAttribute("response_obj",response_obj);
		//
//		   아래의 네이버 로그인서비스도 필요없어진다. 그냥 멤버테이블에서 찾으면 됨.
		//
		ser = context.getBean("naverLoginService", NaverLoginService.class);
		ser.execute(model);
		Map<String, Object> map = model.asMap();
		String result = (String)map.get("result");
		String id = (String)response_obj.get("id");
		if(result.equals("ok")) {
			//response의 id값 파싱
			//4.파싱 닉네임 세션으로 저장
			session.setAttribute("nid", id); //세션 생성
			session.setAttribute("mid", id);
			return "redirect:main";
			
		}else {
			session.setAttribute("nid", id);
			return "naverRegister";
		}
	}

	//로그아웃
	@RequestMapping(value = "logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session)throws IOException {
		session.invalidate();
		return "redirect:login";
	}
	///////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////

	@RequestMapping(value="kakaologout")
	public String kakaologout(HttpSession session) {
		session.invalidate();
		return "redirect:login";
	}


	@RequestMapping("kakao_loginchk")
	public String maintest(HttpServletRequest request,Model model) {
		model.addAttribute("request",request);
		ser = context.getBean("kakaoLoginService", KakaoLoginService.class);
		ser.execute(model);
		Map<String, Object> map = model.asMap();
		String result = (String)map.get("result");
		HttpSession session = request.getSession();
		if(result.equals("ok")) { // 이미 있는 아이디
			session.setAttribute("kid", request.getParameter("id"));
			session.setAttribute("mid", request.getParameter("id"));
			return "redirect:main";
		}else {
			return "kakaoFirstRegister";
		}
	}

	
	
	@RequestMapping("userpost")
	public String userpost(Model model, HttpSession session) {
		model.addAttribute("session",session);
		if(session.getAttribute("nid")!=null) {
			model.addAttribute("lo","login");
			return "naversessionend";
		}
		return "login";
	}
	@RequestMapping("everylogout")
	public String everylogout(HttpSession session,Model model) {
		if(session.getAttribute("sid")!=null) {
			return "logout2";
		}else if(session.getAttribute("nid")!=null) {
			model.addAttribute("lo","logout");
			return "naversessionend";
		}else {
			return "kakaologout2";
		}
		
	}
	@ResponseBody
	@RequestMapping("categorycall")
	public Map<String, Object> categorycall(CategoryDTO cdto, Model model){		
		model.addAttribute("sessionid",cdto);
		ser = context.getBean("categoryCall", CategoryCall.class);
		ser.execute(model);
		Map<String, Object> maincat = model.asMap();
		Map<String, Object> maincat_map = (Map<String, Object>) maincat.get("totalmap"); 
		return maincat_map;
		
	}
	
	@RequestMapping("catupdate")
	public String aaaaa(CategoryDTO cdto,Model model) {
		model.addAttribute("cateupdate",cdto);
		ser = context.getBean("categoryUpdate",CategoryUpdate.class);
		ser.execute(model);
		return "redirect:main";
	}


}
