package com.care.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.ModelDAO;

@Service
public class FriendPostService implements IService{

	@Autowired
	ModelDAO mdao;

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpSession request = (HttpSession)map.get("friendLists");
		String myId = (String) request.getAttribute("mid");
		//System.out.println("친구포스트 아이디 : " + myId);
		model.addAttribute("fPost",mdao.friendPost(myId));
	}
	
	
}
