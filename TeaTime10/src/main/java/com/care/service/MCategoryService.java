package com.care.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.ModelDAO;
import com.care.modelDTO.CategoryDTO;


@Service
public class MCategoryService implements IService{

	@Autowired
	ModelDAO mdao;

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("register");
		CategoryDTO cdto = new CategoryDTO();
		cdto.setM_id(request.getParameter("m_id"));
		System.out.println(request.getParameter("m_id"));
		cdto.setC_sports(request.getParameter("c_sports"));
		cdto.setC_news(request.getParameter("c_news"));
		cdto.setC_food(request.getParameter("c_food"));
		cdto.setC_language(request.getParameter("c_language"));
		cdto.setC_people(request.getParameter("c_people"));
		cdto.setC_animal(request.getParameter("c_animal"));
		cdto.setC_fashion(request.getParameter("c_fashion"));
		cdto.setC_love(request.getParameter("c_love"));
		cdto.setC_movie(request.getParameter("c_movie"));
		cdto.setC_religion(request.getParameter("c_religion"));
		cdto.setC_knowledge(request.getParameter("c_knowledge"));
		cdto.setC_travel(request.getParameter("c_travel"));
		cdto.setC_cartoon(request.getParameter("c_cartoon"));
		cdto.setC_game(request.getParameter("c_game"));
		cdto.setC_it(request.getParameter("c_it"));
		cdto.setC_weather(request.getParameter("c_weather"));
		cdto.setC_music(request.getParameter("c_music"));
		cdto.setC_car(request.getParameter("c_car"));
		cdto.setC_economy(request.getParameter("c_economy"));
		cdto.setC_etc(request.getParameter("c_etc"));
		cdto.setC_job(request.getParameter("c_job"));
		cdto.setC_book(request.getParameter("c_book"));
		cdto.setC_living(request.getParameter("c_living"));
		cdto.setC_festival(request.getParameter("c_festival"));
		cdto.setC_health(request.getParameter("c_health"));
		model.addAttribute("catchk",mdao.category(cdto));	
		//test file
	}
	
}
