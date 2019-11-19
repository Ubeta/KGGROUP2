package com.care.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.ModelDAO;
import com.care.modelDTO.MyFriendDTO;

@Service
public class UCheckFriendService implements IService {

	@Autowired
	ModelDAO dao;
	MyFriendDTO mfdto;
	
	@Override
	public void execute(Model model) {
		
		int ifFriend = 0;
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String m_id = request.getParameter("m_id");
		String u_id = request.getParameter("u_id");
		mfdto.setM_id(m_id);
		mfdto.setF_id(u_id);
		ifFriend = dao.checkIfFriend(mfdto);
		if (ifFriend == 2) {
			model.addAttribute("isFriend", "2");
		} else if (ifFriend == 1) {
			model.addAttribute("isFriend", "1");
		} else {
			model.addAttribute("isFriend", "0");
		}
		
	}

}
