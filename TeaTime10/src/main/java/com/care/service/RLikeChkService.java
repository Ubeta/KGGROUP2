package com.care.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.ModelDAO;
import com.care.modelDTO.PostDTO;
import com.care.modelDTO.PostLikeDTO;
import com.care.modelDTO.ReplyDTO;
import com.care.modelDTO.ReplyLikeDTO;

@Service
public class RLikeChkService implements IService{
	@Autowired
	private ModelDAO mdao;
	
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		ReplyDTO rdto = (ReplyDTO)map.get("r_like_chk");
		
		ReplyLikeDTO rldto =	mdao.r_like_chk(rdto);
		System.out.println(rldto);
		if(rldto!=null) {
			int chk = rldto.getR_likechk();
			if(chk == 0) {
				model.addAttribute("btnchk",0);
			}else if(chk==1) {
				System.out.println("=========");
				System.out.println("=========");
				model.addAttribute("btnchk",1);
				model.addAttribute("r_num",rldto.getR_num());
			}
		}else if(rldto==null) {
			model.addAttribute("btnchk",2);
		}
	}
}
