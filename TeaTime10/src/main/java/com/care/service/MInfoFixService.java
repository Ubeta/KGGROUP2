package com.care.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.ModelDAO;
import com.care.modelDTO.MemberDTO;

@Service
public class MInfoFixService implements IService{
	@Autowired
	private ModelDAO dao;

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("info_fix");
		
		String id = request.getParameter("my_id");
		String name = request.getParameter("my_name");
		String tel = request.getParameter("my_tel");
		String mail = request.getParameter("my_mail");
		
		MemberDTO mdto = new MemberDTO();
		mdto.setM_id(id);
		mdto.setM_name(name);
		mdto.setM_tel(tel);
		mdto.setM_mail(mail);
		
		dao.info_fix(mdto);
	}

}
