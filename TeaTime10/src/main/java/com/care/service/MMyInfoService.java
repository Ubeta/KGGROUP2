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
		Map<String, Object> map = model.asMap();
		map.get("my_id");
		String session_my_id = null;
		session_my_id = (String)map.get("my_id");
		model.addAttribute("myinfo", mdao.my_info(session_my_id));
		model.addAttribute("mycat", mdao.my_cat(session_my_id));
	}

}
