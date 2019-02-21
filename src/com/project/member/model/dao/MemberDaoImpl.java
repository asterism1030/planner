package com.project.member.model.dao;

import java.sql.*;
import java.util.*;

import com.project.member.model.MemberDto;
import com.project.util.db.DBClose;
import com.project.util.db.DBConnection;

public class MemberDaoImpl implements MemberDao {
	
	//single tone pattern
	private MemberDaoImpl(){}
	private static MemberDao memberDao;
	static {
		memberDao = new MemberDaoImpl();
	}
	

	public static MemberDao getMemberDao() {
		return memberDao;
	}

	
	@Override
	public int idCheck(String id) {
		//존재시 1, 없을시 0
		int reg = 0;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			sql += "select m_id \n";
			sql += "from member \n";
			sql += "where m_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			
			if(rs.next()) {
//				System.out.println("해당 email 존재! email-->" + rs.getString("m_id"));
				reg = 1;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return reg;
	}

	@Override
	public int register(MemberDto memberDto) {
		//insert 성공시 1, 실패시 0 반환
		int reg = idCheck(memberDto.getM_id());
		
		if(reg ==1) //아이디 존재시
			return 0; //회원 가입 실패
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			sql += "insert into member (m_id, m_name, m_pass, m_birth, m_gender, m_login_type) \n";
			sql += "values (?, ?, ?, to_date(?, 'yyyy-mm-dd'), ?, 'general')";
			psmt = conn.prepareStatement(sql);
			
//			System.out.println(sql);
			
			int idx = 0;
			psmt.setString(++idx, memberDto.getM_id());
			psmt.setString(++idx, memberDto.getM_name());
			psmt.setString(++idx, memberDto.getM_pass());
			psmt.setString(++idx, memberDto.getM_birth());
			psmt.setString(++idx, memberDto.getM_gender());
			
			psmt.executeQuery();
			
			
			reg = 1;
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt);
		}
		
		return reg;
	}

	
	@Override
	public MemberDto login(Map<String, String> map) {
		MemberDto memberDto=null;
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			sql += "select m_id, m_name, m_pass, m_birth, m_gender \n";
			sql += "from member \n";
			sql += "where m_id = ? and m_pass = ? \n";	//PreparedStatement는 치환변수이기 때문에 ?를 사용할 수 있다
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, map.get("userid"));   //첫번째 변수 ? 에 userid를 넣음
			psmt.setString(2, map.get("userpass")); //두번째 변수 ? 에 pass를 넣음 (userid와 pass는 MemberServiceImpl->login에서 map에 넣은 값)
			rs = psmt.executeQuery();
			
//			System.out.println(sql + "\nuserid: " + map.get("userid") + "\nuserpass: " + map.get("userpass"));
			
			if(rs.next()) {
				memberDto = new MemberDto();
				memberDto.setM_id(rs.getString("m_id"));
				memberDto.setM_name(rs.getString("m_name"));
				memberDto.setM_pass(rs.getString("m_pass"));
				memberDto.setM_birth(rs.getString("m_birth"));
				memberDto.setM_gender(rs.getString("m_gender"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return memberDto;
	}


	@Override
	public MemberDto facebookLogin(Map<String, String> map) {
		
		MemberDto memberDto = new MemberDto();
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			//데이터가 없을 시 넣고 있을시 패스
			String sql = "";
			sql += "merge	into member \n";
			sql += "	using dual \n";
			sql += "	on (m_id = ? and m_pass = ?) \n";
			sql += "	when not matched then \n";
			sql += "	insert (m_id, m_name, m_pass, m_gender, m_login_type)";
			sql += "	values (?, ?, ?, ?, 'facebook')";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, map.get("userid"));
			psmt.setString(2, map.get("userpass"));
			psmt.setString(3, map.get("userid"));
			psmt.setString(4, map.get("username"));
			psmt.setString(5, map.get("userpass"));
			psmt.setString(6, map.get("usergender"));
			rs = psmt.executeQuery();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		//데이터를 가져옴
		memberDto = login(map);
		
		return memberDto;
	}
	
	@Override
	public void modifyMember(MemberDto memberDto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "update member \n";
			sql += "set m_birth = to_date(?, 'yyyy-mm-dd'), m_gender = ? \n";
			sql += "where m_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberDto.getM_birth());
			pstmt.setString(2, memberDto.getM_gender());
			pstmt.setString(3, memberDto.getM_id());
			pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
	}


	@Override
	public void changePass(Map<String, String> map) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "update member \n";
			sql += "set m_pass = ? \n";
			sql += "where m_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, map.get("pass"));
			pstmt.setString(2, map.get("m_id"));
			pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
	}
	
	@Override
	public int checkMember(String email, String name, String birth) {
		//성공시 1, 실패시 0
		int success = 0;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			sql += "select m_id from member \n";
			sql += "	   where m_id = ? and \n";
			sql += "       m_name = ? and \n";
			sql += "       m_birth = to_date(?, 'yyyy-mm-dd') \n";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);
			psmt.setString(2, name);
			psmt.setString(3, birth);
			rs = psmt.executeQuery();
			
			if(rs.next())
				success = 1;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		return success;
	}


	@Override
	public String changePass(String email) {
		String pass = "";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			sql += "update member set m_pass = (select dbms_random.string('A', 10) from dual) where m_id = ? \n";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);
			psmt.executeUpdate();
			conn.commit();
			
			psmt.close();
			sql = "select m_pass from member where m_id = ? \n";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);
			rs = psmt.executeQuery();
			if(rs.next())
				pass = rs.getString("m_pass");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt,rs);
		}
		
		return pass;
	}
	
}







