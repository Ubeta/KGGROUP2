package com.care.controller;

import org.springframework.stereotype.Controller;
import java.io.IOException;
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

import com.care.modelDTO.CategoryDTO;
import com.care.modelDTO.NaverDTO;
import com.care.service.IService;
import com.care.service.KakaoLoginService;
import com.care.service.MCategoryService;
import com.care.service.NaverLoginBO;
import com.care.service.NaverLoginService;
import com.care.service.kakaoapi;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
public class APILoginController {
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	private IService ser;
	@Autowired
	kakaoapi kakao;

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
		ser = context.getBean("naverLoginService", NaverLoginService.class);
		ser.execute(model);
		Map<String, Object> map = model.asMap();
		String result = (String)map.get("result");
		String id = (String)response_obj.get("id");
		if(result.equals("ok")) {
			//response의 id값 파싱
			//4.파싱 닉네임 세션으로 저장
			session.setAttribute("nid" , id); //세션 생성
			return "main";
			
		}else {
			session.setAttribute("nid", id);
			return "category";
		}
	}

	//로그아웃
	@RequestMapping(value = "logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session)throws IOException {
		System.out.println(session.getAttribute("sid") + "  :  세션아이디");
		session.invalidate();
		return "redirect:login";
	}
	///////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////

	@RequestMapping(value="kakaologout")
	public String kakaologout(HttpSession session) {
		kakao.kakaoLogout((String)session.getAttribute("kid"));
		session.removeAttribute("kid");
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
			session.setAttribute("sessiont", "kakao");
			return "main";
			
		}else {
			session.setAttribute("kid", request.getParameter("id"));
			return "category";
		}
	}

	
	@RequestMapping("categoryregister")
	public String categoryregister(HttpServletRequest request,Model model) {
		model.addAttribute("register",request);
		System.out.println(request.getParameter("m_id"));
		ser = context.getBean("MCategoryService", MCategoryService.class);
		ser.execute(model);
		model.addAttribute("du","regiOk");
		System.out.println("registerchk전임 여기까진 잘 됨.");
		/*
		 * 
		 * 여기서 디비에서 카테고리 내가 선택한 카테고리 내용을 가져오고
		 * 다시 한번 디비에서 내가 선택한 카테고리의 게시글들을 가져온 후
		 * 리스트에 담아서 아래처럼 담아서 넘겨줌 ???는 글의 정보를 넣어야 함 
		 * posts는 
		   ArrayList<PostDTO> posts = new ArrayList<PostDTO>();
		      각 posts마다 하나의 글을 보내고
		   model.addAttribute("posts",posts);
		      로 넘겨주고 메인이든 어디든 출력한다.
		 * */
		return "registerchk";
	}




}
