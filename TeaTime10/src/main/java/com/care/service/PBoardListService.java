package com.care.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMethod;

import com.care.modelDAO.ModelDAO;

@Service
public class PBoardListService implements IService{
	@Autowired
	private ModelDAO mdao;
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		String sessionid = (String)map.get("sessionid");
				
		model.addAttribute("board_list", mdao.board_list(sessionid));
	}

}
