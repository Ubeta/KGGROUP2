package com.care.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.KakaoDAO;
import com.care.modelDAO.ModelDAO;
import com.care.modelDTO.CategoryDTO;
import com.care.modelDTO.MemberDTO;
import com.care.modelDTO.MyFriendDTO;
import com.care.modelDTO.PostDTO;
import com.fasterxml.jackson.databind.deser.std.FromStringDeserializer;

@Service
public class MLoginPostService implements IService{

	@Autowired
	private ModelDAO mdao;
	@Autowired
	private KakaoDAO kdao;
	
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpSession session = (HttpSession)map.get("session");
		
		ArrayList<CategoryDTO> plist = new ArrayList<CategoryDTO>();
		String m_id = null;
		if(session.getAttribute("sid")!=null)
			m_id = (String)session.getAttribute("sid");
		else if(session.getAttribute("nid")!=null)
			m_id = (String)session.getAttribute("nid");
		else if(session.getAttribute("kid")!=null)
			m_id = (String)session.getAttribute("kid");
		
		
		ArrayList<String> flist = new ArrayList<String>();
		java.util.List<MemberDTO> frienddto = mdao.friendLists(m_id);
		for (int i = 0; i < frienddto.size(); i++) {
			flist.add(frienddto.get(i).getM_id());
			System.out.println(frienddto.get(0).getM_id());
		}
		
		CategoryDTO catedto = mdao.mcategorychk(m_id);
		ArrayList<String> list = new ArrayList<String>();

		if (catedto.getC_sports().equals("Y")) {
			list.add("sports");
		}
		if (catedto.getC_news().equals("Y")) {
			list.add("news");
		}
		if (catedto.getC_food().equals("Y")) {
			list.add("food");
		}
		if (catedto.getC_language().equals("Y")) {
			list.add("language");
		}
		if (catedto.getC_people().equals("Y")) {
			list.add("people");
		}
		if (catedto.getC_animal().equals("Y")) {
			list.add("animal");
		}
		if (catedto.getC_fashion().equals("Y")) {
			list.add("fashion");
		}
		if (catedto.getC_love().equals("Y")) {
			list.add("love");
		}
		if (catedto.getC_movie().equals("Y")) {
			list.add("movie");
		}
		if (catedto.getC_religion().equals("Y")) {
			list.add("religion");
		}
		if (catedto.getC_knowledge().equals("Y")) {
			list.add("knowledge");
		}
		if (catedto.getC_travel().equals("Y")) {
			list.add("travel");
		}
		if (catedto.getC_cartoon().equals("Y")) {
			list.add("cartoon");
		}
		if (catedto.getC_game().equals("Y")) {
			list.add("game");
		}
		if (catedto.getC_it().equals("Y")) {
			list.add("it");
		}
		if (catedto.getC_weather().equals("Y")) {
			list.add("weather");
		}
		if (catedto.getC_music().equals("Y")) {
			list.add("music");
		}
		if (catedto.getC_car().equals("Y")) {
			list.add("car");
		}
		if (catedto.getC_economy().equals("Y")) {
			list.add("economy");
		}
		if (catedto.getC_etc().equals("Y")) {
			list.add("etc");
		}
		if (catedto.getC_job().equals("Y")) {
			list.add("job");
		}
		if (catedto.getC_living().equals("Y")) {
			list.add("living");
		}
		if (catedto.getC_book().equals("Y")) {
			list.add("book");
		}
		if (catedto.getC_festival().equals("Y")) {
			list.add("festival");
		}
		if (catedto.getC_health().equals("Y")) {
			list.add("health");
		}
		model.addAttribute("postlist",kdao.post(list,flist));
		model.addAttribute("endcount",kdao.post(list,flist).size());
		
	}
}
