package com.care.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.care.modelDAO.ModelDAO;

public class FListService implements IService{

	@Autowired
	ModelDAO mdao;
	
	@Override
	public void execute(Model model) {
		model.addAttribute("flist", mdao.friendLists());
	}

}
