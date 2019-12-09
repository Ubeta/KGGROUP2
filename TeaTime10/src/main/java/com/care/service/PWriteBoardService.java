package com.care.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.modelDAO.ModelDAO;
import com.care.modelDTO.PostDTO;

@Service
public class PWriteBoardService implements IService{
	@Autowired
	private ModelDAO mdao;
	
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		PostDTO pdto = (PostDTO)map.get("write_board");
		
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
		System.out.println("File : " + request.getParameter("postImage"));
		
		MultipartFile multipartFile = request.getFile("postImage");
		String originalFileName = multipartFile.getOriginalFilename();
		System.out.println("MRegisterService Picture originalName: " + originalFileName);
		String storedFileName = "null";
		if (originalFileName != "") {
			storedFileName = System.currentTimeMillis() + originalFileName;
		}
		String filePath = "C:\\TeaTime\\";
		
		pdto.setP_img(storedFileName);
		
		if (!storedFileName.equals("null")) {
			try {
				Files.copy(multipartFile.getInputStream(), Paths.get(filePath, storedFileName));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		int result = 0;
		result = mdao.write_board(pdto);
		if (result == 1) {
			model.addAttribute("writeSuccess", true);
		} else {
			model.addAttribute("writeSuccess", false);
		}
	}

}
