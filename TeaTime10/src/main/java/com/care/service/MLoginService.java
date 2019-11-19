package com.care.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.ModelDAO;
import com.care.modelDTO.MemberDTO;

@Service
public class MLoginService implements IService{

	@Autowired
	private ModelDAO mdao;
	private Map<String, Object> map = null;

	@Override
	public void execute(Model model) {
		map = model.asMap();
		HttpServletRequest request 
			= (HttpServletRequest)map.get("request");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		MemberDTO memdto = new MemberDTO();
		memdto = mdao.loginchk(id);
		if(memdto==null) {
			model.addAttribute("login","0");
		}else if(memdto!=null) {
			if(memdto.getM_id().equals(id) && !memdto.getM_pw().equals(pw)) {
				model.addAttribute("login","1");
			}else if(memdto.getM_id().equals(id) && memdto.getM_pw().equals(pw)) {
				HttpSession session = request.getSession();
				session.setAttribute("sid", request.getParameter("id"));
				model.addAttribute("login","2");
				/*
				 * 
				 * 여기서 디비에서 카테고리 내가 선택한 카테고리 내용을 가져오고
				 * 다시 한번 디비에서 내가 선택한 카테고리의 게시글들을 가져온 후
				 * 리스트에 담아서 아래처럼 담아서 넘겨줌 ???는 글의 정보를 넣어야 함 
				 * posts는 
				   ArrayList<PostDTO> posts = new ArrayList<PostDTO>();
				      각 posts마다 하나의 글을 보내고
				   model.addAttribute("posts",posts);
				      로 넘겨주고 메인이든 어디든 출력한다.
				 * */
			}
		}
	
	
	}

}
