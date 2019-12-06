package com.care.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.ModelDAO;

@Service
public class PwChange implements IService{

	@Autowired 
	private ModelDAO mdao;
	@Override
	public void execute(Model model) {
		int result = mdao.pwchange(model);
		if(result==1) {
			model.addAttribute("pwchangeresult","ok");
		}else {
		}
		
	}

}
