package com.care.service;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.ModelDAO;
import com.care.modelDTO.CategoryDTO;
@Service
public class CategoryCall implements IService{

	@Autowired
	ModelDAO mdao;
	
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		CategoryDTO cdto = (CategoryDTO)map.get("sessionid");
		cdto = mdao.mcategorychk(cdto.getM_id());
//		ArrayList<String> ylist = new ArrayList<String>();
		Map<String, Object> listmap = new TreeMap<String, Object>();
		Map<String, Object> ymap = new TreeMap<String, Object>();
		Map<String, Object> nmap = new TreeMap<String, Object>();
		
		listmap.put("sports", cdto.getC_sports());
		listmap.put("news", cdto.getC_news());
		listmap.put("food",cdto.getC_food());
		listmap.put("language",cdto.getC_language());
		listmap.put("people",cdto.getC_people());
		listmap.put("animal",cdto.getC_animal());
		listmap.put("fashion",cdto.getC_fashion());
		listmap.put("love",cdto.getC_love());
		listmap.put("movie",cdto.getC_movie());
		listmap.put("religion",cdto.getC_religion());
		listmap.put("knowledge",cdto.getC_knowledge());
		listmap.put("travel",cdto.getC_travel());
		listmap.put("cartoon",cdto.getC_cartoon());
		listmap.put("game",cdto.getC_game());
		listmap.put("it",cdto.getC_it());
		listmap.put("weather",cdto.getC_weather());
		listmap.put("music",cdto.getC_music());
		listmap.put("car",cdto.getC_car());
		listmap.put("economy",cdto.getC_economy());
		listmap.put("etc",cdto.getC_etc());
		listmap.put("job",cdto.getC_job());
		listmap.put("living",cdto.getC_living());
		listmap.put("book",cdto.getC_book());
		listmap.put("festival",cdto.getC_festival());
		listmap.put("health",cdto.getC_health());
		model.addAttribute("listmap",listmap);
		Iterator<String> iterator = listmap.keySet().iterator();
		while(iterator.hasNext()) {
			String key = (String)iterator.next();
			if(listmap.get(key).equals("Y")) {
				ymap.put(key, key);
			}else {
				nmap.put(key, key);
			}
		}
		Map<String, Object> totalmap = new HashMap<String, Object>();
		totalmap.put("Y", ymap);
		totalmap.put("N", nmap);
		model.addAttribute("totalmap",totalmap);
			
	}
	

}
