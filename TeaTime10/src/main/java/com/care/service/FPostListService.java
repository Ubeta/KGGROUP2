package com.care.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.ModelDAO;
import com.care.modelDTO.ReplyDTO;

@Service
public class FPostListService implements IService{

	@Autowired
	ModelDAO mdao;

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HashMap session = (HashMap)map.get("friendLists");
		HashMap<String, Object> fpageParameter = new HashMap<String, Object>();
		System.out.println("세션아이디 : " +session.get("sid"));
		System.out.println("파라미터 값 : " +session.get("page_no"));
		//String myId = (String) session.getAttribute("sid");
		//String listNum = (String)request.getAttribute("page_no");
		//fpageParameter.put("sid", myId);
		//fpageParameter.put("page_no", listNum);
		
		
		//System.out.println("페이지 넘 : " + listNum);
		//System.out.println("친구포스트 아이디 : " + myId);
		model.addAttribute("fPost",mdao.friendPostList(session));
	}
}
