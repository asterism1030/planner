
-- ȸ�����

insert into member(m_id, m_name, m_pass, m_birth, m_gender, m_login_type)
values('admin@naver.com', '������', '1234', '19901108', '��', 'general');

insert into member(m_id, m_name, m_pass, m_birth, m_gender, m_login_type)
values('guswl@naver.com', '������', '1234', '19941010', '��', 'general');

insert into member(m_id, m_name, m_pass, m_birth, m_gender, m_login_type)
values('ghkvud2@naver.com', '��ȭ��', '1234', '19901108', '��', 'general');

insert into member(m_id, m_name, m_pass, m_birth, m_gender, m_login_type)
values('gksrlf@naver.com', '���ѱ�', '1234', '19920703', '��', 'general');

insert into member(m_id, m_name, m_pass, m_birth, m_gender, m_login_type)
values('dbsgml@naver.com', '������', '1234', '19930309', '��', 'general');

insert into member(m_id, m_name, m_pass, m_birth, m_gender, m_login_type)
values('qudwls@naver.com', '������', '1234', '19900509', '��', 'general');

insert into member(m_id, m_name, m_pass, m_birth, m_gender, m_login_type)
values('tkddbs@naver.com', '�Ż���', '1234', '19910108', '��', 'general');

insert into member(m_id, m_name, m_pass, m_birth, m_gender, m_login_type)
values('gydls@naver.com', '��ȿ��', '1234', '19910108', '��', 'general');





insert into member(m_id, m_name, m_pass, m_birth, m_gender, m_login_type)
values('sg6321@naver.com', '������', '1234', '19901018', '��', 'general');

insert into member(m_id, m_name, m_pass, m_birth, m_gender, m_login_type)
values('guswns@naver.com', '������', '1234', '19901018', '��', 'general');

insert into member(m_id, m_name, m_pass, m_birth, m_gender, m_login_type)
values('wnsrb@naver.com', '���ر�', '1234', '19901018', '��', 'general');

insert into member(m_id, m_name, m_pass, m_birth, m_gender, m_login_type)
values('dnjswls@naver.com', '�ڿ���', '1234', '19901018', '��', 'general');



commit;


-- ȸ�� �� ģ�����

insert into friend_list(fl_id, m_id, f_id, f_name)
values(friend_list_fl_id_seq.nextval, 'guswl@naver.com', 'ghkvud2@naver.com', '��ȭ��');

insert into friend_list(fl_id, m_id, f_id, f_name)
values(friend_list_fl_id_seq.nextval, 'ghkvud2@naver.com', 'guswl@naver.com', '������');



insert into friend_list(fl_id, m_id, f_id, f_name)
values(friend_list_fl_id_seq.nextval, 'ghkvud2@naver.com', 'tkddbs@naver.com', '�Ż���');

insert into friend_list(fl_id, m_id, f_id, f_name)
values(friend_list_fl_id_seq.nextval, 'tkddbs@naver.com', 'ghkvud2@naver.com', '��ȭ��');



insert into friend_list(fl_id, m_id, f_id, f_name)
values(friend_list_fl_id_seq.nextval, 'ghkvud2@naver.com', 'gksrlf@naver.com', '���ѱ�');

insert into friend_list(fl_id, m_id, f_id, f_name)
values(friend_list_fl_id_seq.nextval, 'gksrlf@naver.com', 'ghkvud2@naver.com', '��ȭ��');



insert into friend_list(fl_id, m_id, f_id, f_name)
values(friend_list_fl_id_seq.nextval, 'ghkvud2@naver.com', 'qudwls@naver.com', '������');

insert into friend_list(fl_id, m_id, f_id, f_name)
values(friend_list_fl_id_seq.nextval, 'qudwls@naver.com', 'ghkvud2@naver.com', '��ȭ��');



insert into friend_list(fl_id, m_id, f_id, f_name)
values(friend_list_fl_id_seq.nextval, 'ghkvud2@naver.com', 'dbsgml@naver.com', '������');

insert into friend_list(fl_id, m_id, f_id, f_name)
values(friend_list_fl_id_seq.nextval, 'dbsgml@naver.com', 'ghkvud2@naver.com', '��ȭ��');



insert into friend_list(fl_id, m_id, f_id, f_name)
values(friend_list_fl_id_seq.nextval, 'ghkvud2@naver.com', 'gksrlf@naver.com', '���ѱ�');

insert into friend_list(fl_id, m_id, f_id, f_name)
values(friend_list_fl_id_seq.nextval, 'gksrlf@naver.com', 'ghkvud2@naver.com', '��ȭ��');


insert into friend_list(fl_id, m_id, f_id, f_name)
values(friend_list_fl_id_seq.nextval, 'ghkvud2@naver.com', 'gydls@naver.com', '��ȿ��');

insert into friend_list(fl_id, m_id, f_id, f_name)
values(friend_list_fl_id_seq.nextval, 'gydls@naver.com', 'ghkvud2@naver.com', '��ȭ��');


commit;


-- ģ�� ��û

insert into friend_request(fr_id, m_id, from_id, from_name, fr_date, fr_check, fr_content)
values(friend_request_fr_id_seq.nextval, 'ghkvud2@naver.com', 'sg6321@naver.com', '������', sysdate, 'n', '�޾ƶ� ģ��');


insert into friend_request(fr_id, m_id, from_id, from_name, fr_date, fr_check, fr_content)
values(friend_request_fr_id_seq.nextval, 'ghkvud2@naver.com', 'dnjswls@naver.com', '�ڿ���', sysdate, 'n', 'ȭ���~ģ����û�޾���');


insert into friend_request(fr_id, m_id, from_id, from_name, fr_date, fr_check, fr_content)
values(friend_request_fr_id_seq.nextval, 'ghkvud2@naver.com', 'wnsrb@naver.com', '���ر�', sysdate, 'n', 'ģ����û�Դϴ�.');


insert into friend_request(fr_id, m_id, from_id, from_name, fr_date, fr_check, fr_content)
values(friend_request_fr_id_seq.nextval, 'ghkvud2@naver.com', 'guswns@naver.com', '������', sysdate, 'n', '��û�޾���');

insert into friend_request(fr_id, m_id, from_id, from_name, fr_date, fr_check, fr_content)
values(friend_request_fr_id_seq.nextval, 'gydls@naver.com', 'ghkvud2@naver.com', '��ȭ��', sysdate, 'n', '������.. ģ�� ��Ź�帳�ϴ�.');


commit;



insert into pgroup(g_id, m_id)
values(pgroup_g_id_seq.nextval, 'ghkvud2@naver.com');

insert into groupmembers(g_id, m_id)
values(pgroup_g_id_seq.currval, 'ghkvud2@naver.com');

insert into planner(p_id, g_id, p_subject, start_day, end_day, p_img, p_public, likes, complete, m_id, m_name)
values(planner_p_id_seq.nextval, pgroup_g_id_seq.currval, '�����̿� ���� ����', '2016-10-24', '2016-10-26', 'a2', 1, 5, '0', 'ghkvud2@naver.com', '��ȭ��');

insert into likes(p_id, m_id)
values(planner_p_id_seq.currval, 'ghkvud2@naver.com');

insert into admin_select_planner(p_id)
values(planner_p_id_seq.currval);


insert into day_plan(p_id, dp_date, dp_memo, dp_lodgment, dp_transportation)
values(planner_p_id_seq.currval, '2016-10-24', '�λ� �ؿ�� ��ó ���� �˾ƺ� ��', '�ؿ�� ���� 202ȣ', '�λ꿪���� KTX');

insert into day_plan(p_id, dp_date, dp_memo, dp_lodgment, dp_transportation)
values(planner_p_id_seq.currval, '2016-10-25', '���������� ���ϴ� ���ر� ������', '���ر� ���ÿ��� �� ����', '���������� ����');

insert into day_plan(p_id, dp_date, dp_memo, dp_lodgment, dp_transportation)
values(planner_p_id_seq.currval, '2016-10-26', '������ ��', '', '���￪���� KTX');





insert into pgroup(g_id, m_id)
values(pgroup_g_id_seq.nextval, 'ghkvud2@naver.com');

insert into groupmembers(g_id, m_id)
values(pgroup_g_id_seq.currval, 'ghkvud2@naver.com');

insert into planner(p_id, g_id, p_subject, start_day, end_day, p_img, p_public, likes, complete, m_id, m_name)
values(planner_p_id_seq.nextval, pgroup_g_id_seq.currval, '���� ��ⷯ ���� ������', '2016-10-15', '2016-10-16', 'a3', 1, 3, '0', 'ghkvud2@naver.com', '��ȭ��');

insert into likes(p_id, m_id)
values(planner_p_id_seq.currval, 'ghkvud2@naver.com');



commit;




insert into pgroup(g_id, m_id)
values(pgroup_g_id_seq.nextval, 'gksrlf@naver.com');

insert into groupmembers(g_id, m_id)
values(pgroup_g_id_seq.currval, 'gksrlf@naver.com');

insert into planner(p_id, g_id, p_subject, start_day, end_day, p_img, p_public, likes, complete, m_id, m_name)
values(planner_p_id_seq.nextval, pgroup_g_id_seq.currval, '������Ʈ ���� ��� ����!', '2016-10-15', '2016-10-18', 'a3', 1, 5, '0', 'gksrlf@naver.com', '���ѱ�');

insert into group_invitation(gi_id, g_id, m_id, m_name, to_id, gi_date, gi_check, gi_content, p_subject, p_img)
values(group_invitation_gi_id_seq.nextval, pgroup_g_id_seq.currval, 'gksrlf@naver.com', '���ѱ�', 'ghkvud2@naver.com', sysdate, 'n', 'ȭ������ ���� ���', '������Ʈ ���� ��� ����!','a3');

insert into admin_select_planner(p_id)
values(planner_p_id_seq.currval);


commit;


insert into pgroup(g_id, m_id)
values(pgroup_g_id_seq.nextval, 'guswl@naver.com');

insert into groupmembers(g_id, m_id)
values(pgroup_g_id_seq.currval, 'guswl@naver.com');

insert into planner(p_id, g_id, p_subject, start_day, end_day, p_img, p_public, likes, complete, m_id, m_name)
values(planner_p_id_seq.nextval, pgroup_g_id_seq.currval, '���������� �������', '2016-10-22', '2016-10-23', 'a4', 1, 5, '0', 'guswl@naver.com', '������');

insert into likes(p_id, m_id)
values(planner_p_id_seq.currval, 'ghkvud2@naver.com');

insert into group_invitation(gi_id, g_id, m_id, m_name, to_id, gi_date, gi_check, gi_content, p_subject, p_img)
values(group_invitation_gi_id_seq.nextval, pgroup_g_id_seq.currval, 'guswl@naver.com', '������', 'ghkvud2@naver.com', sysdate, 'n', 'ȭ����� ������ ���ּ���', '���������� �������','a4');


commit;


insert into pgroup(g_id, m_id)
values(pgroup_g_id_seq.nextval, 'qudwls@naver.com');

insert into groupmembers(g_id, m_id)
values(pgroup_g_id_seq.currval, 'qudwls@naver.com');

insert into planner(p_id, g_id, p_subject, start_day, end_day, p_img, p_public, likes, complete, m_id, m_name)
values(planner_p_id_seq.nextval, pgroup_g_id_seq.currval, '�λ꿡�� �� ����!', '2016-10-15', '2016-10-18', 'a2', 1, 2, '0', 'qudwls@naver.com', '������');

insert into likes(p_id, m_id)
values(planner_p_id_seq.currval, 'ghkvud2@naver.com');

insert into group_invitation(gi_id, g_id, m_id, m_name, to_id, gi_date, gi_check, gi_content, p_subject, p_img)
values(group_invitation_gi_id_seq.nextval, pgroup_g_id_seq.currval, 'qudwls@naver.com', '������', 'ghkvud2@naver.com', sysdate, 'n', 'ȭ��� �λ� �� ����!!!', '�λ꿡�� �� ����!','a2');

commit;



insert into pgroup(g_id, m_id)
values(pgroup_g_id_seq.nextval, 'qudwls@naver.com');

insert into groupmembers(g_id, m_id)
values(pgroup_g_id_seq.currval, 'qudwls@naver.com');

insert into planner(p_id, g_id, p_subject, start_day, end_day, p_img, p_public, likes, complete, m_id, m_name)
values(planner_p_id_seq.nextval, pgroup_g_id_seq.currval, '���ֵ� 2��3��!!', '2016-10-10', '2016-10-13', 'a8', 1, 2, '0', 'qudwls@naver.com', '������');

insert into group_invitation(gi_id, g_id, m_id, m_name, to_id, gi_date, gi_check, gi_content, p_subject, p_img)
values(group_invitation_gi_id_seq.nextval, pgroup_g_id_seq.currval, 'qudwls@naver.com', '������', 'ghkvud2@naver.com', sysdate, 'n', '���ֵ� ��ä�� ����~', '���ֵ� 2��3��!!','a8');


commit;


insert into pgroup(g_id, m_id)
values(pgroup_g_id_seq.nextval, 'dbsgml@naver.com');

insert into groupmembers(g_id, m_id)
values(pgroup_g_id_seq.currval, 'dbsgml@naver.com');

insert into planner(p_id, g_id, p_subject, start_day, end_day, p_img, p_public, likes, complete, m_id, m_name)
values(planner_p_id_seq.nextval, pgroup_g_id_seq.currval, '���� �������鼭', '2016-10-03', '2016-10-05', 'a7', 1, 1, '0', 'dbsgml@naver.com', '������');



commit;


insert into pgroup(g_id, m_id)
values(pgroup_g_id_seq.nextval, 'tkddbs@naver.com');

insert into groupmembers(g_id, m_id)
values(pgroup_g_id_seq.currval, 'tkddbs@naver.com');

insert into planner(p_id, g_id, p_subject, start_day, end_day, p_img, p_public, likes, complete, m_id, m_name)
values(planner_p_id_seq.nextval, pgroup_g_id_seq.currval, '������ ��������', '2016-09-05', '2016-09-18', 'a10', 1, 2, '0', 'tkddbs@naver.com', '�Ż���');



commit;


insert into pgroup(g_id, m_id)
values(pgroup_g_id_seq.nextval, 'dbsgml@naver.com');

insert into groupmembers(g_id, m_id)
values(pgroup_g_id_seq.currval, 'dbsgml@naver.com');

insert into planner(p_id, g_id, p_subject, start_day, end_day, p_img, p_public, likes, complete, m_id, m_name)
values(planner_p_id_seq.nextval, pgroup_g_id_seq.currval, '�λ꿩�� ���׻���', '2016-10-10', '2016-10-13', 'a8', 1, 2, '0', 'dbsgml@naver.com', '������');



commit;


insert into pgroup(g_id, m_id)
values(pgroup_g_id_seq.nextval, 'dbsgml@naver.com');

insert into groupmembers(g_id, m_id)
values(pgroup_g_id_seq.currval, 'dbsgml@naver.com');

insert into planner(p_id, g_id, p_subject, start_day, end_day, p_img, p_public, likes, complete, m_id, m_name)
values(planner_p_id_seq.nextval, pgroup_g_id_seq.currval, 'ĳ���� ��� ����!', '2016-10-10', '2016-10-13', 'a3', 1, 2, '0', 'dbsgml@naver.com', '������');

commit;



insert into pgroup(g_id, m_id)
values(pgroup_g_id_seq.nextval, 'dbsgml@naver.com');

insert into groupmembers(g_id, m_id)
values(pgroup_g_id_seq.currval, 'dbsgml@naver.com');

insert into planner(p_id, g_id, p_subject, start_day, end_day, p_img, p_public, likes, complete, m_id, m_name)
values(planner_p_id_seq.nextval, pgroup_g_id_seq.currval, 'ĳ���� ��� ����!', '2016-10-10', '2016-10-27', 'a2', 1, 2, '0', 'dbsgml@naver.com', '������');


commit;



insert into pgroup(g_id, m_id)
values(pgroup_g_id_seq.nextval, 'tkddbs@naver.com');

insert into groupmembers(g_id, m_id)
values(pgroup_g_id_seq.currval, 'tkddbs@naver.com');

insert into planner(p_id, g_id, p_subject, start_day, end_day, p_img, p_public, likes, complete, m_id, m_name)
values(planner_p_id_seq.nextval, pgroup_g_id_seq.currval, '���� ����!', '2016-09-05', '2016-09-18', 'a1', 1, 2, '0', 'tkddbs@naver.com', '�Ż���');


commit;



insert into pgroup(g_id, m_id)
values(pgroup_g_id_seq.nextval, 'qudwls@naver.com');

insert into groupmembers(g_id, m_id)
values(pgroup_g_id_seq.currval, 'qudwls@naver.com');

insert into planner(p_id, g_id, p_subject, start_day, end_day, p_img, p_public, likes, complete, m_id, m_name)
values(planner_p_id_seq.nextval, pgroup_g_id_seq.currval, '������ ���డ��!!', '2016-10-02', '2016-10-13', 'a8', 1, 2, '0', 'qudwls@naver.com', '������');

commit;


insert into pgroup(g_id, m_id)
values(pgroup_g_id_seq.nextval, 'guswl@naver.com');

insert into groupmembers(g_id, m_id)
values(pgroup_g_id_seq.currval, 'guswl@naver.com');

insert into planner(p_id, g_id, p_subject, start_day, end_day, p_img, p_public, likes, complete, m_id, m_name)
values(planner_p_id_seq.nextval, pgroup_g_id_seq.currval, '�Ƹ��ٿ� ��������~', '2016-09-02', '2016-09-20', 'a8', 1, 2, '0', 'guswl@naver.com', '������');

commit;








-- pgroup // groupmembers // planner

insert into pgroup(g_id, m_id)
values(pgroup_g_id_seq.nextval, 'ghkvud2@naver.com');

insert into groupmembers(g_id, m_id)
values(pgroup_g_id_seq.currval, 'ghkvud2@naver.com');


insert into groupmembers(g_id, m_id)
values(pgroup_g_id_seq.currval, 'guswl@naver.com');

insert into groupmembers(g_id, m_id)
values(pgroup_g_id_seq.currval, 'gksrlf@naver.com');

insert into groupmembers(g_id, m_id)
values(pgroup_g_id_seq.currval, 'tkddbs@naver.com');

insert into groupmembers(g_id, m_id)
values(pgroup_g_id_seq.currval, 'qudwls@naver.com');

insert into groupmembers(g_id, m_id)
values(pgroup_g_id_seq.currval, 'dbsgml@naver.com');



insert into group_comment(gc_id, g_id, p_id, m_id, m_name, gc_content, gc_date)
values(group_comment_gc_id_seq.nextval, pgroup_g_id_seq.currval, planner_p_id_seq.currval, 'ghkvud2@naver.com', '��ȭ��', 'NCS 1�� ������ �����? ', sysdate);

insert into group_comment(gc_id, g_id, p_id, m_id, m_name, gc_content, gc_date)
values(group_comment_gc_id_seq.nextval, pgroup_g_id_seq.currval, planner_p_id_seq.currval, 'gksrlf@naver.com', '���ѱ�', '���� �� ���ƿ� ��', sysdate);

insert into group_comment(gc_id, g_id, p_id, m_id, m_name, gc_content, gc_date)
values(group_comment_gc_id_seq.nextval, pgroup_g_id_seq.currval, planner_p_id_seq.currval, 'guswl@naver.com', '������', '���عٴ� ��ó�� ���? ���ʳ� ����', sysdate);

insert into group_comment(gc_id, g_id, p_id, m_id, m_name, gc_content, gc_date)
values(group_comment_gc_id_seq.nextval, pgroup_g_id_seq.currval, planner_p_id_seq.currval, 'ghkvud2@naver.com', '��ȭ��', '������ �ʰ� �����ϴ� ��Ʈ �� �� �����غ� ������', sysdate);

insert into group_comment(gc_id, g_id, p_id, m_id, m_name, gc_content, gc_date)
values(group_comment_gc_id_seq.nextval, pgroup_g_id_seq.currval, planner_p_id_seq.currval, 'guswl@naver.com', '������', '�� ���� ���� �����߾�� ���� �� ���ַ�!!', sysdate);

insert into group_comment(gc_id, g_id, p_id, m_id, m_name, gc_content, gc_date)
values(group_comment_gc_id_seq.nextval, pgroup_g_id_seq.currval, planner_p_id_seq.currval, 'tkddbs@naver.com', '�Ż���', '���� ���� ����!! ����!', sysdate);

insert into planner(p_id, g_id, p_subject, start_day, end_day, p_img, p_public, likes, complete, m_id, m_name)
values(planner_p_id_seq.nextval, pgroup_g_id_seq.currval,  '���� ������ KITRI ����~', '2016-10-27', '2016-10-29', 'a1', 1, 10, '1', 'ghkvud2@naver.com', '��ȭ��');



insert into admin_select_planner(p_id)
values(planner_p_id_seq.currval);

-- ù �� ( ���� -> ���� )
insert into day_route(p_id, dr_date, dr_order, dr_location, dr_lat, dr_lng)
values(planner_p_id_seq.currval, '2016-10-27', 0, '����', 37.566299, 126.977737);

insert into day_route(p_id, dr_date, dr_order, dr_location, dr_lat, dr_lng)
values(planner_p_id_seq.currval, '2016-10-27', 1, '����', 38.206902,   128.591827);

-- ��° ��(����->����)

insert into day_route(p_id, dr_date, dr_order, dr_location, dr_lat, dr_lng)
values(planner_p_id_seq.currval, '2016-10-28', 0, '����', 38.206902,   128.591827);

insert into day_route(p_id, dr_date, dr_order, dr_location, dr_lat, dr_lng)
values(planner_p_id_seq.currval, '2016-10-28', 1, '����', 37.752072,   128.875959);


-- ��° ��(���� -> ����� -> ������ -> �� -> ����)

insert into day_route(p_id, dr_date, dr_order, dr_location, dr_lat, dr_lng)
values(planner_p_id_seq.currval, '2016-10-29', 1, '����', 37.752072,   128.875959);

insert into day_route(p_id, dr_date, dr_order, dr_location, dr_lat, dr_lng)
values(planner_p_id_seq.currval, '2016-10-29', 1, '�����', 38.124523   , 128.628059);

insert into day_route(p_id, dr_date, dr_order, dr_location, dr_lat, dr_lng)
values(planner_p_id_seq.currval, '2016-10-29', 1, '������', 37.805563, 128.908096);

insert into day_route(p_id, dr_date, dr_order, dr_location, dr_lat, dr_lng)
values(planner_p_id_seq.currval, '2016-10-29', 1, '��', 38.380538,   128.467753);

insert into day_route(p_id, dr_date, dr_order, dr_location, dr_lat, dr_lng)
values(planner_p_id_seq.currval, '2016-10-29', 1, '����', 37.566299,   126.977737);



insert into day_plan(p_id, dp_date, dp_memo, dp_lodgment, dp_transportation)
values(planner_p_id_seq.currval, '2016-10-27', '���� ù�� �Դϴ�. ��� ��� ���� �ϴ� �����������', '��� ȣ�� 102ȣ, 103ȣ', '���ʱ��� ���� �� �� ����');

insert into day_plan(p_id, dp_date, dp_memo, dp_lodgment, dp_transportation)
values(planner_p_id_seq.currval, '2016-10-28', '���� ��° �� �Դϴ�. �غ����� ��ƿ�', '���� ȣ�� 1102ȣ, 1103ȣ', '�������� ���� �� �� ����');

insert into day_plan(p_id, dp_date, dp_memo, dp_lodgment, dp_transportation)
values(planner_p_id_seq.currval, '2016-10-29', '������ �� �Դϴ�.', '', '����� �� ��, ������� ����');


commit;






















