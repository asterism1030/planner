ALTER TABLE pgroup
	DROP
		CONSTRAINT FK_member_TO_pgroup
		CASCADE;

ALTER TABLE planner
	DROP
		CONSTRAINT FK_pgroup_TO_planner
		CASCADE;

ALTER TABLE planner
	DROP
		CONSTRAINT FK_member_TO_planner
		CASCADE;

ALTER TABLE public_comment
	DROP
		CONSTRAINT FK_planner_TO_public_comment
		CASCADE;

ALTER TABLE public_comment
	DROP
		CONSTRAINT FK_member_TO_public_comment
		CASCADE;

ALTER TABLE friend_list
	DROP
		CONSTRAINT FK_member_TO_friend_list
		CASCADE;

ALTER TABLE groupmembers
	DROP
		CONSTRAINT FK_pgroup_TO_groupmembers
		CASCADE;

ALTER TABLE groupmembers
	DROP
		CONSTRAINT FK_member_TO_groupmembers
		CASCADE;

ALTER TABLE friend_request
	DROP
		CONSTRAINT FK_member_TO_friend_request
		CASCADE;

ALTER TABLE day_plan
	DROP
		CONSTRAINT FK_planner_TO_day_plan
		CASCADE;

ALTER TABLE day_route
	DROP
		CONSTRAINT FK_planner_TO_day_route
		CASCADE;

ALTER TABLE group_comment
	DROP
		CONSTRAINT FK_pgroup_TO_group_comment
		CASCADE;

ALTER TABLE group_comment
	DROP
		CONSTRAINT FK_planner_TO_group_comment
		CASCADE;

ALTER TABLE group_invitation
	DROP
		CONSTRAINT FK_g_members_TO_g_invitation
		CASCADE;

ALTER TABLE likes
	DROP
		CONSTRAINT FK_planner_TO_likes
		CASCADE;

ALTER TABLE likes
	DROP
		CONSTRAINT FK_member_TO_likes
		CASCADE;

ALTER TABLE admin_select_planner
	DROP
		CONSTRAINT FK_plan_TO_admin_sel_plann
		CASCADE;

ALTER TABLE member
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE pgroup
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE planner
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE public_comment
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE friend_list
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE groupmembers
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE friend_request
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE group_comment
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE group_invitation
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX member_m_id_pk;

DROP INDEX pgroup_g_id_pk;

DROP INDEX planner_p_id_pk;

DROP INDEX PK_public_comment;

DROP INDEX PK_friend_list;

DROP INDEX PK_g_members;

DROP INDEX PK_friend_request;

DROP INDEX PK_group_comment;

DROP INDEX PK_group_invitation;

/* 회원 */
DROP TABLE member 
	CASCADE CONSTRAINTS;

/* 그룹 */
DROP TABLE pgroup 
	CASCADE CONSTRAINTS;

/* 플래너 */
DROP TABLE planner 
	CASCADE CONSTRAINTS;

/* 일반댓글 */
DROP TABLE public_comment 
	CASCADE CONSTRAINTS;

/* 친구목록 */
DROP TABLE friend_list 
	CASCADE CONSTRAINTS;

/* 그룹원 */
DROP TABLE groupmembers 
	CASCADE CONSTRAINTS;

/* 친구신청 */
DROP TABLE friend_request 
	CASCADE CONSTRAINTS;

/* 일별 플래너 */
DROP TABLE day_plan 
	CASCADE CONSTRAINTS;

/* 일별경로 */
DROP TABLE day_route 
	CASCADE CONSTRAINTS;

/* 그룹댓글 */
DROP TABLE group_comment 
	CASCADE CONSTRAINTS;

/* 그룹초대 */
DROP TABLE group_invitation 
	CASCADE CONSTRAINTS;

/* 좋아요 */
DROP TABLE likes 
	CASCADE CONSTRAINTS;

/* 새 테이블 */
DROP TABLE admin_select_planner 
	CASCADE CONSTRAINTS;
	
DROP SEQUENCE pgroup_g_id_seq;
DROP SEQUENCE planner_p_id_seq;
DROP SEQUENCE public_comment_c_id_seq;
DROP SEQUENCE friend_request_fr_id_seq;
DROP SEQUENCE group_invitation_gi_id_seq;
DROP SEQUENCE friend_list_fl_id_seq;
DROP SEQUENCE group_comment_gc_id_seq;

CREATE SEQUENCE pgroup_g_id_seq
START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE planner_p_id_seq
START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE public_comment_c_id_seq
START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE friend_request_fr_id_seq
START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE group_invitation_gi_id_seq
START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE friend_list_fl_id_seq
START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE group_comment_gc_id_seq
START WITH 1 INCREMENT BY 1;	

/* 회원 */
CREATE TABLE member (
	m_id VARCHAR(30) NOT NULL, /* 회원아이디 */
	m_name VARCHAR(16), /* 이름 */
	m_pass VARCHAR(30), /* 비밀번호 */
	m_birth DATE, /* 생년월일 */
	m_gender VARCHAR(4), /* 성별 */
	m_login_type VARCHAR2(16) /* 로그인종류 */
);

CREATE UNIQUE INDEX member_m_id_pk
	ON member (
		m_id ASC
	);

ALTER TABLE member
	ADD
		CONSTRAINT member_m_id_pk
		PRIMARY KEY (
			m_id
		);

/* 그룹 */
CREATE TABLE pgroup (
	g_id NUMBER NOT NULL, /* 그룹아이디 */
	m_id VARCHAR(30) /* 회원아이디 */
);

CREATE UNIQUE INDEX pgroup_g_id_pk
	ON pgroup (
		g_id ASC
	);

ALTER TABLE pgroup
	ADD
		CONSTRAINT pgroup_g_id_pk
		PRIMARY KEY (
			g_id
		);

/* 플래너 */
CREATE TABLE planner (
	p_id NUMBER NOT NULL, /* 플래너아이디 */
	g_id NUMBER NOT NULL, /* 그룹아이디 */
	p_subject VARCHAR2(30), /* 플래너제목 */
	start_day VARCHAR2(30), /* 시작날짜 */
	end_day VARCHAR2(30), /* 종료날짜 */
	p_img VARCHAR2(30), /* 플래너이미지 */
	p_public NUMBER, /* 공개여부 */
	likes NUMBER, /* 좋아요 */
	complete NUMBER, /* 완성여부 */
	m_id VARCHAR(30), /* 회원아이디 */
	m_name VARCHAR2(16) /* 이름 */
);

CREATE UNIQUE INDEX planner_p_id_pk
	ON planner (
		p_id ASC
	);

ALTER TABLE planner
	ADD
		CONSTRAINT planner_p_id_pk
		PRIMARY KEY (
			p_id
		);

/* 일반댓글 */
CREATE TABLE public_comment (
	c_id NUMBER NOT NULL, /* 댓글번호 */
	m_id VARCHAR(30), /* 회원아이디 */
	m_name VARCHAR(16),
	p_id NUMBER, /* 플래너아이디 */
	c_content CLOB, /* 내용 */
	c_date DATE /* 날짜 */
);

CREATE UNIQUE INDEX PK_public_comment
	ON public_comment (
		c_id ASC
	);

ALTER TABLE public_comment
	ADD
		CONSTRAINT PK_public_comment
		PRIMARY KEY (
			c_id
		);

/* 친구목록 */
CREATE TABLE friend_list (
	fl_id NUMBER NOT NULL, /* 일련번호 */
	m_id VARCHAR(30) NOT NULL, /* 회원아이디 */
	f_id VARCHAR2(30) NOT NULL, /* 친구아이디 */
	f_name VARCHAR2(30) /* 친구이름 */
);

CREATE UNIQUE INDEX PK_friend_list
	ON friend_list (
		fl_id ASC
	);

ALTER TABLE friend_list
	ADD
		CONSTRAINT PK_friend_list
		PRIMARY KEY (
			fl_id
		);

/* 그룹원 */
CREATE TABLE groupmembers (
	g_id NUMBER NOT NULL, /* 그룹아이디 */
	m_id VARCHAR(30) NOT NULL /* 회원아이디 */
);

CREATE UNIQUE INDEX PK_g_members
	ON groupmembers (
		g_id ASC,
		m_id ASC
	);

ALTER TABLE groupmembers
	ADD
		CONSTRAINT PK_g_members
		PRIMARY KEY (
			g_id,
			m_id
		);

/* 친구신청 */
CREATE TABLE friend_request (
	fr_id NUMBER NOT NULL, /* 쪽지번호 */
	m_id VARCHAR(30), /* 회원아이디 */
	from_id VARCHAR2(30), /* 보낸회원 */
	from_name VARCHAR2(30), /* 보낸회원이름 */
	fr_date DATE, /* 보낸날짜 */
	fr_check VARCHAR2(2), /* 승락여부 */
	fr_content VARCHAR2(200) /* 내용 */
);

CREATE UNIQUE INDEX PK_friend_request
	ON friend_request (
		fr_id ASC
	);

ALTER TABLE friend_request
	ADD
		CONSTRAINT PK_friend_request
		PRIMARY KEY (
			fr_id
		);

/* 일별 플래너 */
CREATE TABLE day_plan (
	p_id NUMBER NOT NULL, /* 플래너아이디 */
	dp_date VARCHAR2(30), /* 날짜 */
	dp_memo VARCHAR2(300), /* 메모 */
	dp_lodgment VARCHAR2(50), /* 숙박 */
	dp_transportation VARCHAR2(50) /* 교통 */
);

/* 일별경로 */
CREATE TABLE day_route (
	p_id NUMBER, /* 플래너아이디 */
	dr_date VARCHAR2(20), /* 날짜 */
	dr_order NUMBER, /* 순서 */
	dr_location VARCHAR2(300), /* 지역 */
	dr_lat NUMBER, /* 위도 */
	dr_lng NUMBER /* 경도 */
);

/* 그룹댓글 */
CREATE TABLE group_comment (
	gc_id NUMBER NOT NULL, /* 번호 */
	g_id NUMBER, /* 그룹아이디 */
	p_id NUMBER, /* 플래너아이디 */
	m_id VARCHAR2(30), /* 회원아이디 */
	m_name VARCHAR2(16), /* 이름 */
	gc_content CLOB, /* 내용 */
	gc_date DATE /* 날짜 */
);

CREATE UNIQUE INDEX PK_group_comment
	ON group_comment (
		gc_id ASC
	);

ALTER TABLE group_comment
	ADD
		CONSTRAINT PK_group_comment
		PRIMARY KEY (
			gc_id
		);

/* 그룹초대 */
CREATE TABLE group_invitation (
	gi_id NUMBER NOT NULL, /* 쪽지번호 */
	g_id NUMBER, /* 그룹아이디 */
	m_id VARCHAR(30), /* 회원아이디 */
	m_name VARCHAR2(16), /* 회원이름 */
	to_id VARCHAR2(30), /* 보낸회원 */
	gi_date DATE, /* 보낸날짜 */
	gi_check VARCHAR2(2), /* 승락여부 */
	gi_content VARCHAR2(200), /* 내용 */
	p_subject VARCHAR(30), /* 플래너제목 */
	p_img VARCHAR(30) /* 플래너이미지 */
);

CREATE UNIQUE INDEX PK_group_invitation
	ON group_invitation (
		gi_id ASC
	);

ALTER TABLE group_invitation
	ADD
		CONSTRAINT PK_group_invitation
		PRIMARY KEY (
			gi_id
		);

/* 좋아요 */
CREATE TABLE likes (
	p_id NUMBER, /* 플래너아이디 */
	m_id VARCHAR(30) /* 회원아이디 */
);

/* 새 테이블 */
CREATE TABLE admin_select_planner (
	p_id NUMBER /* 플래너아이디 */
);

ALTER TABLE pgroup
	ADD
		CONSTRAINT FK_member_TO_pgroup
		FOREIGN KEY (
			m_id
		)
		REFERENCES member (
			m_id
		);

ALTER TABLE planner
	ADD
		CONSTRAINT FK_pgroup_TO_planner
		FOREIGN KEY (
			g_id
		)
		REFERENCES pgroup (
			g_id
		);

ALTER TABLE planner
	ADD
		CONSTRAINT FK_member_TO_planner
		FOREIGN KEY (
			m_id
		)
		REFERENCES member (
			m_id
		);

ALTER TABLE public_comment
	ADD
		CONSTRAINT FK_planner_TO_public_comment
		FOREIGN KEY (
			p_id
		)
		REFERENCES planner (
			p_id
		);

ALTER TABLE public_comment
	ADD
		CONSTRAINT FK_member_TO_public_comment
		FOREIGN KEY (
			m_id
		)
		REFERENCES member (
			m_id
		);

ALTER TABLE friend_list
	ADD
		CONSTRAINT FK_member_TO_friend_list
		FOREIGN KEY (
			m_id
		)
		REFERENCES member (
			m_id
		);

ALTER TABLE groupmembers
	ADD
		CONSTRAINT FK_pgroup_TO_groupmembers
		FOREIGN KEY (
			g_id
		)
		REFERENCES pgroup (
			g_id
		);

ALTER TABLE groupmembers
	ADD
		CONSTRAINT FK_member_TO_groupmembers
		FOREIGN KEY (
			m_id
		)
		REFERENCES member (
			m_id
		);

ALTER TABLE friend_request
	ADD
		CONSTRAINT FK_member_TO_friend_request
		FOREIGN KEY (
			m_id
		)
		REFERENCES member (
			m_id
		);

ALTER TABLE day_plan
	ADD
		CONSTRAINT FK_planner_TO_day_plan
		FOREIGN KEY (
			p_id
		)
		REFERENCES planner (
			p_id
		);

ALTER TABLE day_route
	ADD
		CONSTRAINT FK_planner_TO_day_route
		FOREIGN KEY (
			p_id
		)
		REFERENCES planner (
			p_id
		);

ALTER TABLE group_comment
	ADD
		CONSTRAINT FK_pgroup_TO_group_comment
		FOREIGN KEY (
			g_id
		)
		REFERENCES pgroup (
			g_id
		);

ALTER TABLE group_comment
	ADD
		CONSTRAINT FK_planner_TO_group_comment
		FOREIGN KEY (
			p_id
		)
		REFERENCES planner (
			p_id
		);

ALTER TABLE group_invitation
	ADD
		CONSTRAINT FK_g_members_TO_g_invitation
		FOREIGN KEY (
			g_id,
			m_id
		)
		REFERENCES groupmembers (
			g_id,
			m_id
		);

ALTER TABLE likes
	ADD
		CONSTRAINT FK_planner_TO_likes
		FOREIGN KEY (
			p_id
		)
		REFERENCES planner (
			p_id
		);

ALTER TABLE likes
	ADD
		CONSTRAINT FK_member_TO_likes
		FOREIGN KEY (
			m_id
		)
		REFERENCES member (
			m_id
		);

ALTER TABLE admin_select_planner
	ADD
		CONSTRAINT FK_plan_TO_admin_sel_plann
		FOREIGN KEY (
			p_id
		)
		REFERENCES planner (
			p_id
		);