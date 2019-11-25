package com.care.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.ModelDAO;


@Service
public class PBoardListService implements IService{
	@Autowired
	private ModelDAO mdao;
	
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		//String sessionid = (String)map.get("sessionid");
		String sessionid = "1";
		model.addAttribute("boardlist", mdao.board_list(sessionid));
		
	}

}
