package com.care.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.ModelDAO;
import com.care.modelDTO.ReplyDTO;

@Service
public class GetCommentService implements IService{

	@Autowired
	ModelDAO mdao;

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HashMap reply = (HashMap)map.get("replyList");
		model.addAttribute("rList",mdao.getComment(reply));
	}
	
	
}
