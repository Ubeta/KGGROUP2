package com.care.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.ModelDAO;

@Service
public class IDchk implements IService{

	@Autowired
	private ModelDAO mdao;
	
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String m_id = request.getParameter("m_id");
		String result = mdao.idchk(m_id);
		if (result == null) {
			model.addAttribute("idresult","ok");
		}else {
			model.addAttribute("idresult","no");
		}
	}

}
