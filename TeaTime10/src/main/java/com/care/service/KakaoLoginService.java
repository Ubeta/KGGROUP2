package com.care.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.KakaoDAO;
import com.care.modelDTO.CategoryDTO;
import com.care.modelDTO.KakaoDTO;

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
			System.out.println("첫 로그인 회원가입");
			kdao.resgister(dto); // kmember에 등록함
			dto1 = kdao.kakaologinchk(dto);// kmember에 등록된 정보를 가져옴
//			catedto.setM_id(dto1.getK_id()); // 카테고리에 아이디만셋팅
			                                 // 여기있는세트가 안넘어갈 수도 있음
//			model.addAttribute("result",1);
			model.addAttribute("result",dto1.getK_id()); //result값으로 아이디 넘겨줌
		}else {
			System.out.println("이미 회원가입 됨.");
			catedto = kdao.kakaocategorychk(dto); // 카테고리값들 가져옴
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
