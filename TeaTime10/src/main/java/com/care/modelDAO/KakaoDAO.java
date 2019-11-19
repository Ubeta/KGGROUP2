package com.care.modelDAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.care.modelDTO.CategoryDTO;
import com.care.modelDTO.KakaoDTO;
import com.care.modelDTO.NaverDTO;

@Repository
public class KakaoDAO {

	private static final String namespace="com.care.ttbatis.ttMapper";

	@Autowired
	private SqlSession sqlSession;
	
	public void resgister(KakaoDTO dto) {
		sqlSession.insert(namespace+".regkakao",dto);
	}
	
	public KakaoDTO kakaologinchk(KakaoDTO dto) {
		return sqlSession.selectOne(namespace+".kakaologinchk",dto);
	}
	public CategoryDTO kakaocategorychk(KakaoDTO dto) {
		return sqlSession.selectOne(namespace+".kakaocategorychk",dto);
	}
}
