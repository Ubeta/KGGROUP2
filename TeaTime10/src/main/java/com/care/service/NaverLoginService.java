package com.care.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.json.simple.JSONObject;

import com.care.modelDAO.NaverDAO;
import com.care.modelDTO.CategoryDTO;
import com.care.modelDTO.NaverDTO;


@Service
public class NaverLoginService implements IService{

	@Autowired
	private NaverDAO ndao;
	private Map<String, Object> map = null;
	
	@Override
	public void execute(Model model) {

		CategoryDTO catedto = new CategoryDTO();
		map = model.asMap();
		JSONObject response_obj = (JSONObject)map.get("response_obj");
		String id = (String)response_obj.get("id");
		String name = (String)response_obj.get("name");
		String email = (String)response_obj.get("email");
		String gen = (String)response_obj.get("gender");
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
			System.out.println(dto1.getN_id()+" 처음 가입");
//			catedto.setM_id(dto1.getN_id()); // 카테고리에 아이디만 셋팅
			model.addAttribute("result",dto1.getN_id());
		}else {
			//정보가 있음
			System.out.println(dto1.getN_id() + " 가입 되어있음");
			catedto = ndao.navercategorychk(dto); // 카테고리값들 가져옴
			model.addAttribute("result","ok");
//			catedto.get
//			catedto.get
//			catedto.get
//			catedto.get
//			catedto.get
//			catedto.get
//			catedto.get
//			catedto.get
//			catedto.get
//			catedto.get
//			catedto.get
//			catedto.get
//			catedto.get
			//	model.addAttribute("result", apiResult); api에서 넘어온 정보
			/*
			 * 
			 * 여기서 디비에서 카테고리 내가 선택한 카테고리 내용을 가져오고
			 * 다시 한번 디비에서 내가 선택한 카테고리의 게시글들을 가져온 후
			 * 리스트에 담아서 아래처럼 담아서 넘겨줌 ???는 글의 정보를 넣어야 함 
			 * posts는 
			   ArrayList<PostDTO> posts = new ArrayList<PostDTO>();
			      각 posts마다 하나의 글을 보내고
			   model.addAttribute("posts",posts);
			      로 넘겨주고 메인이든 어디든 출력한다.
			 * */
		}
	}

}
