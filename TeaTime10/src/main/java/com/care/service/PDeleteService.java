package com.care.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.ModelDAO;
import com.care.modelDTO.PostDTO;

@Service
public class PDeleteService implements IService{
	@Autowired
	private ModelDAO mdao;

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		PostDTO pdto = (PostDTO)map.get("pdto");
		System.out.println("=================");
		System.out.println(pdto.getP_num());
		System.out.println("=================");
		mdao.del_post(pdto);
	}

}
