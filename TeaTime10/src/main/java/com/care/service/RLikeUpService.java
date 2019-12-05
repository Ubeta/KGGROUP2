package com.care.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.ModelDAO;
import com.care.modelDTO.PostLikeDTO;
import com.care.modelDTO.ReplyDTO;
import com.care.modelDTO.ReplyLikeDTO;
import com.care.modelDTO.PostDTO;

@Service
public class RLikeUpService implements IService{
	@Autowired
	private ModelDAO mdao;
	
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		ReplyDTO rdto = (ReplyDTO)map.get("r_like_up");
		

		ReplyLikeDTO rldto = mdao.r_like_chk(rdto);
		
		
		if(rldto==null) {
			mdao.r_like_in(rdto);
			mdao.r_like_up(rdto);
			model.addAttribute("chk",2);
		}else if(rldto!=null) {
			int ur_chk = rldto.getR_likechk();
			if(ur_chk==0) {
					mdao.r_like_chk_up(rdto);
					mdao.r_like_up(rdto);
					model.addAttribute("chk",0);
				}else if(ur_chk==1) {
					mdao.r_like_chk_down(rdto);
					mdao.r_like_down(rdto);
					model.addAttribute("chk",1);
				}
			}
		}
	

}
