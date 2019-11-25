package com.care.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.KakaoDAO;
import com.care.modelDTO.CategoryDTO;
import com.care.modelDTO.KakaoDTO;
import com.care.modelDTO.PostDTO;

@Service
public class KakaoLoginService implements IService{

	@Autowired
	private KakaoDAO kdao;
	private Map<String, Object> map = null;
	@Override
	public void execute(Model model) {
		CategoryDTO catedto = new CategoryDTO();
		map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String id = request.getParameter("id");
		KakaoDTO dto = new KakaoDTO();
		dto.setK_id(id);
		KakaoDTO dto1 = kdao.kakaologinchk(dto);
		if(dto1==null) {
			kdao.resgister(dto); // kmember에 등록함
			dto1 = kdao.kakaologinchk(dto);// kmember에 등록된 정보를 가져옴
			model.addAttribute("result",dto1.getK_id()); //result값으로 아이디 넘겨줌
			model.addAttribute("kakaoInform",dto1);
		}else {
			model.addAttribute("result","ok");
		}
	}
	
}
