package com.project.admin.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.project.comment.model.CommentDto;
import com.project.friend.model.FriendListDto;
import com.project.member.model.MemberDto;
import com.project.planner.model.PlannerDto;
import com.project.util.ParameterCheck;
import com.project.util.db.DBClose;
import com.project.util.db.DBConnection;

public class AdminDaoImpl implements AdminDao {
	
	private AdminDaoImpl(){}
	private static AdminDaoImpl adminDaoImpl;
	static {
		adminDaoImpl = new AdminDaoImpl();
	}
	
	public static AdminDaoImpl getAdminDaoImpl() {
		return adminDaoImpl;
	}

	
	//모든 멤버들의 정보를 가져옴
	@Override
	public List<MemberDto> getMembers() {
		List<MemberDto> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.makeConnection();
			String sql = "select m_id, m_name, m_pass, to_char(m_birth, 'yyyy-mm-dd') m_birth, m_gender \n";
			sql += "from member \n";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				MemberDto member = new MemberDto();
				member.setM_id(rs.getString("m_id"));
				member.setM_name(rs.getString("m_name"));
				member.setM_pass(rs.getString("m_pass"));
				member.setM_birth(ParameterCheck.nullToBlank(rs.getString("m_birth")));
				member.setM_gender(rs.getString("m_gender"));
				list.add(member);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return list;
	}

	
	//각 멤버별 친구 리스트를 가져옴
	@Override
	public List<String> getFriends(String m_id) {
		List<String> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "select f_id id \n";
			sql += "from friend_list \n";
			sql += "where m_id = ? \n";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				list.add(rs.getString("id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return list;
	}

	
	//각 멤버별 플래너 리스트를 가져옴
	@Override
	public List<PlannerDto> getPlanners(String m_id) {
		List<PlannerDto> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "select p_id, p_subject, likes\n";
			sql += "from planner, member, pgroup \n";
			sql += "where member.m_id = ? and \n";
			sql += "	member.m_id = pgroup.m_id and \n";
			sql += "	pgroup.g_id = planner.g_id \n";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				PlannerDto plan = new PlannerDto();
				plan.setP_id(rs.getString("p_id"));
				plan.setP_subject(rs.getString("p_subject"));
				plan.setLikes(rs.getInt("likes"));
				list.add(plan);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return list;
	}


	@Override
	public List<MemberDto> getSearchMembers(String key, String word) {

		List<MemberDto> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			
			sql.append("select m_id, m_name, m_pass, m_birth, m_gender \n ");
			sql.append("from member \n ");
			sql.append("where case when m_name < 'ㄱ' then substr(m_name, 1, 1)  \n ");
			sql.append("           when ascii('ㄱ') <= ascii(m_name) and ascii(m_name)<= ascii('ㅎ') then m_name  \n ");
			sql.append("           when m_name < '나' then 'ㄱ' \n ");
			sql.append("           when m_name < '다' then 'ㄴ' \n ");
			sql.append("           when m_name < '라' then 'ㄷ' \n ");
			sql.append("           when m_name < '마' then 'ㄹ' \n ");
			sql.append("           when m_name < '바' then 'ㅁ' \n ");
			sql.append("           when m_name < '사' then 'ㅂ' \n ");
			sql.append("           when m_name < '아' then 'ㅅ' \n ");
			sql.append("           when m_name < '자' then 'ㅇ' \n ");
			sql.append("           when m_name < '차' then 'ㅈ' \n ");
			sql.append("           when m_name < '카' then 'ㅊ' \n ");
			sql.append("           when m_name < '타' then 'ㅋ' \n ");
			sql.append("           when m_name < '파' then 'ㅌ' \n ");
			sql.append("           when m_name < '하' then 'ㅍ' \n ");
			sql.append("           else 'ㅎ' \n ");
			sql.append("           end =? \n ");
			sql.append("      or m_name like '%'||?||'%' \n ");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, word);
			pstmt.setString(2, word);
			
			rs = pstmt.executeQuery();

			while(rs.next()) {
				MemberDto member = new MemberDto();
				member.setM_id(rs.getString("m_id"));
				member.setM_name(rs.getString("m_name"));
				member.setM_pass(rs.getString("m_pass"));
				member.setM_birth(rs.getString("m_birth"));
				member.setM_gender(rs.getString("m_gender"));
				list.add(member);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return list;
	}


	@Override
	public void saveMemberDatas(MemberDto member, String m_id, String m_pass) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "update member set m_id = ?, m_name = ?, m_pass = ?, m_birth = ?, m_gender = ? \n";
			sql += "where m_id = ? and m_pass = ? \n";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getM_id());
			pstmt.setString(2, member.getM_name());
			pstmt.setString(3, member.getM_pass());
			pstmt.setString(4, member.getM_birth());
			pstmt.setString(5, member.getM_gender());
			pstmt.setString(6, m_id);
			pstmt.setString(7, m_pass);
			pstmt.executeQuery();
			
			conn.commit();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
		
		return;
		
	}


	@Override
	public String deleteMemberDatas(List<String> members) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.makeConnection();
			
			conn.setAutoCommit(false);
			
			
			int count = members.size();
			
			for(int i = 0; i < count; i++) {
				String sql = "";
				sql = "delete from friend_request where m_id = ? \n";
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setString(1, members.get(i));
				pstmt.executeUpdate();
				pstmt.close();
				
				sql = "delete from friend_list where m_id = ? \n";
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setString(1, members.get(i));
				pstmt.executeUpdate();
				pstmt.close();
				
				sql = "delete from group_invitation where m_id = ? \n";
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setString(1, members.get(i));
				pstmt.executeUpdate();
				pstmt.close();
				
				sql = "delete from public_comment where m_id = ? \n";
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setString(1, members.get(i));
				pstmt.executeUpdate();
				pstmt.close();
				
//				sql = " \n";
//				pstmt = conn.prepareStatement(sql.toString());
//				pstmt.executeUpdate();
//				pstmt.close();
//				
//				sql = "delete from member where m_id = ? \n";
//				pstmt = conn.prepareStatement(sql.toString());
//				pstmt.setString(1, members.get(i));
//				pstmt.executeUpdate();
//				pstmt.close();
//				
//				sql = " \n";
//				pstmt = conn.prepareStatement(sql.toString());
//				pstmt.executeUpdate();
//				pstmt.close();
				
			}
			
			conn.commit();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
		
		return null;
	}


	@Override
	public Map<String, String> getMemberDatas() {
		Map<String, String> mem = new HashMap<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			
			//총 멤버 수
			sql = "select count(m_id)as members \n";
			sql+= "from member \n";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
				mem.put("allMembers", ""+rs.getInt("members"));
			pstmt.close();
			rs.close();
			
			//평균 보유 플래너 수
			sql="select avg(m_c) avgplan from (select count(m_id) m_c from pgroup group by m_id) \n";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
				mem.put("avgPlans", ""+rs.getDouble("avgplan"));
			pstmt.close();
			rs.close();
			
			//평균 친구 수
			sql="select avg(m_f) avgFriends from (select count(m_id) m_f from friend_list group by m_id) \n";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
				mem.put("avgFriends", ""+rs.getDouble("avgFriends"));
			pstmt.close();
			rs.close();
			
			//총 남자 수
			sql="select count(m_gender) men from member where m_gender like '남%' \n";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
				mem.put("allMen", ""+rs.getInt("men"));
			pstmt.close();
			rs.close();
			
			//총 여자 수
			sql="select count(m_gender) women from member where m_gender like '여%' \n";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
				mem.put("allWomen", ""+rs.getInt("women"));
			pstmt.close();
			rs.close();

			//평균 나이
			sql="select avg(age) avgage from (select floor(floor(months_between(sysdate, m_birth))/12) age from member) \n";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
				mem.put("avgAge", ""+rs.getDouble("avgage"));
			pstmt.close();
			rs.close();
			
			//10대
			sql="select count(a.age) a \n";
			sql+= "       from (select age from (select floor(floor(months_between(sysdate, m_birth))/12) age from member) \n";
			sql+= "                        where age between 10 and 19) a ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
				mem.put("teens", ""+rs.getInt("a"));
			pstmt.close();
			rs.close();
			//20대
			sql="select count(a.age) a \n";
			sql+= "       from (select age from (select floor(floor(months_between(sysdate, m_birth))/12) age from member) \n";
			sql+= "                        where age between 20 and 29) a ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
				mem.put("twelves", ""+rs.getInt("a"));
			pstmt.close();
			rs.close();
			//30대
			sql="select count(a.age) a \n";
			sql+= "       from (select age from (select floor(floor(months_between(sysdate, m_birth))/12) age from member) \n";
			sql+= "                        where age between 30 and 39) a ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
				mem.put("thirties", ""+rs.getInt("a"));
			pstmt.close();
			rs.close();
			//40대
			sql="select count(a.age) a \n";
			sql+= "       from (select age from (select floor(floor(months_between(sysdate, m_birth))/12) age from member) \n";
			sql+= "                        where age between 40 and 49) a ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
				mem.put("forties", ""+rs.getInt("a"));
			pstmt.close();
			rs.close();
			
			//가입 방식 -페이스북
			sql="select count(m_login_type) j from member where m_login_type = 'facebook' \n";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
				mem.put("facebook", ""+rs.getInt("j"));
			pstmt.close();
			rs.close();
			//가입 방식 -구글
			sql="select count(m_login_type) j from member where m_login_type = 'google' \n";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
				mem.put("google", ""+rs.getInt("j"));
			pstmt.close();
			rs.close();
			//가입 방식 -일반
			sql="select count(m_login_type) j from member where m_login_type = 'general' \n";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
				mem.put("general", ""+rs.getInt("j"));
			pstmt.close();
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return mem;
	}


	@Override
	public Map<String, String> getPlannerDatas() {
		int year = Integer.parseInt((new SimpleDateFormat("yyyy")).format(new Date()));

		Map<String, String> plan = new HashMap<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			
			//총 플래너 수
			sql = "select count(p_id) count from planner \n";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
				plan.put("allPlanner", ""+rs.getInt("count"));
			pstmt.close();
			rs.close();
			
			//평균 여행 기간
			sql = "select avg(days) days \n";
			sql+= "from (select (to_date(end_day, 'yyyy-mm-dd') - to_date(start_day, 'yyyy-mm-dd')) days \n";
			sql+= "     from planner where substr(start_day,1,4) = ? \n";
			sql+= "		group by (to_date(end_day, 'yyyy-mm-dd') - to_date(start_day, 'yyyy-mm-dd'))) \n";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, year);
			rs = pstmt.executeQuery();
			if(rs.next())
				plan.put("avgPeriod", ""+rs.getDouble("days"));
			pstmt.close();
			rs.close();
			
			//10년전 플래너 수
			for(int i = 0; i < 10; i ++) {
				sql = "select count(p_id) count \n";
				sql+= "from planner \n";
				sql+= "where  substr(start_day,1,4) = ? \n";
				pstmt = conn.prepareStatement(sql);
				int num = year-9+i;
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				if(rs.next())
					plan.put("year"+(i+1), ""+rs.getInt("count"));
				pstmt.close();
				rs.close();
			}
			
			//남자 기간별
			int [] day = {1,3,7,14,21,31};
			
			for(int i = 0; i < 5; i++) {
				sql = "select sum(a.count) count \n";
				sql+= "from (select count(g_id) count \n";
				sql+= "      from planner, member \n";
				sql+= "      where (to_date(end_day, 'yyyy-mm-dd') - to_date(start_day, 'yyyy-mm-dd')) between ? and ? \n";
				sql+= "            and substr(start_day,1,4) = ? \n";
				sql+= "            and member.m_id = planner.m_id \n";
				sql+= "            and member.m_gender like '남%' \n";
				sql+= "      group by (to_date(end_day, 'yyyy-mm-dd') - to_date(start_day, 'yyyy-mm-dd'))) a  \n";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, day[i]);
				pstmt.setInt(2, day[i+1]);
				pstmt.setInt(3, year);
				rs = pstmt.executeQuery();
				if(rs.next())
					plan.put("period_m"+(i+1), ""+rs.getInt("count"));
				pstmt.close();
				rs.close();
			}
//			
			//남자 한달 이상
			sql = "select sum(a.count) count \n";
			sql+= "from (select count(g_id) count \n";
			sql+= "      from planner, member \n";
			sql+= "      where (to_date(end_day, 'yyyy-mm-dd') - to_date(start_day, 'yyyy-mm-dd')) > 31 \n";
			sql+= "            and substr(start_day,1,4) = ? \n";
			sql+= "            and member.m_id = planner.m_id \n";
			sql+= "            and member.m_gender like '남%' \n";
			sql+= "      group by (to_date(end_day, 'yyyy-mm-dd') - to_date(start_day, 'yyyy-mm-dd'))) a  \n";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, year);
			rs = pstmt.executeQuery();
			if(rs.next())
				plan.put("period_m6", ""+rs.getInt("count"));
			pstmt.close();
			rs.close();
			//여자 기간별
			for(int i = 0; i < 5; i++) {
				sql = "select sum(a.count) count \n";
				sql+= "from (select count(g_id) count \n";
				sql+= "      from planner, member \n";
				sql+= "      where (to_date(end_day, 'yyyy-mm-dd') - to_date(start_day, 'yyyy-mm-dd')) between ? and ? \n";
				sql+= "            and substr(start_day,1,4) = ? \n";
				sql+= "            and member.m_id = planner.m_id \n";
				sql+= "            and member.m_gender like '여%' \n";
				sql+= "      group by (to_date(end_day, 'yyyy-mm-dd') - to_date(start_day, 'yyyy-mm-dd'))) a  \n";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, day[i]);
				pstmt.setInt(2, day[i+1]);
				pstmt.setInt(3, year);
				rs = pstmt.executeQuery();
				if(rs.next())
					plan.put("period_w"+(i+1), ""+rs.getInt("count"));
				pstmt.close();
				rs.close();
			}
//			
			//여자 한달 이상
			sql = "select sum(a.count) count \n";
			sql+= "from (select count(g_id) count \n";
			sql+= "      from planner, member \n";
			sql+= "      where (to_date(end_day, 'yyyy-mm-dd') - to_date(start_day, 'yyyy-mm-dd')) > 31 \n";
			sql+= "            and substr(start_day,1,4) = ? \n";
			sql+= "            and member.m_id = planner.m_id \n";
			sql+= "            and member.m_gender like '여%' \n";
			sql+= "      group by (to_date(end_day, 'yyyy-mm-dd') - to_date(start_day, 'yyyy-mm-dd'))) a  \n";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, year);
			rs = pstmt.executeQuery();
			if(rs.next())
				plan.put("period_w6", ""+rs.getInt("count"));
			pstmt.close();
			rs.close();
			
			
			String[] monthName = {"jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec"};
			String[] monthNum = {"01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"};
			for(int i = 0; i < 12; i ++) {
				sql = "select count(months.mon) mon, months.month as month   \n";
				sql+= "from (select substr(start_day,6,2) mon, substr(start_day,6,2) month  \n";
				sql+= "      from planner) months \n";
				sql+= "where month = ? \n";
				sql+= "group by months.mon  \n";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, monthNum[i]);
				rs = pstmt.executeQuery();
				if(rs.next())
					plan.put(monthName[i], ""+rs.getInt("mon"));
				pstmt.close();
				rs.close();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return plan;
	}

}
