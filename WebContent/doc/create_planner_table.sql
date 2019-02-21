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

/* ȸ�� */
DROP TABLE member 
	CASCADE CONSTRAINTS;

/* �׷� */
DROP TABLE pgroup 
	CASCADE CONSTRAINTS;

/* �÷��� */
DROP TABLE planner 
	CASCADE CONSTRAINTS;

/* �Ϲݴ�� */
DROP TABLE public_comment 
	CASCADE CONSTRAINTS;

/* ģ����� */
DROP TABLE friend_list 
	CASCADE CONSTRAINTS;

/* �׷�� */
DROP TABLE groupmembers 
	CASCADE CONSTRAINTS;

/* ģ����û */
DROP TABLE friend_request 
	CASCADE CONSTRAINTS;

/* �Ϻ� �÷��� */
DROP TABLE day_plan 
	CASCADE CONSTRAINTS;

/* �Ϻ���� */
DROP TABLE day_route 
	CASCADE CONSTRAINTS;

/* �׷��� */
DROP TABLE group_comment 
	CASCADE CONSTRAINTS;

/* �׷��ʴ� */
DROP TABLE group_invitation 
	CASCADE CONSTRAINTS;

/* ���ƿ� */
DROP TABLE likes 
	CASCADE CONSTRAINTS;

/* �� ���̺� */
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

/* ȸ�� */
CREATE TABLE member (
	m_id VARCHAR(30) NOT NULL, /* ȸ�����̵� */
	m_name VARCHAR(16), /* �̸� */
	m_pass VARCHAR(30), /* ��й�ȣ */
	m_birth DATE, /* ������� */
	m_gender VARCHAR(4), /* ���� */
	m_login_type VARCHAR2(16) /* �α������� */
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

/* �׷� */
CREATE TABLE pgroup (
	g_id NUMBER NOT NULL, /* �׷���̵� */
	m_id VARCHAR(30) /* ȸ�����̵� */
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

/* �÷��� */
CREATE TABLE planner (
	p_id NUMBER NOT NULL, /* �÷��ʾ��̵� */
	g_id NUMBER NOT NULL, /* �׷���̵� */
	p_subject VARCHAR2(30), /* �÷������� */
	start_day VARCHAR2(30), /* ���۳�¥ */
	end_day VARCHAR2(30), /* ���ᳯ¥ */
	p_img VARCHAR2(30), /* �÷����̹��� */
	p_public NUMBER, /* �������� */
	likes NUMBER, /* ���ƿ� */
	complete NUMBER, /* �ϼ����� */
	m_id VARCHAR(30), /* ȸ�����̵� */
	m_name VARCHAR2(16) /* �̸� */
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

/* �Ϲݴ�� */
CREATE TABLE public_comment (
	c_id NUMBER NOT NULL, /* ��۹�ȣ */
	m_id VARCHAR(30), /* ȸ�����̵� */
	m_name VARCHAR(16),
	p_id NUMBER, /* �÷��ʾ��̵� */
	c_content CLOB, /* ���� */
	c_date DATE /* ��¥ */
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

/* ģ����� */
CREATE TABLE friend_list (
	fl_id NUMBER NOT NULL, /* �Ϸù�ȣ */
	m_id VARCHAR(30) NOT NULL, /* ȸ�����̵� */
	f_id VARCHAR2(30) NOT NULL, /* ģ�����̵� */
	f_name VARCHAR2(30) /* ģ���̸� */
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

/* �׷�� */
CREATE TABLE groupmembers (
	g_id NUMBER NOT NULL, /* �׷���̵� */
	m_id VARCHAR(30) NOT NULL /* ȸ�����̵� */
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

/* ģ����û */
CREATE TABLE friend_request (
	fr_id NUMBER NOT NULL, /* ������ȣ */
	m_id VARCHAR(30), /* ȸ�����̵� */
	from_id VARCHAR2(30), /* ����ȸ�� */
	from_name VARCHAR2(30), /* ����ȸ���̸� */
	fr_date DATE, /* ������¥ */
	fr_check VARCHAR2(2), /* �¶����� */
	fr_content VARCHAR2(200) /* ���� */
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

/* �Ϻ� �÷��� */
CREATE TABLE day_plan (
	p_id NUMBER NOT NULL, /* �÷��ʾ��̵� */
	dp_date VARCHAR2(30), /* ��¥ */
	dp_memo VARCHAR2(300), /* �޸� */
	dp_lodgment VARCHAR2(50), /* ���� */
	dp_transportation VARCHAR2(50) /* ���� */
);

/* �Ϻ���� */
CREATE TABLE day_route (
	p_id NUMBER, /* �÷��ʾ��̵� */
	dr_date VARCHAR2(20), /* ��¥ */
	dr_order NUMBER, /* ���� */
	dr_location VARCHAR2(300), /* ���� */
	dr_lat NUMBER, /* ���� */
	dr_lng NUMBER /* �浵 */
);

/* �׷��� */
CREATE TABLE group_comment (
	gc_id NUMBER NOT NULL, /* ��ȣ */
	g_id NUMBER, /* �׷���̵� */
	p_id NUMBER, /* �÷��ʾ��̵� */
	m_id VARCHAR2(30), /* ȸ�����̵� */
	m_name VARCHAR2(16), /* �̸� */
	gc_content CLOB, /* ���� */
	gc_date DATE /* ��¥ */
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

/* �׷��ʴ� */
CREATE TABLE group_invitation (
	gi_id NUMBER NOT NULL, /* ������ȣ */
	g_id NUMBER, /* �׷���̵� */
	m_id VARCHAR(30), /* ȸ�����̵� */
	m_name VARCHAR2(16), /* ȸ���̸� */
	to_id VARCHAR2(30), /* ����ȸ�� */
	gi_date DATE, /* ������¥ */
	gi_check VARCHAR2(2), /* �¶����� */
	gi_content VARCHAR2(200), /* ���� */
	p_subject VARCHAR(30), /* �÷������� */
	p_img VARCHAR(30) /* �÷����̹��� */
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

/* ���ƿ� */
CREATE TABLE likes (
	p_id NUMBER, /* �÷��ʾ��̵� */
	m_id VARCHAR(30) /* ȸ�����̵� */
);

/* �� ���̺� */
CREATE TABLE admin_select_planner (
	p_id NUMBER /* �÷��ʾ��̵� */
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