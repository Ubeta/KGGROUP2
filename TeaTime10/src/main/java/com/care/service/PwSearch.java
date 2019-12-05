package com.care.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.ModelDAO;
import com.care.modelDTO.MemberDTO;
@Service
public class PwSearch implements IService{

	@Autowired
	private ModelDAO mdao;
	
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		MemberDTO mdto = (MemberDTO)map.get("mdto");
		String mpw = mdao.pwfind(model);
		if(mpw==null) {
			model.addAttribute("pwfind","notfindpw");
		}else {
			model.addAttribute("pwfind","ok");
			model.addAttribute("pwfind1",mdto.getM_id());
		}
	}

}
