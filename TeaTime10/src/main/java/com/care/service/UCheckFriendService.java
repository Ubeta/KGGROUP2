package com.care.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.ModelDAO;
import com.care.modelDTO.MyFriendDTO;

@Service
public class UCheckFriendService implements IService {

	@Autowired
	ModelDAO dao;
	
	@Override
	public void execute(Model model) {
		
		int friendStatus = 0;
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		
		String u_id = request.getParameter("u_id");
		String m_id = (String)session.getAttribute("mid");
		
		MyFriendDTO mfdto = new MyFriendDTO();
		
		mfdto.setM_id(m_id);
		mfdto.setF_id(u_id);
		friendStatus = dao.checkFriendStatus(mfdto);
		if (friendStatus == 2) {
			model.addAttribute("isFriend", "2");
		} else if (friendStatus == 1) {
			model.addAttribute("isFriend", "1");
		} else {
			model.addAttribute("isFriend", "0");
		}
		
	}

}
