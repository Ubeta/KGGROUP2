package com.care.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.KakaoDAO;
import com.care.modelDAO.ModelDAO;
import com.care.modelDTO.CategoryDTO;
import com.care.modelDTO.MyFriendDTO;

@Service
public class MLoginPostService implements IService{

	@Autowired
	private ModelDAO mdao;
	@Autowired
	private KakaoDAO kdao;
	
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpSession session = (HttpSession)map.get("session");
		ArrayList<CategoryDTO> plist = new ArrayList<CategoryDTO>();
		String m_id = null;
		if(session.getAttribute("sid")!=null)
			m_id = (String)session.getAttribute("sid");
		else if(session.getAttribute("nid")!=null)
			m_id = (String)session.getAttribute("nid");
		else if(session.getAttribute("kid")!=null)
			m_id = (String)session.getAttribute("kid");
		
		
//		MyFriendDTO frienddto = mdao.myfriend(m_id);
		
		CategoryDTO catedto = mdao.mcategorychk(m_id);
		ArrayList<String> list = new ArrayList<String>();
		System.out.println(catedto.getM_id()+": MLoginPost에서 카테고리가져옴");
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
		
		model.addAttribute("postlist",kdao.post(list));
	}
}
