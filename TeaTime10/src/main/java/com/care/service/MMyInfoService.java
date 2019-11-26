package com.care.service;

import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.ModelDAO;

@Service
public class MMyInfoService implements IService{
	
	
	@Autowired
	private ModelDAO mdao;
	
	
	@Override
	public void execute(Model model) {
		//세션 아이디 받기
		Map<String, Object> map = model.asMap();
		String sessionid = (String)map.get("sessionid");
		//String sessionid = "1";
		
		model.addAttribute("myinfo", mdao.my_info(sessionid));
		
		
		
	}

}
