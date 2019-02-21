-- 시퀀스 명명 규칙 
-- 테이블이름_pk이름_seq

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