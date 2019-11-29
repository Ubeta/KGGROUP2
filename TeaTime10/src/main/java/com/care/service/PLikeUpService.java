package com.care.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.ModelDAO;
import com.care.modelDTO.PostLikeDTO;
import com.care.modelDTO.PostDTO;

@Service
public class PLikeUpService implements IService{
	@Autowired
	private ModelDAO mdao;
	
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		PostDTO pdto = (PostDTO) map.get("like_up");
		
		PostLikeDTO pldto =	mdao.p_like_chk(pdto);
		
		
		if(pldto==null) {
			mdao.p_like_in(pdto);
			mdao.p_like_up(pdto);
			model.addAttribute("chk",2);
		}else if(pldto!=null) {
			int up_chk = pldto.getP_likechk();
			if(up_chk==0) {
					mdao.p_like_chk_up(pdto);
					mdao.p_like_up(pdto);
					model.addAttribute("chk",0);
				}else if(up_chk==1) {
					mdao.p_like_chk_down(pdto);
					mdao.p_like_down(pdto);
					model.addAttribute("chk",1);
				}
			}
		}
	

}
