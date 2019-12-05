package com.care.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.ModelDAO;
@Service
public class IdSearch implements IService{

	@Autowired
	private ModelDAO mdao;
	
	@Override
	public void execute(Model model) {
		String mid = mdao.idfind(model);
		if(mid==null) {
			model.addAttribute("idfind","notfindid");
		}else if(mid.length()==1) {
			model.addAttribute("idfind",mid);
		}else {
			int leng = mid.length();
			char[] arr = new char[leng];             
			for (int i = 0; i < leng; i++) { 
				arr[i] = mid.charAt(i);
				if(leng-i==2) { 
					arr[i+1] = '*';
					break;
				}
			}
			String a = "";
			for (int i = 0; i < arr.length; i++) {
				a += arr[i];
			}
			model.addAttribute("idfind",a);
		}
	}

}
