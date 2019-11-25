package com.care.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.ModelDAO;
@Service
public class MUserFindService implements IService{
	@Autowired
	private ModelDAO mdao;
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		String user_id = (String)map.get("user_id");
		model.addAttribute("userinfo", mdao.f_info(user_id));
	}

}
