package com.care.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.KakaoDAO;
import com.care.modelDTO.CategoryDTO;

@Service
public class CategoryUpdate implements IService{

	@Autowired
	private KakaoDAO kdao;
	
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		CategoryDTO cdto = (CategoryDTO)map.get("cateupdate");
		kdao.updatecategory(cdto);//업데이트
	}

}
