package com.care.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.ModelDAO;
import com.care.modelDTO.ReplyDTO;

@Service
public class RReplyWriteService implements IService{
	@Autowired
	private ModelDAO mdao;

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		ReplyDTO redto = (ReplyDTO)map.get("reply_write");
		mdao.reply_write(redto);
	}
}
