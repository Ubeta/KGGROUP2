package com.care.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.modelDAO.ModelDAO;
import com.care.modelDTO.PostDTO;

@Service
public class TotalSearch implements IService{

	@Autowired
	private ModelDAO mdao;
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String searchparam = request.getParameter("m_search");
		List<PostDTO> pdto1 = new ArrayList<PostDTO>();
		List<PostDTO> searchlist = new ArrayList<PostDTO>();
		List<PostDTO> ajaxlist = new ArrayList<PostDTO>();
		model.addAttribute("m_search",searchparam);
		if (searchparam.contains("#")) {
//			model.addAttribute("hashsearch", searchparam);
			searchparam = searchparam.replaceAll("#", "%");
			searchparam = searchparam+"%";
			pdto1 = mdao.hashsearch(searchparam);
			if(pdto1.size()>=3) {
				for (int i = 0; i < 3; i++) {
					searchlist.add(pdto1.get(i));
				}
				for (int i = 0; i < pdto1.size(); i++) {
					ajaxlist.add(pdto1.get(i));
				}
				model.addAttribute("ajaxlist",ajaxlist);
				model.addAttribute("searchlist",searchlist);
				model.addAttribute("hashsize",searchlist.size());
				// 3개이상일 경우
			}else {
				model.addAttribute("searchlist",pdto1);
				// 3개보다 적을 경우
			}
		}else { // 카테고리로 검색
//			model.addAttribute("hashsearch", searchparam);
			switch (searchparam) {
			case "운동" : case "sport" : case "스포츠" : case "Sports" : 
				searchparam = "sports";
				break;
			case "뉴스" : case "nesw" : case "new" : case "News" :
				searchparam = "news";
				break;	
			case "음식" : case "먹거리" : case "fod" : case "Food" :
				searchparam = "food";
				break;	
			case "언어" : case "랭귀지" : case "Language" :
				searchparam = "language";
				break;	
			case "사람" : case "인문" : case "People" :
				searchparam = "people";
				break;	
			case "동물" : case "animl" : case "anima" : case "Animal":
				searchparam = "animal";
				break;	
			case "패션" : case "의류" : case "Fashion" :
				searchparam = "fashion";
				break;	
			case "사랑" : case "러브" : case "Love" :
				searchparam = "love";
				break;	
			case "영화" : case "무비" : case "Movie" :
				searchparam = "movie";
				break;	
			case "종교" : case "교회" : case "성당" : case "절" :
				searchparam = "religion";
				break;	
			case "지식" : case "정보" : case "knowlege" : case "Knowledge":
				searchparam = "knowledge";
				break;	
			case "여행" : case "travle" : case "Travel" :
				searchparam = "travel";
				break;	
			case "만화" : case "애니" : case "webtoon" : case "Cartoon" :
				searchparam = "cartoon";
				break;	
			case "게임" : case "Game" : case "모바일게임" : 
				searchparam = "game";
				break;	
			case "아이티" : case "IT" : 
				searchparam = "it";
				break;	
			case "날씨" : case "기온" : case "Weather" :
				searchparam = "weather";
				break;	
			case "음악" : case "싱" : case "송" : case "song" : case "Music" :
				searchparam = "music";
				break;	
			case "자동차" : case "차" : case "Car" :
				searchparam = "car";
				break;	
			case "경제" : case "Economy" : case "econmy" :
				searchparam = "economy";
				break;	
			case "기타" : case "ETC" : case "Etc" :
				searchparam = "etc";
				break;	
			case "일거리" : case "일" : case "직업" : case "Job" : case "JOB" : case "잡" :
				searchparam = "job";
				break;	
			case "살림" : case "리빙" : case "Living" :
				searchparam = "living";
				break;	
			case "책" : case "도서" : case "북" : case "Book" :
				searchparam = "book";
				break;	
			case "행사" : case "축제" : case "페스티벌" : case "페스티발" : case "Festivar" :
				searchparam = "festivar";
				break;	
			case "건강" : case "헬스" :  case "Health":
				searchparam = "health";
				break;	
			default:
				break;
			}
			pdto1 = mdao.catesearch(searchparam);
			if(pdto1.size()>=3) {
				for (int i = 0; i < 3; i++) {
					searchlist.add(pdto1.get(i));
				}
				for (int i = 0; i < pdto1.size(); i++) {
					ajaxlist.add(pdto1.get(i));
				}
				model.addAttribute("searchlist",searchlist);
				model.addAttribute("hashsize",searchlist.size());
				model.addAttribute("ajaxlist",ajaxlist);
				// 3개이상일 경우
			}else {
				model.addAttribute("searchlist",pdto1);
				// 3개보다 적을 경우
			}
		}
		
		
	}

}
