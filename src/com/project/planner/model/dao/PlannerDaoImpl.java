package com.project.planner.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.project.comment.model.CommentDto;
import com.project.planner.model.DayPlanDto;
import com.project.planner.model.DayRouteDto;
import com.project.planner.model.GroupMemberDto;
import com.project.planner.model.PlannerDto;
import com.project.util.db.DBClose;
import com.project.util.db.DBConnection;

public class PlannerDaoImpl implements PlannerDao{
	
	private static PlannerDao plannerDao;
	
	static {
		plannerDao = new PlannerDaoImpl();
	}
	
	private PlannerDaoImpl() {}
	

	public static PlannerDao getPlannerDao() {
		return plannerDao;
	}



	@Override
	public List<DayPlanDto> dayPlan(String p_id) {
		List<DayPlanDto> list = new ArrayList<DayPlanDto>();
		DayPlanDto dayPlanDto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			
			sql.append("select dp_date, dp_memo, dp_lodgment, dp_transportation \n");
			sql.append("from day_plan \n");
			sql.append("where p_id like ? \n");
			sql.append("order by dp_date");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, p_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dayPlanDto = new DayPlanDto();
				dayPlanDto.setDp_date(rs.getString("dp_date"));
				dayPlanDto.setDp_memo(rs.getString("dp_memo"));
				dayPlanDto.setDp_lodgment(rs.getString("dp_lodgment"));
				dayPlanDto.setDp_transportation(rs.getString("dp_transportation"));
				list.add(dayPlanDto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return list;
	}

	@Override
	public List<DayRouteDto> dayRoute(String p_id) {
		List<DayRouteDto> list = new ArrayList<DayRouteDto>();
		DayRouteDto dayRouteDto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			
			sql.append("select p_id, dr_date, dr_order, dr_location \n");
			sql.append("from day_route \n");
			sql.append("where p_id like ? \n");
			sql.append("order by dr_date, dr_order");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, p_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dayRouteDto = new DayRouteDto();
				dayRouteDto.setDr_date(rs.getString("dr_date"));
				dayRouteDto.setDr_order(rs.getInt("dr_order"));
				dayRouteDto.setDr_location(rs.getString("dr_location"));
				list.add(dayRouteDto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return list;
	}



	@Override
	public List<GroupMemberDto> groupMember(String p_id) {
		List<GroupMemberDto> list = new ArrayList<GroupMemberDto>();
		GroupMemberDto groupMemberDto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			
			sql.append("select gm.g_id, gm.m_id, m.m_name \n");
			sql.append("from groupmembers gm, member m \n");
			sql.append("where gm.m_id = m.m_id \n");
			sql.append("and gm.g_id = (select g_id \n");
			sql.append("               from planner \n");
			sql.append("               where p_id = ?)");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, p_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				groupMemberDto = new GroupMemberDto();
				groupMemberDto.setG_id(rs.getString("g_id"));
				groupMemberDto.setM_id(rs.getString("m_id"));
				groupMemberDto.setM_name(rs.getString("m_name"));
				list.add(groupMemberDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return list;
	}


	@Override
	public List<PlannerDto> plannerInfo(String p_id) {
		List<PlannerDto> list = new ArrayList<PlannerDto>();
		PlannerDto plannerDto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			
			sql.append("select p_id, g_id, m_id, m_name, p_subject, start_day, end_day, complete, p_img, p_public, likes \n");
			sql.append("from planner \n");
			sql.append("where p_id like ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, p_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				plannerDto = new PlannerDto();
				plannerDto.setP_id(rs.getString("p_id"));
				plannerDto.setG_id(rs.getString("g_id"));
				plannerDto.setM_id(rs.getString("m_id"));
				plannerDto.setM_name(rs.getString("m_name"));
				plannerDto.setP_subject(rs.getString("p_subject"));
				plannerDto.setStart_day(rs.getString("start_day"));
				plannerDto.setEnd_day(rs.getString("end_day"));
				plannerDto.setComplete(rs.getInt("complete"));
				plannerDto.setP_img(rs.getString("p_img"));
				plannerDto.setP_public(rs.getInt("p_public"));
				plannerDto.setLikes(rs.getInt("likes"));
				list.add(plannerDto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return list;
	}


	@Override
	public List<CommentDto> comment(String p_id) {
		List<CommentDto> list = new ArrayList<CommentDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			
			sql.append("select * \n");
			sql.append("from group_commnet \n");
			sql.append("where p_id like ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, p_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CommentDto commentDto = new CommentDto();
				commentDto.setG_id(rs.getString("g_id"));
				commentDto.setP_id(rs.getString("p_id"));
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
	public int makePlanner(Map<String, String>map) {
		int p_id = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			conn.setAutoCommit(false);
			
			StringBuffer select_g_id = new StringBuffer();
			select_g_id.append("select pgroup_g_id_seq.nextval g_id\n");
			select_g_id.append("from dual");
			pstmt = conn.prepareStatement(select_g_id.toString());
			rs = pstmt.executeQuery();
			rs.next();
			int g_id = rs.getInt(1);
			pstmt.close();
			
			StringBuffer insert_pgroup = new StringBuffer();
			insert_pgroup.append("insert into pgroup(g_id, m_id)\n");
			insert_pgroup.append("values(?, ?)");
			pstmt = conn.prepareStatement(insert_pgroup.toString());
			pstmt.setInt(1, g_id);
			pstmt.setString(2, map.get("m_id"));
			pstmt.executeUpdate();
			pstmt.close();
			
			StringBuffer insert_groupmember = new StringBuffer();
			insert_groupmember.append("insert into groupmembers(g_id, m_id)\n");
			insert_groupmember.append("values(?, ?)");
			pstmt = conn.prepareStatement(insert_groupmember.toString());
			pstmt.setInt(1, g_id);
			pstmt.setString(2, map.get("m_id"));
			pstmt.executeUpdate();
			pstmt.close();
			
			StringBuffer select_p_id = new StringBuffer();
			select_p_id.append("select planner_p_id_seq.nextval p_id\n");
			select_p_id.append("from dual");
			pstmt = conn.prepareStatement(select_p_id.toString());
			rs = pstmt.executeQuery();
			rs.next();
			p_id = rs.getInt(1);
			pstmt.close();
			
			StringBuffer insert_planner = new StringBuffer();
			insert_planner.append("insert into planner(p_id, g_id, p_subject, start_day, end_day, p_img, p_public, likes, complete, m_id, m_name)\n");
			insert_planner.append("values(?, ?, ?,  ?,  ?, ?, 0, 0, 0, ?, ?)");
			pstmt = conn.prepareStatement(insert_planner.toString());
			int idx = 1;
			pstmt.setInt(idx++, p_id);
			pstmt.setInt(idx++, g_id);
			pstmt.setString(idx++, map.get("plannerName"));
			pstmt.setString(idx++, map.get("startDate"));
			pstmt.setString(idx++, map.get("endDate"));
			pstmt.setString(idx++, map.get("p_img"));
			pstmt.setString(idx++, map.get("m_id"));
			pstmt.setString(idx++, map.get("m_name"));
			
			pstmt.executeUpdate();
			pstmt.close();
			
			conn.commit();
			
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}finally{
			DBClose.close(conn, pstmt, rs);
		}
		
		return p_id;
	}


	@Override
	public List<String> dateList(int p_id) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> dateList = new ArrayList<String>();
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select start_day, end_day\n");
			sql.append("from planner\n");
			sql.append("where p_id = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, p_id);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				dateList.add(rs.getString(1));
				dateList.add(rs.getString(2));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
		}
		return dateList;
	}


	@Override
	public int changeComplete(Map<String, String> map) {
		int complete;
		if(map.get("complete").equals("0")){
			complete = 1;
		} else {
			complete = 0;
		}
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "update planner \n";
			sql += "set complete = ? \n";
			sql += "where p_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, complete);
			pstmt.setString(2, map.get("p_id"));
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return complete;
	}


	@Override
	public int changePublic(Map<String, String> map) {
		int publics;
		if(map.get("publics").equals("0")){
			publics = 1;
		} else {
			publics = 0;
		}
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "update planner \n";
			sql += "set p_public = ? \n";
			sql += "where p_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, publics);
			pstmt.setString(2, map.get("p_id"));
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return publics;
	}


	@Override
	public int addPlanner_plan_route(DayPlanDto dayPlanDto, List<DayRouteDto> dayRouteDto) {
		//실패 0 	성공 1
		int success = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			
			//공통
			int p_id = dayPlanDto.getP_id();
			String date = dayPlanDto.getDp_date();
			int idx = 0;
			
			//day_plan 넣음
			sql.append("merge	into day_plan \n");
			sql.append("	using dual \n");
			sql.append("	on (dp_date = ? and p_id = ?) \n");
			sql.append("	when matched then \n");
			sql.append("		update set \n");
			sql.append("		dp_memo = ?, \n");
			sql.append("		dp_lodgment = ?, \n");
			sql.append("		dp_transportation = ? \n");
			
			sql.append("	when not matched then \n");
			sql.append("		insert (p_id, dp_date, dp_memo, dp_lodgment, dp_transportation) \n");
			sql.append("		values (?, ?, ?, ?, ?) \n");
			
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(++idx, date);
			pstmt.setInt(++idx, p_id);
			//
			pstmt.setString(++idx, dayPlanDto.getDp_memo());
	        pstmt.setString(++idx, dayPlanDto.getDp_lodgment());
	        pstmt.setString(++idx, dayPlanDto.getDp_transportation());
			//
	        pstmt.setInt(++idx, p_id);
	        pstmt.setString(++idx, date);
	        pstmt.setString(++idx, dayPlanDto.getDp_memo());
	        pstmt.setString(++idx, dayPlanDto.getDp_lodgment());
	        pstmt.setString(++idx, dayPlanDto.getDp_transportation());
	        pstmt.executeUpdate();
	        
	        pstmt.close();
	        
	        
	        sql = new StringBuffer(); //sql문 초기화
	        idx = 0;
			
			//day_route 넣음
			int len =  dayRouteDto.size();
			
			
			if(len == 0) {
				sql.append("delete day_route \n");
				sql.append("where dr_date = ? and p_id = ? \n");
				
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setString(1, date);
				pstmt.setInt(2, p_id);
				pstmt.executeUpdate();
		        pstmt.close();
			}
			
			for(int i = 0; i < len; i++) {
				double dr_lng = dayRouteDto.get(i).getDr_lng();
				
				sql.append("merge	into day_route \n");
				sql.append("	using dual \n");
				sql.append("	on (dr_date = ? and p_id = ? and dr_order = ?) \n");
				sql.append("	when matched then \n");
				sql.append("		update set \n");
				sql.append("		dr_location = ?, \n");
				sql.append("		dr_lat = ?, \n");
				sql.append("		dr_lng = ? \n");
				
				sql.append("	when not matched then \n");
				sql.append("	insert (p_id, dr_date, dr_order, dr_location, dr_lat, dr_lng) \n");
				sql.append("	values (?, ?, ?, ? ,? , ?) \n");
			
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setString(++idx, date);
				pstmt.setInt(++idx, p_id);
				pstmt.setInt(++idx, dayRouteDto.get(i).getDr_order());
				//
				pstmt.setString(++idx, dayRouteDto.get(i).getDr_location());
		        pstmt.setDouble(++idx, dayRouteDto.get(i).getDr_lat());
		        pstmt.setDouble(++idx, dayRouteDto.get(i).getDr_lng());
				//
				pstmt.setInt(++idx, p_id);
		        pstmt.setString(++idx, date);
		        pstmt.setInt(++idx, dayRouteDto.get(i).getDr_order());
		        pstmt.setString(++idx, dayRouteDto.get(i).getDr_location());
		        pstmt.setDouble(++idx, dayRouteDto.get(i).getDr_lat());
		        pstmt.setDouble(++idx, dayRouteDto.get(i).getDr_lng());
		        pstmt.executeUpdate();
		        pstmt.close();
		        
		        
		        sql = new StringBuffer(); //sql문 초기화
		        idx = 0;
			}
			
			conn.commit();
			
			success = 1;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
		
		return success;
	}


	@Override
	public DayPlanDto getDayPlan(String date, int p_id) {
		DayPlanDto dayPlanDto = new DayPlanDto();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			
			sql.append("select * from day_plan \n");
			sql.append("where dp_date = ? and p_id = ? \n");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, date);
			pstmt.setInt(2, p_id);
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				dayPlanDto.setDp_date(rs.getString("dp_date"));
				dayPlanDto.setP_id(rs.getInt("p_id"));
				dayPlanDto.setDp_transportation(rs.getString("dp_transportation"));
				dayPlanDto.setDp_lodgment(rs.getString("dp_lodgment"));
				dayPlanDto.setDp_memo(rs.getString("dp_memo"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return dayPlanDto;
	}


	@Override
	public List<DayRouteDto> getDayRoute(String date, int p_id) {
		List<DayRouteDto> list = new ArrayList<DayRouteDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			
			sql.append("select * from day_route \n");
			sql.append("where dr_date = ? and p_id = ? \n");
			sql.append("order by dr_order asc");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, date);
			pstmt.setInt(2, p_id);
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				
				DayRouteDto route = new DayRouteDto();
				
				route.setDr_date(rs.getString("dr_date"));
				route.setP_id(rs.getInt("p_id"));
				route.setDr_order(rs.getInt("dr_order"));
				route.setDr_location(rs.getString("dr_location"));
				route.setDr_lat(rs.getDouble("dr_lat"));
				route.setDr_lng(rs.getDouble("dr_lng"));
				
				list.add(route);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return list;
	}


	@Override
	public int changeLike(Map<String, String> map) {
		
		int like = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		if(map.get("like").equals("1")) {
			try {
				conn = DBConnection.makeConnection();
				conn.setAutoCommit(false);
				String insert_sql = "insert into likes(p_id, m_id) \n";
				insert_sql += "values (?, ?) \n";
				pstmt = conn.prepareStatement(insert_sql);
				pstmt.setString(1, map.get("p_id"));
				pstmt.setString(2, map.get("m_id"));
				pstmt.executeQuery();
				pstmt.close();
				
				String update_sql = "update planner \n";
				update_sql += "set likes = likes + 1 \n";
				update_sql += "where p_id = ?";
				pstmt = conn.prepareStatement(update_sql);
				pstmt.setString(1, map.get("p_id"));
				pstmt.executeQuery();
				pstmt.close();
				
				like = 1;
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBClose.close(conn, pstmt, rs);
			}
		} else {
			try {
				conn = DBConnection.makeConnection();
				conn.setAutoCommit(false);
				String delete_sql = "delete likes \n";
				delete_sql += "where p_id = ? \n";
				delete_sql += "and m_id = ? \n";
				pstmt = conn.prepareStatement(delete_sql);
				pstmt.setString(1, map.get("p_id"));
				pstmt.setString(2, map.get("m_id"));
				pstmt.executeQuery();
				pstmt.close();
				
				String update_sql = "update planner \n";
				update_sql += "set likes = likes - 1 \n";
				update_sql += "where p_id = ?";
				pstmt = conn.prepareStatement(update_sql);
				pstmt.setString(1, map.get("p_id"));
				pstmt.executeQuery();
				pstmt.close();
				
				like = 0;
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBClose.close(conn, pstmt, rs);
			}
		}
		return like;
	}


	@Override
	public int getLike(Map<String, String> map) {
		int like = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "select count(m_id) \n";
			sql += "from likes \n";
			sql += "where p_id = ? \n";
			sql += "and m_id like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, map.get("p_id"));
			pstmt.setString(2, map.get("m_id"));
			rs = pstmt.executeQuery();
			if(rs.next()) {
				like = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return like;
	}


	@Override
	public List<PlannerDto> plannerSquare(Map<String, String> map) {
		List<PlannerDto> list = new ArrayList<PlannerDto>();
		PlannerDto plannerDto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			
			sql.append("select b.* \n");
			sql.append("from(select rownum rn, a.* \n");
			sql.append("	 from(select p_id, g_id, m_id, m_name, p_subject, start_day, end_day, complete, p_img, p_public, likes \n");
			sql.append("		  from planner \n");
			sql.append("		  where p_public = 1 \n");
			if(map.get("key").equals("subject")){
				sql.append("		  and p_subject like '%'||?||'%' \n");
			} else if(map.get("key").equals("name")) {
				sql.append("		  and m_name like '%'||?||'%' \n");
			} else {
				sql.append("		  and m_id like '%'||?||'%' \n");
			}
			sql.append("		  order by p_id desc) a \n");
			sql.append("	 where rownum <= ?) b \n");
			sql.append("where b.rn > ?");
			pstmt = conn.prepareStatement(sql.toString());
			if(!map.get("word").isEmpty()) {
				pstmt.setString(1, map.get("word"));
			} else {
				pstmt.setString(1, "");
			}
			pstmt.setString(2, map.get("end"));
			pstmt.setString(3, map.get("start"));
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				plannerDto = new PlannerDto();
				plannerDto.setP_id(rs.getString("p_id"));
				plannerDto.setG_id(rs.getString("g_id"));
				plannerDto.setM_id(rs.getString("m_id"));
				plannerDto.setM_name(rs.getString("m_name"));
				plannerDto.setP_subject(rs.getString("p_subject"));
				plannerDto.setStart_day(rs.getString("start_day"));
				plannerDto.setEnd_day(rs.getString("end_day"));
				plannerDto.setComplete(rs.getInt("complete"));
				plannerDto.setP_img(rs.getString("p_img"));
				plannerDto.setP_public(rs.getInt("p_public"));
				plannerDto.setLikes(rs.getInt("likes"));
				list.add(plannerDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return list;
	}


	@Override
	public List<PlannerDto> bestPlanner() {
		List<PlannerDto> bestlist = new ArrayList<PlannerDto>();
		PlannerDto plannerDto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			
			sql.append("select rownum rn, a.* \n");
			sql.append("from (select p_id, g_id, m_id, m_name, p_subject, start_day, end_day, complete, p_img, p_public, likes \n");
			sql.append("	  from planner \n");
			sql.append("	  where p_public = 1 \n");
			sql.append("	  order by likes desc) a \n");
			sql.append("where rownum <= 4");
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				plannerDto = new PlannerDto();
				plannerDto.setP_id(rs.getString("p_id"));
				plannerDto.setG_id(rs.getString("g_id"));
				plannerDto.setM_id(rs.getString("m_id"));
				plannerDto.setM_name(rs.getString("m_name"));
				plannerDto.setP_subject(rs.getString("p_subject"));
				plannerDto.setStart_day(rs.getString("start_day"));
				plannerDto.setEnd_day(rs.getString("end_day"));
				plannerDto.setComplete(rs.getInt("complete"));
				plannerDto.setP_img(rs.getString("p_img"));
				plannerDto.setP_public(rs.getInt("p_public"));
				plannerDto.setLikes(rs.getInt("likes"));
				bestlist.add(plannerDto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return bestlist;
	}

	
	@Override
	public List<PlannerDto> myPlanner(Map<String, String> map) {
		List<PlannerDto> list = new ArrayList<PlannerDto>();
		PlannerDto plannerDto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			
			sql.append("select b.* \n");
			sql.append("from(select rownum rn, a.* \n");
			sql.append("	 from(select p_id, g_id, m_id, m_name, p_subject, start_day, end_day, complete, p_img, p_public, likes \n");
			sql.append("		  from planner \n");
			sql.append("		  where g_id in (select g_id \n");
			sql.append("			   	   		 from groupmembers \n");
			String id = map.get("m_id");
//			String complete = map.get("complete");
			sql.append("			   	   		 where m_id like '" + id + "') \n");
			sql.append("		  and complete = ? \n");
			sql.append("		order by p_id desc) a \n");
			sql.append("where rownum <= ?) b \n");
			sql.append("where b.rn > ?");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, map.get("complete"));
			pstmt.setString(2, map.get("end"));
			pstmt.setString(3, map.get("start"));
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				plannerDto = new PlannerDto();
				plannerDto.setP_id(rs.getString("p_id"));
				plannerDto.setG_id(rs.getString("g_id"));
				plannerDto.setM_id(rs.getString("m_id"));
				plannerDto.setM_name(rs.getString("m_name"));
				plannerDto.setP_subject(rs.getString("p_subject"));
				plannerDto.setStart_day(rs.getString("start_day"));
				plannerDto.setEnd_day(rs.getString("end_day"));
				plannerDto.setComplete(rs.getInt("complete"));
				plannerDto.setP_img(rs.getString("p_img"));
				plannerDto.setP_public(rs.getInt("p_public"));
				plannerDto.setLikes(rs.getInt("likes"));
				list.add(plannerDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return list;
	}
	

	@Override
	public List<PlannerDto> myPlannerLike(Map<String, String> map) {
		List<PlannerDto> list = new ArrayList<PlannerDto>();
		PlannerDto plannerDto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			
			sql.append("select b.* \n");
			sql.append("from(select rownum rn, a.* \n");
			sql.append("	 from(select p_id, g_id, m_id, m_name, p_subject, start_day, end_day, complete, p_img, p_public, likes \n");
			sql.append("	 	  from planner \n");
			sql.append("	 	  where p_id in (select p_id \n");
			sql.append("			   			 from likes \n");
			sql.append("			   			 where m_id like ?) \n");
			sql.append("	 	  order by p_id desc) a \n");
			sql.append("	 where rownum <= ?) b \n");
			sql.append("where b.rn > ?");
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setString(1, map.get("m_id"));
			pstmt.setString(2, map.get("end"));
			pstmt.setString(3, map.get("start"));
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				plannerDto = new PlannerDto();
				plannerDto.setP_id(rs.getString("p_id"));
				plannerDto.setG_id(rs.getString("g_id"));
				plannerDto.setM_id(rs.getString("m_id"));
				plannerDto.setM_name(rs.getString("m_name"));
				plannerDto.setP_subject(rs.getString("p_subject"));
				plannerDto.setStart_day(rs.getString("start_day"));
				plannerDto.setEnd_day(rs.getString("end_day"));
				plannerDto.setComplete(rs.getInt("complete"));
				plannerDto.setP_img(rs.getString("p_img"));
				plannerDto.setP_public(rs.getInt("p_public"));
				plannerDto.setLikes(rs.getInt("likes"));
				list.add(plannerDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return list;
	}


	@Override
	public void deletePlanner(String p_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.makeConnection();
			conn.setAutoCommit(false);
			
			String group_sql = "delete group_comment \n";
			group_sql += "where p_id = ?";
			pstmt = conn.prepareStatement(group_sql);
			pstmt.setString(1, p_id);
			pstmt.executeQuery();
			pstmt.close();
			
			String public_sql = "delete public_comment \n";
			public_sql += "where p_id = ?";
			pstmt = conn.prepareStatement(public_sql);
			pstmt.setString(1, p_id);
			pstmt.executeQuery();
			pstmt.close();
			
			String dp_sql = "delete day_plan \n";
			dp_sql += "where p_id = ?";
			pstmt = conn.prepareStatement(dp_sql);
			pstmt.setString(1, p_id);
			pstmt.executeQuery();
			pstmt.close();
			
			String dr_sql = "delete day_route \n";
			dr_sql += "where p_id = ?";
			pstmt = conn.prepareStatement(dr_sql);
			pstmt.setString(1, p_id);
			pstmt.executeQuery();
			pstmt.close();
			
			String planner_sql = "delete planner \n";
			planner_sql += "where p_id = ?";
			pstmt = conn.prepareStatement(planner_sql);
			pstmt.setString(1, p_id);
			pstmt.executeQuery();
			pstmt.close();
			
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
	}
	
	@Override
	public int addDayPlan(DayPlanDto dayPlanDto) {
		
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("merge into day_plan\n");
			sql.append("using dual\n");
			sql.append(" on (to_date(dp_date, 'yyyy.mm.dd') = to_date(?, 'yyyy.mm.dd') and p_id = ? )\n");
			sql.append("when matched then\n");
			sql.append("update\n");
			sql.append("set dp_memo = ?, dp_lodgment = ?, dp_transportation = ?\n");
			sql.append("when not matched then\n");
			sql.append("insert (p_id, dp_date, dp_memo, dp_lodgment, dp_transportation)\n");
			sql.append("values(?, to_char(to_date(?, 'yyyy-mm-dd'), 'yyyy-mm-dd'), ?, ?, ?)\n");
			pstmt = conn.prepareStatement(sql.toString());
			int idx = 1;
			pstmt.setString(idx++, dayPlanDto.getDp_date());
			pstmt.setInt(idx++, dayPlanDto.getP_id());
			pstmt.setString(idx++, dayPlanDto.getDp_memo());
			pstmt.setString(idx++, dayPlanDto.getDp_lodgment());
			pstmt.setString(idx++, dayPlanDto.getDp_transportation());
			
			pstmt.setInt(idx++, dayPlanDto.getP_id());
			pstmt.setString(idx++, dayPlanDto.getDp_date());
			pstmt.setString(idx++, dayPlanDto.getDp_memo());
			pstmt.setString(idx++, dayPlanDto.getDp_lodgment());
			pstmt.setString(idx++, dayPlanDto.getDp_transportation());
			
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			
			DBClose.close(conn, pstmt);
		}
		
		return cnt;
	}


	@Override
	public int addDayRoute(List<DayRouteDto> list) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean flag =true;
		try {
			conn = DBConnection.makeConnection();
			for(DayRouteDto dayRouteDto : list){

				StringBuffer insert_sql = new StringBuffer();
				insert_sql.append("insert into day_route(p_id, dr_date, dr_order, dr_location, dr_lat, dr_lng)\n");
				insert_sql.append("values(?, ?, ?, ?,?,?)");
				pstmt=conn.prepareStatement(insert_sql.toString());
				int idx = 1;
				pstmt.setInt(idx++, dayRouteDto.getP_id());
				pstmt.setString(idx++, dayRouteDto.getDr_date());
				pstmt.setInt(idx++, dayRouteDto.getDr_order());
				pstmt.setString(idx++, dayRouteDto.getDr_location());
				pstmt.setDouble(idx++, dayRouteDto.getDr_lat());
				pstmt.setDouble(idx++, dayRouteDto.getDr_lng());
				cnt = pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}finally{
			DBClose.close(conn, pstmt);
		}
		return cnt;
	}


	@Override
	public int deleteDayRoute(int p_id, String date) {
		// TODO Auto-generated method stub
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("delete from day_route\n");
			sql.append("where p_id = ? and dr_date = ?");
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setInt(1, p_id);
			pstmt.setString(2, date);
			cnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt);
		}
		
		return 0;
	}

	@Override
	public int getTotalArticleCountSquare(Map<String, String> map) {
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "select count(p_id) \n";
			sql += "from planner \n";
			sql += "where p_public = 1 \n";
			if(map.get("key").equals("subject")){
				sql += ("and p_subject like '%'||?||'%' \n");
			} else if(map.get("key").equals("name")) {
				sql += ("and m_name like '%'||?||'%' \n");
			} else {
				sql += ("and m_id like '%'||?||'%' \n");
			}
			sql += "order by p_id desc";
			
			pstmt = conn.prepareStatement(sql);
			if(!map.get("word").isEmpty()) {
				pstmt.setString(1, map.get("word"));
			} else {
				pstmt.setString(1, "");
			}
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return count;
	}


	@Override
	public int getTotalArticleCount(Map<String, String> map) {
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "select count(p_id) \n";
			sql += "from planner \n";
			sql += "where g_id in (select g_id \n";
			sql += "               from groupmembers \n";
			sql += "               where m_id like ?) \n";
			sql += "and complete = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, map.get("m_id"));
			pstmt.setString(2, map.get("complete"));
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return count;
	}


	@Override
	public int getTotalArticleCount(String m_id) {
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "select count(p_id) \n";
			sql += "from likes \n";
			sql += "where m_id like ? \n";
			sql += "order by p_id desc";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return count;
	}


	@Override
	public List<PlannerDto> adminSelectPlanner() {
		List<PlannerDto> list = new ArrayList<PlannerDto>();
		PlannerDto plannerDto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			
			sql.append("select p_id, g_id, m_id, m_name, p_subject, start_day, end_day, complete, p_img, p_public, likes \n");
			sql.append("from planner \n");
			sql.append("where p_id in (select p_id from admin_select_planner)");
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				plannerDto = new PlannerDto();
				plannerDto.setP_id(rs.getString("p_id"));
				plannerDto.setG_id(rs.getString("g_id"));
				plannerDto.setM_id(rs.getString("m_id"));
				plannerDto.setM_name(rs.getString("m_name"));
				plannerDto.setP_subject(rs.getString("p_subject"));
				plannerDto.setStart_day(rs.getString("start_day"));
				plannerDto.setEnd_day(rs.getString("end_day"));
				plannerDto.setComplete(rs.getInt("complete"));
				plannerDto.setP_img(rs.getString("p_img"));
				plannerDto.setP_public(rs.getInt("p_public"));
				plannerDto.setLikes(rs.getInt("likes"));
				list.add(plannerDto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return list;
	}

}
