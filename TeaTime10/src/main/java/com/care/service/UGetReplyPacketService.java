package com.care.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.ModelDAO;
import com.care.modelDTO.ReplyDTO;

@Service
public class UGetReplyPacketService implements IService {

	@Autowired
	ModelDAO dao;
	
	@Override
	public void execute(Model model) {
		ArrayList<ReplyDTO> replies = new ArrayList<ReplyDTO>();
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		Integer lowerBound = (Integer)map.get("lowerBound");
		Integer upperBound = (Integer)map.get("upperBound");
		int idgroup = Integer.parseInt(request.getParameter("r_idgroup"));
		
		replies = dao.getPostReplyPackets(idgroup, lowerBound, upperBound);
		model.addAttribute("replyPackets", replies);
		System.out.println("service lowerbound:" + lowerBound);
		System.out.println("service upperbound:" + upperBound);
		for (int i = 0; i < replies.size(); i ++) {
			System.out.println("service replies content: " + replies.get(i).getR_content());
		}
	}

}
