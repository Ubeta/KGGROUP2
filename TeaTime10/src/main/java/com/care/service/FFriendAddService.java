package com.care.service;

import java.util.ArrayList;
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
		
		String sessionid = "1";
		String freindid = (String) map.get("f_id");
		
		mdao.f_list(sessionid);
		MyFriendDTO dto = new MyFriendDTO();
		ArrayList<MyFriendDTO> list = (ArrayList<MyFriendDTO>) mdao.f_list(sessionid);
		ArrayList newlist = new ArrayList();
		for (int i = 0; i < list.size(); i++) {
			dto = list.get(i);
			dto.getF_id();
			newlist.add(dto.getF_id());
		}
		if(newlist.contains(freindid)) {
			model.addAttribute("chk",0);
		}else if(sessionid.equals(freindid)){
			model.addAttribute("chk",1);
		}else {
			MyFriendDTO mfdto = new MyFriendDTO();
			mfdto.setM_id(sessionid);
			mfdto.setF_id(freindid);
			mdao.friend_add(mfdto);
			model.addAttribute("chk",2);
		}
	}
	
}
