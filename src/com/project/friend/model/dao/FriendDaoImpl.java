package com.project.friend.model.dao;

import java.sql.*;
import java.util.*;

import com.project.friend.model.FriendListDto;
import com.project.friend.model.dao.FriendDao;
import com.project.message.model.FriendRequestDto;
import com.project.util.db.DBClose;
import com.project.util.db.DBConnection;

public class FriendDaoImpl implements FriendDao {

	private static FriendDaoImpl friendDaoImpl;
	private FriendDaoImpl(){};
	
	static{
		
		friendDaoImpl = new FriendDaoImpl();
	}
	
	public static FriendDaoImpl getFriendDaoImpl() {
		return friendDaoImpl;
	}

	@Override
	public List<FriendListDto> friendList(String m_id) {
		
		List<FriendListDto> list = new ArrayList<FriendListDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select fl_id, m_id, f_id, f_name\n");
			sql.append("from friend_list\n");
			sql.append("where m_id = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FriendListDto friendListDto = new FriendListDto();
				
				friendListDto.setFl_id(rs.getInt("fl_id"));
				friendListDto.setM_id(rs.getString("m_id"));
				friendListDto.setF_id(rs.getString("f_id"));
				friendListDto.setF_name(rs.getString("f_name"));
				
				list.add(friendListDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBClose.close(conn, pstmt,rs);
		}
		return list;
	}

	@Override
	public int deleteFriend(String f_id, String m_id) {
		
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.makeConnection();
			conn.setAutoCommit(false);
			StringBuffer sql1 = new StringBuffer();
			sql1.append("delete from friend_list\n");
			sql1.append("where f_id = ?\n");
			sql1.append("and m_id = ?");
			pstmt = conn.prepareStatement(sql1.toString());
			pstmt.setString(1, f_id);
			pstmt.setString(2, m_id);
			cnt = pstmt.executeUpdate();
			pstmt.close();
			
			StringBuffer sql2 = new StringBuffer();
			sql2.append("delete from friend_list\n");
			sql2.append("where f_id = ?\n");
			sql2.append("and m_id = ?");
			pstmt = conn.prepareStatement(sql2.toString());
			pstmt.setString(1, m_id);
			pstmt.setString(2, f_id);
			cnt = pstmt.executeUpdate();
			pstmt.close();
			
			conn.commit();
			
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} finally{
			DBClose.close(conn, pstmt);
		}
		
		return cnt;
	}

	@Override
	public int addFriend(Map<String, String> map) {

		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String m_id = map.get("m_id");
		String m_name = map.get("m_name");
		String to_id = map.get("toid");
		String content = map.get("content");
		try {
			conn = DBConnection.makeConnection();

			StringBuffer select_sql = new StringBuffer();			
			select_sql.append("select count(*)\n");
			select_sql.append("from friend_request\n");
			select_sql.append("where m_id = ?\n");
			select_sql.append("and from_id = ?");
			pstmt = conn.prepareStatement(select_sql.toString());
			
			int idx = 1;
			pstmt.setString(idx++, to_id);
			pstmt.setString(idx++, m_id);
			rs = pstmt.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			pstmt.close();
			
			if(count == 0){
				//실행.
				StringBuffer insert_sql = new StringBuffer();
				insert_sql.append("insert into friend_request(fr_id, m_id, from_id, from_name, fr_date, fr_check, fr_content)\n");
				insert_sql.append("values(friend_request_fr_id_seq.nextval, ?, ?, ?, sysdate, 'n', ?)");
				pstmt = conn.prepareStatement(insert_sql.toString());
				System.out.println(insert_sql);
				idx = 1;
				pstmt.setString(idx++, to_id);
				pstmt.setString(idx++, m_id);
				pstmt.setString(idx++, m_name);
				pstmt.setString(idx++, content);
				cnt = pstmt.executeUpdate();
				pstmt.close();
			}else{
				System.out.println("count가 0이 아님");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally{
			DBClose.close(conn, pstmt, rs);
		}
		return cnt;
	}

	@Override
	public int checkFriendId(String toid) {
		
		int cnt = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select count(m_id)\n");
			sql.append("from member\n");
			sql.append("where m_id = ?");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, toid);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBClose.close(conn, pstmt, rs);
		}
		return cnt;
	}

}
