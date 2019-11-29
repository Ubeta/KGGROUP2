package com.care.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.ModelDAO;
import com.care.modelDTO.ReplyDTO;

@Service
public class AddCommentService implements IService{

	@Autowired
	ModelDAO mdao;

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpSession session = (HttpSession)map.get("replyId");
		String m_id = (String) session.getAttribute("mid");
		ReplyDTO redto = (ReplyDTO) map.get("reply_dto");
		redto.setM_id(m_id);
		mdao.addComment(redto);
		
	}
	
	
}
