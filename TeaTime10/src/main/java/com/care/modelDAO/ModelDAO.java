package com.care.modelDAO;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.care.modelDTO.CategoryDTO;
import com.care.modelDTO.MemberDTO;
import com.care.modelDTO.MyFriendDTO;
import com.care.modelDTO.PostDTO;

@Repository
public class ModelDAO {
	private static final String namespace="com.care.ttbatis.ttMapper";

	@Autowired
	private SqlSession sqlSession;

	public String register(MemberDTO dto, String id, String tel, String mail) {
		String du = null;


		String resultId = sqlSession.selectOne(namespace+".idchk",id);
		String resultTel = sqlSession.selectOne(namespace+".telchk",tel);
		String resultMail = sqlSession.selectOne(namespace+".mailchk",mail);
		System.out.println("id : " + resultId);
		System.out.println("tel : " + resultTel);
		System.out.println("mail : " +resultMail);
		if(resultId==null) {
			resultId = "ok1";
		}
		if(resultTel==null) {
			resultTel = "ok2";
		}
		if(resultMail==null) {
			resultMail = "ok3";
		}

		try {
			if(resultId.equals(id)) {
				du = "iddu";
			}else if(resultTel.equals(tel)) {
				du = "teldu";
			}else if(resultMail.equals(mail)) {
				du = "maildu";	
			}else if(resultId.equals("ok1") && resultTel.equals("ok2") && resultMail.equals("ok3")){
				System.out.println("중복 없음");
				sqlSession.insert(namespace+".regmember",dto);
				du = "regiOk";
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		//System.out.println("인서트 실행!!");
		//sqlSession.insert(namespace+".regmember",dto);

		return du;

	}


	public MemberDTO loginchk(String m_id) {
		return sqlSession.selectOne(namespace+".loginchk",m_id);
	}

	public String category(CategoryDTO cdto) {
		String cat_du = null;
		try {
			sqlSession.insert(namespace+".category_insert", cdto);		
			cat_du = "catOk";
		}catch(Exception e) {
			cat_du = "catdu";
		}
		return cat_du;
	}

	//John DAO ==================================
	public int checkFriendStatus(MyFriendDTO mfdto) {
		int friendStatus = 0;
		try {
			friendStatus = sqlSession.selectOne(namespace + ".checkFriendStatus1", mfdto);
		} catch (Exception e){
			System.out.println("checkFriendStatus catch 1");
		}
		try {
			friendStatus = sqlSession.selectOne(namespace + ".checkFriendStatus2", mfdto);
		} catch (Exception e){
			System.out.println("checkFriendStatus catch 2");
		}
		return friendStatus;
	}
	
	public int sendFriendRequest(MyFriendDTO mfdto) {
		int result = 0;
		try {
			result = sqlSession.insert(namespace + ".sendFriendRequest1", mfdto);
		} catch (Exception e) {
			System.out.println("sendFriendRequest catch 1");
		}
		try {
			result = sqlSession.insert(namespace + ".sendFriendRequest2", mfdto);
		} catch (Exception e) {
			System.out.println("sendFriendRequest catch 1");
		}
		return result;
	}
	
	public int cancelFriendRequest(MyFriendDTO mfdto) {
		int result = 0;
		try {
			result = sqlSession.update(namespace + ".cancelFriendRequest1", mfdto);
		} catch (Exception e) {
			System.out.println("cancelFriendRequest catch 1");
		}
		try {
			result = sqlSession.update(namespace + ".cancelFriendRequest2", mfdto);
		} catch (Exception e) {
			System.out.println("cancelFriendRequest catch 1");
		}
		return result;
	}
	public int acceptFriendRequest(MyFriendDTO mfdto) {
		int result = 0;
		try {
			result = sqlSession.update(namespace + ".acceptFriendRequest1", mfdto);
		} catch (Exception e) {
			System.out.println("acceptFriendRequest catch 1");
		}
		try {
			result = sqlSession.update(namespace + ".acceptFriendRequest2", mfdto);
		} catch (Exception e) {
			System.out.println("acceptFriendRequest catch 2");
		}
		return result;
	}
	public int removeFriend(MyFriendDTO mfdto) {
		int result = 0;
		try {
			result = sqlSession.update(namespace + ".removeFriend1", mfdto);
		} catch (Exception e) {
			System.out.println("removeFriend 1 catch");
		}
		try {
			result = sqlSession.update(namespace + ".removeFriend2", mfdto);
		} catch (Exception e) {
			System.out.println("removeFriend 2 catch");
		}
		return result;
		
	}
	
	public List<MemberDTO> getFriendRequests(MyFriendDTO mfdto) {
		List<MemberDTO> members = new ArrayList<MemberDTO>();
		try {
			members = sqlSession.selectList(namespace + ".getFriendRequests", mfdto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return members;
	}

	public MemberDTO userLookUp(String m_id) {
		return sqlSession.selectOne(namespace + ".userLookUp", m_id);
	}
	public List<PostDTO> getUserPosts(String m_id) {
		return sqlSession.selectList(namespace + ".getUserPosts", m_id);
	}
	//===========================================
	
	//==============yang================
	public MemberDTO my_info(String my_id) {
		return sqlSession.selectOne(namespace+".my_info", my_id);
	}
	public CategoryDTO my_cat(String my_id) {
		return sqlSession.selectOne(namespace+".my_cat", my_id);
	}
	public MemberDTO f_info(String my_id) {
		return sqlSession.selectOne(namespace+".my_info", my_id);
	}
	//===================================

	public List<MemberDTO> friendLists(String m_id) {
		return sqlSession.selectList(namespace+".friendLists",m_id);
	}
	
	public CategoryDTO mcategorychk(String m_id) {
		return sqlSession.selectOne(namespace+".mcategorychk",m_id);
	}
	
}
