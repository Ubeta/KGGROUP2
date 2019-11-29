package com.care.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.ModelDAO;
import com.care.modelDTO.PostDTO;

@Service
public class RReplyListService implements IService{
	@Autowired
	private ModelDAO mdao;
	
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		int idgroup = (Integer)map.get("idgroup");
		
		model.addAttribute("replylist", mdao.reply_list(idgroup));
		
	}

}