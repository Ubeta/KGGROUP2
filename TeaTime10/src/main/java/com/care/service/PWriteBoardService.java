package com.care.service;

import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.ModelDAO;
import com.care.modelDTO.PostDTO;

@Service
public class PWriteBoardService implements IService{
	@Autowired
	private ModelDAO mdao;
	
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		map.get("w_board");
		PostDTO pdto = (PostDTO) map.get("w_board");
		pdto.setP_scope(1);
		pdto.setP_like(2);
		
		mdao.write_board(pdto);
	}

}
