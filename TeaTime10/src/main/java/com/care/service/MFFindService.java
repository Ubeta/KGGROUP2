package com.care.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.ModelDAO;
@Service
public class MFFindService implements IService{
	@Autowired
	private ModelDAO mdao;
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		String f_id = null;
		f_id = (String)map.get("f_id");
		model.addAttribute("finfo", mdao.f_info(f_id));
	}

}
