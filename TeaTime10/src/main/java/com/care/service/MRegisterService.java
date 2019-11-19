package com.care.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.modelDAO.ModelDAO;
import com.care.modelDTO.MemberDTO;

@Service
public class MRegisterService implements IService{
	@Autowired
	ModelDAO dao;
	
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		map.get("register");
		
		//HttpServletRequest request = (HttpServletRequest)map.get("register");
		MultipartHttpServletRequest request = (MultipartHttpServletRequest)map.get("register");
		//John 수정
		MultipartFile multipartFile = request.getFile("profilePic");
		String originalFileName = multipartFile.getOriginalFilename();
		String storedFileName = System.currentTimeMillis() + originalFileName;
		String filePath = "C:\\TeaTime\\";
		
		String id = request.getParameter("m_id");
		String pw = request.getParameter("m_pw");
		String name = request.getParameter("m_name");
		String idnum = request.getParameter("m_idnum");
		String gender = request.getParameter("m_gender");
		String tel = request.getParameter("m_tel");
		String mail = request.getParameter("m_mail");
		MemberDTO mdto = new MemberDTO();
		mdto.setM_id(id);
		mdto.setM_pw(pw);
		mdto.setM_name(name);
		mdto.setM_idnum(idnum);
		mdto.setM_gender(Integer.parseInt(gender));
		mdto.setM_tel(tel);
		mdto.setM_mail(mail);
		
		mdto.setM_pic(storedFileName);
		try {
			Files.copy(multipartFile.getInputStream(), Paths.get(filePath, storedFileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("du",dao.register(mdto, id, tel, mail));
	}

}
