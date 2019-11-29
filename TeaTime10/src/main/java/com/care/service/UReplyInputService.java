package com.care.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.ModelDAO;
import com.care.modelDTO.ReplyDTO;

@Service
public class UReplyInputService implements IService {

	@Autowired
	ModelDAO dao;
	
	@Override
	public void execute(Model model) {
		int result = 0;
		Map<String, Object> map = model.asMap();
		ReplyDTO redto = (ReplyDTO)map.get("redto");
		System.out.println("reply service dtoid" + redto.getM_id());
		System.out.println("reply service dtoidg" + redto.getR_idgroup());
		System.out.println("reply service dtocontent" + redto.getR_content());
		result = dao.inputPostReply(redto);
		if (result == 1) {
			model.addAttribute("replyAddSuccess", "1");
		} else {
			model.addAttribute("replyAddSuccess", "2");
		}
		
	}

}
