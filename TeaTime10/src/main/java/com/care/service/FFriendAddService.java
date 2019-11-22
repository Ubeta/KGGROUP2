package com.care.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.ModelDAO;
import com.care.modelDTO.MyFriendDTO;

@Service
public class FFriendAddService implements IService{
	
	@Autowired
	private ModelDAO mdao;
	
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		map.get("f_id");
		
		String sessionid = "1";
		String freindid = (String) map.get("f_id");
		System.out.println(freindid);
		
		MyFriendDTO mfdto = new MyFriendDTO();
		mfdto.setM_id(sessionid);
		mfdto.setF_id(freindid);
		mdao.friend_add(mfdto);
		
	}
	
}
