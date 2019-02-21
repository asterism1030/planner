package com.project.comment.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.project.comment.model.CommentDto;
import com.project.util.db.DBClose;
import com.project.util.db.DBConnection;

public class CommentDaoImpl implements CommentDao {
	
	private static CommentDaoImpl commentDaoImpl;
	
	static {
		commentDaoImpl = new CommentDaoImpl();
	}
	
	private CommentDaoImpl() {}
	

	public static CommentDaoImpl getCommentDaoImpl() {
		return commentDaoImpl;
	}



	@Override
	public List<CommentDto> groupCommentList(String p_id) {
		List<CommentDto> list = new ArrayList<CommentDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			String sql = "select gc_id, p_id, g_id, m_id, m_name, gc_content, gc_date \n";
			sql += "from group_comment \n";
			sql += "where p_id like ? \n";
			sql += "order by gc_date desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p_id);
			//System.out.println(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				CommentDto commentDto = new CommentDto();
				commentDto.setGc_id(rs.getInt("gc_id"));
				commentDto.setP_id(rs.getString("p_id"));
				commentDto.setG_id(rs.getString("g_id"));
				commentDto.setM_id(rs.getString("m_id"));
				commentDto.setM_name(rs.getString("m_name"));
				commentDto.setGc_content(rs.getString("gc_content"));
				commentDto.setGc_date(rs.getString("gc_date"));
				list.add(commentDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return list;
	}

	@Override
	public void groupCommentWrite(CommentDto commentDto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			String sql = "insert into group_comment (gc_id, p_id, g_id, m_id, m_name, gc_content, gc_date) \n";
			sql += "values (group_comment_gc_id_seq.nextval,?, ?, ?, ?, ?, sysdate)";
			//System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, commentDto.getP_id());
			pstmt.setString(2, commentDto.getG_id());
			pstmt.setString(3, commentDto.getM_id());
			pstmt.setString(4, commentDto.getM_name());
			pstmt.setString(5, commentDto.getGc_content());
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
	}


	@Override
	public void groupCommentDelete(int gc_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			String sql = "delete group_comment \n";
			sql += "where gc_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gc_id);
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
	}


	@Override
	public void groupCommentModify(CommentDto commentDto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			String sql = "update group_comment set gc_content = ?\n";
			sql += "where gc_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, commentDto.getGc_content());
			pstmt.setInt(2, commentDto.getGc_id());
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
	}


	@Override
	public List<CommentDto> commentList(String p_id) {
		List<CommentDto> list = new ArrayList<CommentDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			String sql = "select c_id, p_id, m_id, m_name, c_content, c_date \n";
			sql += "from public_comment \n";
			sql += "where p_id like ? \n";
			sql += "order by c_date desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p_id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				CommentDto commentDto = new CommentDto();
				commentDto.setGc_id(rs.getInt("c_id"));
				commentDto.setP_id(rs.getString("p_id"));
				commentDto.setM_id(rs.getString("m_id"));
				commentDto.setM_name(rs.getString("m_name"));
				commentDto.setGc_content(rs.getString("c_content"));
				commentDto.setGc_date(rs.getString("c_date"));
				list.add(commentDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return list;
	}


	@Override
	public void commentWrite(CommentDto commentDto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			String sql = "insert into public_comment (c_id, p_id, m_id, m_name, c_content, c_date) \n";
			sql += "values (public_comment_c_id_seq.nextval, ?, ?, ?, ?, sysdate)";
			//System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, commentDto.getP_id());
			pstmt.setString(2, commentDto.getM_id());
			pstmt.setString(3, commentDto.getM_name());
			pstmt.setString(4, commentDto.getGc_content());
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
	}


	@Override
	public void commentDelete(int gc_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			String sql = "delete public_comment \n";
			sql += "where c_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gc_id);
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
	}


	@Override
	public void commentModify(CommentDto commentDto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			String sql = "update public_comment set c_content = ?\n";
			sql += "where c_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, commentDto.getGc_content());
			pstmt.setInt(2, commentDto.getGc_id());
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
	}

}
