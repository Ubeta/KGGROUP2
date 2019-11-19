package com.care.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.ModelDAO;
import com.care.modelDTO.MemberDTO;
import com.care.pojo.MemInfoOrg;

@Service
public class ULookUpService implements IService {

	@Autowired
	ModelDAO dao;

	@Override
	public void execute(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		if (request.getParameter("u_id") != null) {
			String u_id = request.getParameter("u_id");
			MemberDTO member = dao.userLookUp(u_id);
			MemInfoOrg org = new MemInfoOrg();
			member.setM_strgender(org.genderOrg(member.getM_gender()));
			member.setM_tel(org.telOrg(member.getM_tel()));
			member.setM_idnum(org.birthDate(member.getM_idnum()));
			model.addAttribute("member", member);
		}

	}

}
