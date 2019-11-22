package com.care.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.ModelDAO;
import com.care.modelDTO.CategoryDTO;

@Service
public class MMyCategoryService implements IService{
	@Autowired
	private ModelDAO mdao;

	@Override
	public void execute(Model model) {
		String my_category = null;
		my_category = "1";
		
		model.addAttribute("mycat", mdao.my_cat(my_category));
		Map<String, Object> catmap = model.asMap();
		CategoryDTO cdto = (CategoryDTO) catmap.get("mycat"); 
		
		ArrayList list = new ArrayList();
		list.add(0, (String)cdto.getC_sports());	list.add(1, cdto.getC_news());	list.add(2, cdto.getC_food());	list.add(3, cdto.getC_language());	list.add(4, cdto.getC_people());
		list.add(5, cdto.getC_animal());	list.add(6, cdto.getC_fashion());	list.add(7, cdto.getC_love());	list.add(8, cdto.getC_movie());	list.add(9, cdto.getC_religion());
		list.add(10, cdto.getC_knowledge());	list.add(11, cdto.getC_travel());	list.add(12, cdto.getC_cartoon());	list.add(13, cdto.getC_game());	list.add(14, cdto.getC_it());
		list.add(15, cdto.getC_weather());	list.add(16, cdto.getC_music());	list.add(17, cdto.getC_car());	list.add(18, cdto.getC_economy());	list.add(19, cdto.getC_etc());
		list.add(20, cdto.getC_job());	list.add(21, cdto.getC_living());	list.add(22, cdto.getC_book());	list.add(23, cdto.getC_festival());	list.add(24, cdto.getC_health());
		
		
		System.out.println("================");
		for(int i=0; i<25; i++) {
			System.out.println(list.get(i));
			if(list.get(i).equals("y")) {
				System.out.println("=====================");
				System.out.println(i+"===================");
				System.out.println("=====================");
			}
		}
		System.out.println("end===================");
		
		
	}
}









