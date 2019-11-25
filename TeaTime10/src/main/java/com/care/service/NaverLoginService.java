package com.care.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.json.simple.JSONObject;

import com.care.modelDAO.KakaoDAO;
import com.care.modelDAO.NaverDAO;
import com.care.modelDTO.CategoryDTO;
import com.care.modelDTO.NaverDTO;


@Service
public class NaverLoginService implements IService{

	@Autowired
	private NaverDAO ndao;
	@Autowired
	private KakaoDAO kdao;
	private Map<String, Object> map = null;
	
	@Override
	public void execute(Model model) {

		CategoryDTO catedto = new CategoryDTO();
		map = model.asMap();
		JSONObject response_obj = (JSONObject)map.get("response_obj");
		System.out.println(response_obj);
		String id = (String)response_obj.get("id");
		String name = (String)response_obj.get("name");
		String email = (String)response_obj.get("email");
		String gen = (String)response_obj.get("gender");
		String idnum = (String)response_obj.get("");
		int gender = 2;
		if(gen.equals("M")) {
			gender = 1;
		}else {
			gender = 0;
		}
		NaverDTO dto = new NaverDTO();
		dto.setN_id(id);
		dto.setN_name(name);
		dto.setN_email(email);
		dto.setN_gender(gender);
		NaverDTO dto1 = ndao.naverloginchk(dto);
		if(dto1==null) {
			ndao.resgister(dto);
			dto1 = ndao.naverloginchk(dto);
//			catedto.setM_id(dto1.getN_id()); // 카테고리에 아이디만 셋팅
			model.addAttribute("result",dto1.getN_id());
			model.addAttribute("naverInform",dto1);
		}else {
			//정보가 있음
			model.addAttribute("result","ok");
		}
	}

}
