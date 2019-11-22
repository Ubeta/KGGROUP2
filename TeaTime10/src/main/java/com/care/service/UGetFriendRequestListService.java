package com.care.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.ModelDAO;
import com.care.modelDTO.MemberDTO;
import com.care.modelDTO.MyFriendDTO;

@Service
public class UGetFriendRequestListService implements IService {

	@Autowired
	ModelDAO dao;
	
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		
		String m_id = (String)session.getAttribute("mid");
		
		MyFriendDTO mfdto = new MyFriendDTO();
		
		mfdto.setM_id(m_id);
		
		List<MemberDTO> friendRequests = new ArrayList<MemberDTO>();
		friendRequests = dao.getFriendRequests(mfdto);
		if (!friendRequests.isEmpty()) {
			model.addAttribute("friendRequests", friendRequests);
		} else {
			model.addAttribute("noFriendRequests", true);
		}
		
	}

}
