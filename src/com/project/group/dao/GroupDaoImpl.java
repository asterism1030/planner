package com.project.group.dao;

import java.sql.*;

import com.project.group.model.GroupInvitationDto;
import com.project.planner.model.dao.PlannerDao;
import com.project.planner.model.dao.PlannerDaoImpl;
import com.project.util.db.DBClose;
import com.project.util.db.DBConnection;

public class GroupDaoImpl implements GroupDao {

	private static GroupDao groupDao;

	private GroupDaoImpl() {
	};

	static {

		groupDao = new GroupDaoImpl();
	}

	public static GroupDao getGroupDao() {
		return groupDao;
	}

	@Override
	public int addGroupMember(GroupInvitationDto groupInvitationDto) {

		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.makeConnection();

			StringBuffer select_sql = new StringBuffer();
			select_sql.append("select count(*)\n");
			select_sql.append("from group_invitation\n");
			select_sql.append("where m_id = ?\n");
			select_sql.append("and to_id = ?");
			pstmt = conn.prepareStatement(select_sql.toString());

			int idx = 1;
			pstmt.setString(idx++, groupInvitationDto.getM_id());
			pstmt.setString(idx++, groupInvitationDto.getTo_id());
			rs = pstmt.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			pstmt.close();

			if (count == 0) {
				// 실행.
				idx = 1;
				StringBuffer insert_sql = new StringBuffer();
				insert_sql.append(
						"insert into group_invitation(gi_id, g_id, p_subject,p_img, m_id, m_name, to_id, gi_date, gi_check, gi_content)\n");
				insert_sql.append("values(group_invitation_gi_id_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate, 'n', ?)");
				pstmt = conn.prepareStatement(insert_sql.toString());

				pstmt.setInt(idx++, groupInvitationDto.getG_id());
				pstmt.setString(idx++, groupInvitationDto.getP_subject());
				pstmt.setString(idx++, groupInvitationDto.getP_img());
				pstmt.setString(idx++, groupInvitationDto.getM_id());
				pstmt.setString(idx++, groupInvitationDto.getM_name());
				pstmt.setString(idx++, groupInvitationDto.getTo_id());
				pstmt.setString(idx++, groupInvitationDto.getGi_content());
				cnt = pstmt.executeUpdate();
				pstmt.close();
			} else {
				System.out.println("count가 0이 아님");
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return cnt;
	}

	@Override
	public String getP_subject(int p_id) {

		String p_subject = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select p_subject\n");
			sql.append("from planner\n");
			sql.append("where p_id = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, p_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {

				p_subject = rs.getString(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}

		return p_subject;
	}

	@Override
	public String getP_img(int p_id) {

		String p_img = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select p_img\n");
			sql.append("from planner\n");
			sql.append("where p_id = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, p_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {

				p_img = rs.getString(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}

		return p_img;
	}

}
