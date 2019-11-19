package com.care.modelDAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.care.modelDTO.CategoryDTO;
import com.care.modelDTO.NaverDTO;


@Repository
public class NaverDAO {
	private static final String namespace="com.care.ttbatis.ttMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	public void resgister(NaverDTO dto) {
		sqlSession.insert(namespace+".regnaver",dto);
	}
	
	public NaverDTO naverloginchk(NaverDTO dto) {
		return sqlSession.selectOne(namespace+".naverloginchk",dto);
	}
	public CategoryDTO navercategorychk(NaverDTO dto) {
		return sqlSession.selectOne(namespace+".navercategorychk",dto);
	}

}
