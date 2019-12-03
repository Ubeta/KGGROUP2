package com.care.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.ModelDAO;
import com.care.modelDTO.PostDTO;
import com.care.modelDTO.PostLikeDTO;

@Service
public class PLikeChkService implements IService{
	@Autowired
	private ModelDAO mdao;
	
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		PostDTO pdto = (PostDTO)map.get("like_chk");
		
		PostLikeDTO pldto =	mdao.p_like_chk(pdto);
		
		if(pldto!=null) {
			int chk = pldto.getP_likechk();
			if(chk == 0) {
				model.addAttribute("btnchk",0);
			}else if(chk==1) {
				model.addAttribute("btnchk",1);
				model.addAttribute("idgroup",pldto.getP_idgroup());
			}
		}else if(pldto==null) {
			model.addAttribute("btnchk",2);
		}
	}
}
