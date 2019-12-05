package com.care.modelDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.care.modelDTO.CategoryDTO;
import com.care.modelDTO.MemberDTO;
import com.care.modelDTO.MyFriendDTO;
import com.care.modelDTO.PostDTO;
import com.care.modelDTO.PostLikeDTO;
import com.care.modelDTO.ReplyDTO;
import com.care.modelDTO.ReplyLikeDTO;

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

	
	//=============================John DAO ==================================
	public int checkFriendStatus(MyFriendDTO mfdto) {
		int friendStatus = 0;
		try {
			friendStatus = sqlSession.selectOne(namespace + ".checkFriendStatus1", mfdto);
		} catch (Exception e){
			System.out.println("checkFriendStatus catch 1");
			try {
				friendStatus = sqlSession.selectOne(namespace + ".checkFriendStatus2", mfdto);
			} catch (Exception e2){
				System.out.println("checkFriendStatus catch 2");
			}
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
//		try {
//			result = sqlSession.insert(namespace + ".sendFriendRequest2", mfdto);
//		} catch (Exception e) {
//			System.out.println("sendFriendRequest catch 1");
//		}
		return result;
	}
	
	public int cancelFriendRequest(MyFriendDTO mfdto) {
		int result = 0;
		try {
			result = sqlSession.delete(namespace + ".cancelFriendRequest1", mfdto);
		} catch (Exception e) {
			System.out.println("cancelFriendRequest catch 1");
			try {
				result = sqlSession.update(namespace + ".cancelFriendRequest2", mfdto);
			} catch (Exception e2) {
				System.out.println("cancelFriendRequest catch 2");
			}
		}
		return result;
	}
	public int acceptFriendRequest(MyFriendDTO mfdto) {
		int result = 0;
//		try {
//			result = sqlSession.update(namespace + ".acceptFriendRequest1", mfdto);
//		} catch (Exception e) {
//			System.out.println("acceptFriendRequest catch 1");
//		}
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
			try {
				result = sqlSession.update(namespace + ".removeFriend2", mfdto);
			} catch (Exception e2) {
				System.out.println("removeFriend 2 catch");
			}
		}
		return result;
		
	}
	
	public List<MemberDTO> getFriendRequests(MyFriendDTO mfdto) {
		List<MemberDTO> members = new ArrayList<MemberDTO>();
		try {
			members = sqlSession.selectList(namespace + ".getFriendRequests", mfdto);
		} catch (Exception e) {
			System.out.println("getFriendRequests catch");
		}
		return members;
	}

	public MemberDTO userLookUp(String m_id) {
		return sqlSession.selectOne(namespace + ".userLookUp", m_id);
	}
	public List<PostDTO> getUserPosts(String m_id) {
		return sqlSession.selectList(namespace + ".getUserPosts", m_id);
	}
	
	public List<PostDTO> getUserPostsFriendScope(String m_id) {
		return sqlSession.selectList(namespace + ".getUserPostsFriendScope", m_id);
	}
	public List<PostDTO> getUserPostsPublicScope(String m_id) {
		return sqlSession.selectList(namespace + ".getUserPostsPublicScope", m_id);
	}
	
	public int inputPostReply(ReplyDTO redto) {
		int result = 0;
		result = sqlSession.insert(namespace + ".inputPostReply", redto);
		return result;
	}
	public List<ReplyDTO> getPostReplies(int r_idgroup) {
		return sqlSession.selectList(namespace + ".getPostReplies", r_idgroup);
	}
	
	public ArrayList<ReplyDTO> getPostReplyPackets(int r_idgroup, int lowerBound, int upperBound) {
		ArrayList<ReplyDTO> replies = new ArrayList<ReplyDTO>();
		System.out.println("getPostReplyPackets DAO entered");
		String driver = "oracle.jdbc.driver.OracleDriver";

		String url = "jdbc:oracle:thin:@192.168.0.6:1521:xe";

		String uid = "jsp";
		String upw = "1234";
		String sql = "select B.* from (select rownum rn, A.* from "
				+ "(select * from reply where r_idgroup=? order by r_date desc)A)B "
				+ "where rn > ? AND rn <= ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, uid, upw);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r_idgroup);
			pstmt.setInt(2, lowerBound);
			pstmt.setInt(3, upperBound);
			rs = pstmt.executeQuery();
			System.out.println("Before rs.next()");
			while (rs.next()) {
				System.out.println("dao check");
				ReplyDTO reply = new ReplyDTO();
				reply.setM_id(rs.getString("m_id"));
				reply.setR_num(rs.getInt("r_num"));
				reply.setR_idgroup(rs.getInt("r_idgroup"));
				reply.setR_content(rs.getString("r_content"));
				reply.setR_date(rs.getDate("r_date"));
				reply.setR_like(rs.getInt("r_like"));
				replies.add(reply);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				} if (pstmt != null) {
					pstmt.close();
				} if (rs != null) {
					rs.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return replies;
		
	}
	public ReplyDTO getPostReplyOne(int r_idgroup) {
		return sqlSession.selectOne(namespace + ".getReplyOne", r_idgroup);
	}

	
	//====================== John DAO 긑 ===========================================

	public String idfind(Model model) {
		Map<String, Object> map  = model.asMap();
		MemberDTO mdto = (MemberDTO)map.get("mdto");
		System.out.println(mdto.getM_name() + ": 다오임");
		System.out.println(mdto.getM_tel());
		return sqlSession.selectOne(namespace + ".idfind",mdto);
	}
	
	public String pwfind(Model model) {
		Map<String, Object> map  = model.asMap();
		MemberDTO mdto = (MemberDTO)map.get("mdto");
		return sqlSession.selectOne(namespace + ".pwfind",mdto);
	}
	
	public int pwchange(Model model) {
		Map<String, Object> map  = model.asMap();
		MemberDTO mdto = (MemberDTO)map.get("mdto");
		return sqlSession.update(namespace+".pwchange",mdto);
	}
	
	public List<PostDTO> hashsearch(String searchparam){
		List<PostDTO> hashlist = new ArrayList<PostDTO>();
		hashlist = sqlSession.selectList(namespace+".hashsearch",searchparam);
		return hashlist;
	}
	
	public List<PostDTO> catesearch(String searchparam){
		List<PostDTO> catelist = new ArrayList<PostDTO>();
		catelist = sqlSession.selectList(namespace+".catesearch",searchparam);
		return catelist;
	}
	
	public String idchk(String m_id) {
		String resultId = sqlSession.selectOne(namespace+".idchk",m_id);
		return resultId;
	}
	
	//이상호 끝 이상호 끝  이상호 끝  이상호 끝  이상호 끝  이상호 끝  이상호 끝  이상호 끝  이상호 끝  이상호 끝  이상호 끝  이상호 끝  이상호 끝  이상호 끝 

	
	
	//==============yang================
			public MemberDTO my_info(String sessionid) {
				return sqlSession.selectOne(namespace+".my_info", sessionid);
			}
			public CategoryDTO my_cat(String sessionid) {
				return sqlSession.selectOne(namespace+".my_cat", sessionid);
			}
			public MemberDTO f_info(String user_id) {
				return sqlSession.selectOne(namespace+".f_info", user_id);
			}
			public void info_fix(MemberDTO mdto) {
				sqlSession.update(namespace+".info_fix", mdto);
			}
			public List<MyFriendDTO> f_list(String user_id) {
				return sqlSession.selectList(namespace+".f_list", user_id);
			}
			
			public void write_board(PostDTO pdto) {
				sqlSession.insert(namespace+".write_board", pdto);
			}
			public List<PostDTO> board_list(String sessionid) {
				return sqlSession.selectList(namespace+".board_list", sessionid);
			}
			public List<ReplyDTO> reply_list(int idgroup) {
				return sqlSession.selectList(namespace+".reply_list", idgroup);
			}
			public void reply_write(ReplyDTO redto) {
				sqlSession.insert(namespace+".reply_write", redto);
			}
			public void p_like_up(PostDTO pdto) {
				sqlSession.update(namespace+".p_like_up", pdto);
			}
			public void p_like_down(PostDTO pdto) {
				sqlSession.update(namespace+".p_like_down", pdto);
			}
			public void p_like_in(PostDTO pdto) {
				sqlSession.insert(namespace+".p_like_in", pdto);
			}
			public PostLikeDTO p_like_chk(PostDTO pdto) {
				return sqlSession.selectOne(namespace+".p_like_chk", pdto);
			}
			public void p_like_chk_up(PostDTO pdto) {
				sqlSession.update(namespace+".p_like_chk_up", pdto);
			}
			public void p_like_chk_down(PostDTO pdto) {
				sqlSession.update(namespace+".p_like_chk_down", pdto);
			}
			//===================================
			public void r_like_up(ReplyDTO rdto) {
				sqlSession.update(namespace+".r_like_up", rdto);
			}
			public void r_like_down(ReplyDTO rdto) {
				sqlSession.update(namespace+".r_like_down", rdto);
			}
			public void r_like_in(ReplyDTO rdto) {
				sqlSession.insert(namespace+".r_like_in", rdto);
			}
			public ReplyLikeDTO r_like_chk(ReplyDTO rdto) {
				return sqlSession.selectOne(namespace+".r_like_chk", rdto);
			}
			public void r_like_chk_up(ReplyDTO rdto) {
				sqlSession.update(namespace+".r_like_chk_up", rdto);
			}
			public void r_like_chk_down(ReplyDTO rdto) {
				sqlSession.update(namespace+".r_like_chk_down", rdto);
			}
			//=============================================
			public void del_post(PostDTO pdto) {
				System.out.println(pdto.getP_num());
				sqlSession.delete(namespace+".del_post", pdto);
				sqlSession.delete(namespace+".del_post_like", pdto);
				sqlSession.delete(namespace+".del_re", pdto);
				sqlSession.delete(namespace+".del_re_like", pdto);
			}
			//=============================================
	public CategoryDTO mcategorychk(String m_id) {
		return sqlSession.selectOne(namespace+".mcategorychk",m_id);
	}
	

	/*친구 목록 */
	//========= John 수정 (12/4) ==============
	public List<MemberDTO> friendLists(String m_id) {
		List<MemberDTO> fList1 = null;
		List<MemberDTO> fList2 = null;
		try {
			fList1 = sqlSession.selectList(namespace+".friendLists1", m_id);
		} catch (Exception e) {
			System.out.println("ModelDAO friendLists catch 1");
		}
		try {
			fList2 = sqlSession.selectList(namespace+".friendLists2", m_id);
		} catch (Exception e) {
			System.out.println("ModelDAO friendLists catch 2");
		}
		fList1.addAll(fList2);
		
		return fList1;
	}
	//========================================
	/*친구 게시글만 추출*/
	public List<PostDTO> friendPost(String m_id){
		return sqlSession.selectList(namespace+".friendPost", m_id);
	}
	/*친구 게시글만 추출ajax*/
	public List<PostDTO> friendPostList(HashMap<String, Object> session){
		return sqlSession.selectList(namespace+".friendPostAjax", session );
	}
	/*댓글 달기*/
	public void addComment(ReplyDTO redto) {
		//System.out.println("세션 아이딩 :" + redto.getM_id());
		sqlSession.insert(namespace+".addComment", redto);
	}
	//댓글 가져오기 
	public List<ReplyDTO> getComment(HashMap<String, Object> reply) {
		return sqlSession.selectList(namespace+".getComment", reply );
	}
}
