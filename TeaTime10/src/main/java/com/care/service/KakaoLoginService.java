package com.care.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.KakaoDAO;
import com.care.modelDTO.CategoryDTO;
import com.care.modelDTO.KakaoDTO;

@Service
public class KakaoLoginService implements IService{

	@Autowired
	private KakaoDAO kdao;
	private Map<String, Object> map = null;
	@Override
	public void execute(Model model) {
		CategoryDTO catedto = new CategoryDTO();
		map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String id = request.getParameter("id");
		KakaoDTO dto = new KakaoDTO();
		dto.setK_id(id);
		KakaoDTO dto1 = kdao.kakaologinchk(dto);
		if(dto1==null) {
			System.out.println("첫 로그인 회원가입");
			kdao.resgister(dto); // kmember에 등록함
			dto1 = kdao.kakaologinchk(dto);// kmember에 등록된 정보를 가져옴
//			catedto.setM_id(dto1.getK_id()); // 카테고리에 아이디만셋팅
			                                 // 여기있는세트가 안넘어갈 수도 있음
//			model.addAttribute("result",1);
			model.addAttribute("result",dto1.getK_id()); //result값으로 아이디 넘겨줌
		}else {
			System.out.println("이미 회원가입 됨.");
			catedto = kdao.kakaocategorychk(dto1); // 카테고리값들 가져옴
			model.addAttribute("result","ok");
			ArrayList<String> list = new ArrayList<String>();
			catedto.getM_id();
			System.out.println(catedto.getM_id()+"m_id");
			if (catedto.getC_sports().equals("Y")) {
				list.add("sports");
				System.out.println(catedto.getC_sports()+":sports");
			}
			if (catedto.getC_news().equals("Y")) {
				list.add("news");
				System.out.println(catedto.getC_news()+":news");
			}
			if (catedto.getC_food().equals("Y")) {
				list.add("food");
				System.out.println(catedto.getC_food()+":food");
			}
			if (catedto.getC_language().equals("Y")) {
				list.add("language");
				System.out.println(catedto.getC_language()+":language");
			}
			if (catedto.getC_people().equals("Y")) {
				list.add("people");
				System.out.println(catedto.getC_people()+":people");
			}
			if (catedto.getC_animal().equals("Y")) {
				list.add("animal");
				System.out.println(catedto.getC_animal()+":animal");
			}
			if (catedto.getC_fashion().equals("Y")) {
				list.add("fashion");
				System.out.println(catedto.getC_fashion()+":fashion");
			}
			if (catedto.getC_love().equals("Y")) {
				list.add("love");
				System.out.println(catedto.getC_movie()+":love");
			}
			if (catedto.getC_movie().equals("Y")) {
				list.add("movie");
				System.out.println(catedto.getC_movie());
			}
			if (catedto.getC_religion().equals("Y")) {
				list.add("religion");
				System.out.println(catedto.getC_religion()+":religion");
			}
			if (catedto.getC_knowledge().equals("Y")) {
				list.add("knowledge");
				System.out.println(catedto.getC_knowledge()+":knowledge");
			}
			if (catedto.getC_travel().equals("Y")) {
				list.add("travel");
				System.out.println(catedto.getC_travel()+":travel");
			}
			if (catedto.getC_cartoon().equals("Y")) {
				list.add("cartoon");
				System.out.println(catedto.getC_cartoon()+":cartoon");
			}
			if (catedto.getC_game().equals("Y")) {
				list.add("game");
				System.out.println(catedto.getC_game()+":game");
			}
			if (catedto.getC_it().equals("Y")) {
				list.add("it");
				System.out.println(catedto.getC_it()+":it");
			}
			if (catedto.getC_weather().equals("Y")) {
				list.add("weather");
				System.out.println(catedto.getC_weather()+":weather");
			}
			if (catedto.getC_music().equals("Y")) {
				list.add("music");
				System.out.println(catedto.getC_music()+":music");
			}
			if (catedto.getC_car().equals("Y")) {
				list.add("car");
				System.out.println(catedto.getC_car()+":car");
			}
			if (catedto.getC_economy().equals("Y")) {
				list.add("economy");
				System.out.println(catedto.getC_economy()+":economy");
			}
			if (catedto.getC_etc().equals("Y")) {
				list.add("etc");
				System.out.println(catedto.getC_etc()+":etc");
			}
			if (catedto.getC_job().equals("Y")) {
				list.add("job");
				System.out.println(catedto.getC_job()+":job");
			}
			if (catedto.getC_living().equals("Y")) {
				list.add("living");
				System.out.println(catedto.getC_living()+":living");
			}
			if (catedto.getC_book().equals("Y")) {
				list.add("book");
				System.out.println(catedto.getC_book()+":book");
			}
			if (catedto.getC_festival().equals("Y")) {
				list.add("festival");
				System.out.println(catedto.getC_festival()+":festival");
			}
			if (catedto.getC_health().equals("Y")) {
				list.add("health");
				System.out.println(catedto.getC_health()+":health");
			}
			for (int i = 0; i < list.size(); i++) {
				System.out.println(list.get(i));
			}
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
		}
	}
	
}
