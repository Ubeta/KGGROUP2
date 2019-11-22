package com.care.modelDAO;

import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.care.modelDTO.CategoryDTO;
import com.care.modelDTO.KakaoDTO;
import com.care.modelDTO.NaverDTO;
import com.care.modelDTO.PostDTO;

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
	
	public ArrayList<PostDTO> post(ArrayList<String> list){
		ArrayList<PostDTO> plist = new ArrayList<PostDTO>();
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@192.168.0.30:1521:xe";
		String user = "jsp";
		String pwd = "1234";
		Connection con;
		PreparedStatement pstmt;
		ResultSet rs;
		String sql = "select * from post where ((";
		for (int i = 0; i < list.size()-1; i++) {
			sql += "p_cat=? or ";
			System.out.println(sql);
		}
		sql += "p_cat=?) and (p_scope=2)) or (p_scope=1 and(";
//		for (int i = 0; i < list2.size()-1; i++) {
//			sql += "m_id=? or ";
//		}
		sql += "m_id=? and (";
		for (int i = 0; i < list.size()-1; i++) {
			sql += "p_cat=? or ";
		}
		String a =	"p_cat=?))) order by p_date desc";
		System.out.println(sql);
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,user,pwd);
			pstmt = con.prepareStatement(sql);
			for (int i = 0; i < list.size(); i++) {
				pstmt.setString(i+1, list.get(i));
			}
//			for (int i = 0; i < list2.size(); i++) {
//				pstmt.setString(list.size(), list2.get(i));
//			}
//			for (int i = 0; i < array.length; i++) {
//				pstmt.setString(list.size()+list2.size(), list.get(i));
//			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				PostDTO dto = new PostDTO();
				dto.setM_id(rs.getString("m_id"));
				dto.setP_num(rs.getInt("p_num"));
				dto.setP_title(rs.getString("p_title"));
				dto.setP_content(rs.getString("p_content"));
				dto.setP_img(rs.getString("p_img"));
				dto.setP_cat(rs.getString("p_cat"));
				dto.setP_hash(rs.getString("p_hash"));
				dto.setP_idgroup(rs.getInt("p_idgroup"));
				dto.setP_scope(rs.getInt("p_scope"));
				dto.setP_date(rs.getDate("p_date"));
				dto.setP_like(rs.getInt("p_like"));
				plist.add(dto);
			}
		} catch (Exception e) {
			System.out.println("에러발생");
			e.printStackTrace();
		}
		
		return plist;
	}
	
	
}
