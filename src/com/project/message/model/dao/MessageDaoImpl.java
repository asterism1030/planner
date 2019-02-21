package com.project.message.model.dao;

import java.sql.*;
import java.util.*;

import com.project.group.model.GroupInvitationDto;
import com.project.message.model.*;
import com.project.util.db.DBClose;
import com.project.util.db.DBConnection;

public class MessageDaoImpl implements MessageDao {

	private static MessageDaoImpl messageDaoImpl;
	
	private MessageDaoImpl(){};
	
	static {
		
		messageDaoImpl = new MessageDaoImpl();
	}
	
	public static MessageDaoImpl getMessageDaoImpl() {
		return messageDaoImpl;
	}

	@Override
	public List<FriendRequestDto> listFriendRequest(String m_id) {
		List<FriendRequestDto> list = new ArrayList<FriendRequestDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select fr_id, m_id, from_id, from_name, fr_date, fr_check, fr_content\n");
			sql.append("from friend_request\n");
			sql.append("where m_id = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FriendRequestDto friendRequestDto = new FriendRequestDto();
				
				friendRequestDto.setFr_id(rs.getInt("fr_id"));
				friendRequestDto.setM_id(rs.getString("m_id"));
				friendRequestDto.setFrom_id(rs.getString("from_id"));
				friendRequestDto.setFrom_name(rs.getString("from_name"));
				friendRequestDto.setFr_date(rs.getString("fr_date"));
				friendRequestDto.setFr_check(rs.getString("fr_check"));
				friendRequestDto.setFr_content(rs.getString("fr_content"));
				
				list.add(friendRequestDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBClose.close(conn, pstmt,rs);
		}
		
		return list;
	}

	@Override
	public List<MessageDto> listMessage(String m_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<GroupInvitationDto> listGroupRequest(String m_id) {
		List<GroupInvitationDto> list = new ArrayList<GroupInvitationDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select gi_id, g_id, p_subject, p_img, m_id, m_name, to_id, gi_date, gi_check, gi_content\n");
			sql.append("from group_invitation\n");
			sql.append("where to_id = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				
				GroupInvitationDto groupInvitationDto = new GroupInvitationDto();
				groupInvitationDto.setGi_id(rs.getInt("gi_id"));
				groupInvitationDto.setG_id(rs.getInt("g_id"));
				groupInvitationDto.setP_subject(rs.getString("p_subject"));
				groupInvitationDto.setP_img(rs.getString("p_img"));
				groupInvitationDto.setM_id(rs.getString("m_id"));
				groupInvitationDto.setM_name(rs.getString("m_name"));
				groupInvitationDto.setTo_id((rs.getString("to_id")));
				groupInvitationDto.setGi_date(rs.getString("gi_date"));
				groupInvitationDto.setGi_check(rs.getString("gi_check"));
				groupInvitationDto.setGi_content(rs.getString("gi_content"));
//				System.out.println("p_img : " + groupInvitationDto.getP_img());
				list.add(groupInvitationDto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBClose.close(conn, pstmt,rs);
		}
		
		return list;
	}

	@Override
	public int acceptFriendRequest(Map<String, String>map) {
		int cnt=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			conn.setAutoCommit(false);
			StringBuffer insert1 = new StringBuffer();
			insert1.append("insert into friend_list(fl_id, m_id, f_id, f_name)\n");
			insert1.append("values(friend_list_fl_id_seq.nextval, ?, ?, ?)");
			pstmt = conn.prepareStatement(insert1.toString());
			pstmt.setString(1, map.get("m_id")); // 현재 내 아이디
			pstmt.setString(2, map.get("f_id")); // 신청 온 아이디
			pstmt.setString(3, map.get("f_name")); // 신청 온 사람 이름
			pstmt.executeUpdate();
			pstmt.close();
			
			StringBuffer insert2 = new StringBuffer();
			insert2.append("insert into friend_list(fl_id, m_id, f_id, f_name)\n");
			insert2.append("values(friend_list_fl_id_seq.nextval, ?, ?, ?)");
			pstmt = conn.prepareStatement(insert1.toString());
			pstmt.setString(1, map.get("f_id"));	// 신청 온 아이디
			pstmt.setString(2, map.get("m_id"));	// 내 아이디
			pstmt.setString(3, map.get("m_name"));	// 내 이름
			pstmt.executeUpdate();
			pstmt.close();
			
			
			StringBuffer delete = new StringBuffer();
			delete.append("delete friend_request\n");
			delete.append("where fr_id = ? ");
			pstmt = conn.prepareStatement(delete.toString());
			pstmt.setInt(1, Integer.parseInt(map.get("fr_id")));
			pstmt.executeUpdate();
			pstmt.close();
			
			conn.commit();
			cnt = 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			DBClose.close(conn, pstmt);
		}
		
		return cnt;
	}

	@Override
	public int denyFriendRequest(int fr_id) {

		
		int cnt=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("delete friend_request\n");
			sql.append("where fr_id = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, fr_id);
			cnt = pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt);
		}		
		return cnt;
	}

	@Override
	public int acceptGroupRequest(GroupMembersDto groupMembersDto,  int gi_id) {
		int cnt=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.makeConnection();
			conn.setAutoCommit(false);
			StringBuffer insert = new StringBuffer();
			insert.append("insert into groupmembers(g_id, m_id)\n");
			insert.append("values(?,?)");
			pstmt = conn.prepareStatement(insert.toString());
			pstmt.setInt(1, groupMembersDto.getG_id());
			pstmt.setString(2, groupMembersDto.getM_id());
			cnt = pstmt.executeUpdate();
			pstmt.close();
			
			StringBuffer delete = new StringBuffer();
			delete.append("delete group_invitation\n");
			delete.append("where gi_id = ?\n");
			pstmt = conn.prepareStatement(delete.toString());
			pstmt.setInt(1, gi_id);
			cnt = pstmt.executeUpdate();
			pstmt.close();
			
			conn.commit();
			cnt = 1;
		}catch (SQLException e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			DBClose.close(conn, pstmt);
		}		
		return cnt;
	}

	@Override
	public int denyGroupRequest(int gi_id) {
		int cnt=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("delete from group_invitation\n");
			sql.append("where gi_id = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, gi_id);
			cnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt);
		}
		
		return cnt;
	}

}
