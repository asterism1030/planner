
-- 회원등록

insert into member(m_id, m_name, m_pass, m_birth, m_gender, m_login_type)
values('admin@naver.com', '관리자', '1234', '19901108', '남', 'general');

insert into member(m_id, m_name, m_pass, m_birth, m_gender, m_login_type)
values('guswl@naver.com', '김현지', '1234', '19941010', '여', 'general');

insert into member(m_id, m_name, m_pass, m_birth, m_gender, m_login_type)
values('ghkvud2@naver.com', '이화평', '1234', '19901108', '남', 'general');

insert into member(m_id, m_name, m_pass, m_birth, m_gender, m_login_type)
values('gksrlf@naver.com', '이한길', '1234', '19920703', '남', 'general');

insert into member(m_id, m_name, m_pass, m_birth, m_gender, m_login_type)
values('dbsgml@naver.com', '김윤희', '1234', '19930309', '여', 'general');

insert into member(m_id, m_name, m_pass, m_birth, m_gender, m_login_type)
values('qudwls@naver.com', '유병진', '1234', '19900509', '남', 'general');

insert into member(m_id, m_name, m_pass, m_birth, m_gender, m_login_type)
values('tkddbs@naver.com', '신상윤', '1234', '19910108', '남', 'general');

insert into member(m_id, m_name, m_pass, m_birth, m_gender, m_login_type)
values('gydls@naver.com', '안효인', '1234', '19910108', '남', 'general');





insert into member(m_id, m_name, m_pass, m_birth, m_gender, m_login_type)
values('sg6321@naver.com', '조성국', '1234', '19901018', '남', 'general');

insert into member(m_id, m_name, m_pass, m_birth, m_gender, m_login_type)
values('guswns@naver.com', '김현준', '1234', '19901018', '남', 'general');

insert into member(m_id, m_name, m_pass, m_birth, m_gender, m_login_type)
values('wnsrb@naver.com', '최준규', '1234', '19901018', '남', 'general');

insert into member(m_id, m_name, m_pass, m_birth, m_gender, m_login_type)
values('dnjswls@naver.com', '박원진', '1234', '19901018', '남', 'general');



commit;


-- 회원 간 친구등록

insert into friend_list(fl_id, m_id, f_id, f_name)
values(friend_list_fl_id_seq.nextval, 'guswl@naver.com', 'ghkvud2@naver.com', '이화평');

insert into friend_list(fl_id, m_id, f_id, f_name)
values(friend_list_fl_id_seq.nextval, 'ghkvud2@naver.com', 'guswl@naver.com', '김현지');



insert into friend_list(fl_id, m_id, f_id, f_name)
values(friend_list_fl_id_seq.nextval, 'ghkvud2@naver.com', 'tkddbs@naver.com', '신상윤');

insert into friend_list(fl_id, m_id, f_id, f_name)
values(friend_list_fl_id_seq.nextval, 'tkddbs@naver.com', 'ghkvud2@naver.com', '이화평');



insert into friend_list(fl_id, m_id, f_id, f_name)
values(friend_list_fl_id_seq.nextval, 'ghkvud2@naver.com', 'gksrlf@naver.com', '이한길');

insert into friend_list(fl_id, m_id, f_id, f_name)
values(friend_list_fl_id_seq.nextval, 'gksrlf@naver.com', 'ghkvud2@naver.com', '이화평');



insert into friend_list(fl_id, m_id, f_id, f_name)
values(friend_list_fl_id_seq.nextval, 'ghkvud2@naver.com', 'qudwls@naver.com', '유병진');

insert into friend_list(fl_id, m_id, f_id, f_name)
values(friend_list_fl_id_seq.nextval, 'qudwls@naver.com', 'ghkvud2@naver.com', '이화평');



insert into friend_list(fl_id, m_id, f_id, f_name)
values(friend_list_fl_id_seq.nextval, 'ghkvud2@naver.com', 'dbsgml@naver.com', '김윤희');

insert into friend_list(fl_id, m_id, f_id, f_name)
values(friend_list_fl_id_seq.nextval, 'dbsgml@naver.com', 'ghkvud2@naver.com', '이화평');



insert into friend_list(fl_id, m_id, f_id, f_name)
values(friend_list_fl_id_seq.nextval, 'ghkvud2@naver.com', 'gksrlf@naver.com', '이한길');

insert into friend_list(fl_id, m_id, f_id, f_name)
values(friend_list_fl_id_seq.nextval, 'gksrlf@naver.com', 'ghkvud2@naver.com', '이화평');


insert into friend_list(fl_id, m_id, f_id, f_name)
values(friend_list_fl_id_seq.nextval, 'ghkvud2@naver.com', 'gydls@naver.com', '안효인');

insert into friend_list(fl_id, m_id, f_id, f_name)
values(friend_list_fl_id_seq.nextval, 'gydls@naver.com', 'ghkvud2@naver.com', '이화평');


commit;


-- 친구 신청

insert into friend_request(fr_id, m_id, from_id, from_name, fr_date, fr_check, fr_content)
values(friend_request_fr_id_seq.nextval, 'ghkvud2@naver.com', 'sg6321@naver.com', '조성국', sysdate, 'n', '받아라 친구');


insert into friend_request(fr_id, m_id, from_id, from_name, fr_date, fr_check, fr_content)
values(friend_request_fr_id_seq.nextval, 'ghkvud2@naver.com', 'dnjswls@naver.com', '박원진', sysdate, 'n', '화평아~친구신청받아줘');


insert into friend_request(fr_id, m_id, from_id, from_name, fr_date, fr_check, fr_content)
values(friend_request_fr_id_seq.nextval, 'ghkvud2@naver.com', 'wnsrb@naver.com', '최준규', sysdate, 'n', '친구신청입니다.');


insert into friend_request(fr_id, m_id, from_id, from_name, fr_date, fr_check, fr_content)
values(friend_request_fr_id_seq.nextval, 'ghkvud2@naver.com', 'guswns@naver.com', '김현준', sysdate, 'n', '신청받아줘');

insert into friend_request(fr_id, m_id, from_id, from_name, fr_date, fr_check, fr_content)
values(friend_request_fr_id_seq.nextval, 'gydls@naver.com', 'ghkvud2@naver.com', '이화평', sysdate, 'n', '선생님.. 친추 부탁드립니당.');


commit;



insert into pgroup(g_id, m_id)
values(pgroup_g_id_seq.nextval, 'ghkvud2@naver.com');

insert into groupmembers(g_id, m_id)
values(pgroup_g_id_seq.currval, 'ghkvud2@naver.com');

insert into planner(p_id, g_id, p_subject, start_day, end_day, p_img, p_public, likes, complete, m_id, m_name)
values(planner_p_id_seq.nextval, pgroup_g_id_seq.currval, '성국이와 우정 여행', '2016-10-24', '2016-10-26', 'a2', 1, 5, '0', 'ghkvud2@naver.com', '이화평');

insert into likes(p_id, m_id)
values(planner_p_id_seq.currval, 'ghkvud2@naver.com');

insert into admin_select_planner(p_id)
values(planner_p_id_seq.currval);


insert into day_plan(p_id, dp_date, dp_memo, dp_lodgment, dp_transportation)
values(planner_p_id_seq.currval, '2016-10-24', '부산 해운대 근처 맛집 알아볼 것', '해운대 모텔 202호', '부산역까지 KTX');

insert into day_plan(p_id, dp_date, dp_memo, dp_lodgment, dp_transportation)
values(planner_p_id_seq.currval, '2016-10-25', '거제도에서 일하는 최준규 만나러', '최준규 사택에서 잘 예정', '거제도까지 버스');

insert into day_plan(p_id, dp_date, dp_memo, dp_lodgment, dp_transportation)
values(planner_p_id_seq.currval, '2016-10-26', '마지막 날', '', '서울역까지 KTX');





insert into pgroup(g_id, m_id)
values(pgroup_g_id_seq.nextval, 'ghkvud2@naver.com');

insert into groupmembers(g_id, m_id)
values(pgroup_g_id_seq.currval, 'ghkvud2@naver.com');

insert into planner(p_id, g_id, p_subject, start_day, end_day, p_img, p_public, likes, complete, m_id, m_name)
values(planner_p_id_seq.nextval, pgroup_g_id_seq.currval, '고독을 즐기러 나는 떠난다', '2016-10-15', '2016-10-16', 'a3', 1, 3, '0', 'ghkvud2@naver.com', '이화평');

insert into likes(p_id, m_id)
values(planner_p_id_seq.currval, 'ghkvud2@naver.com');



commit;




insert into pgroup(g_id, m_id)
values(pgroup_g_id_seq.nextval, 'gksrlf@naver.com');

insert into groupmembers(g_id, m_id)
values(pgroup_g_id_seq.currval, 'gksrlf@naver.com');

insert into planner(p_id, g_id, p_subject, start_day, end_day, p_img, p_public, likes, complete, m_id, m_name)
values(planner_p_id_seq.nextval, pgroup_g_id_seq.currval, '프로젝트 성공 기념 여행!', '2016-10-15', '2016-10-18', 'a3', 1, 5, '0', 'gksrlf@naver.com', '이한길');

insert into group_invitation(gi_id, g_id, m_id, m_name, to_id, gi_date, gi_check, gi_content, p_subject, p_img)
values(group_invitation_gi_id_seq.nextval, pgroup_g_id_seq.currval, 'gksrlf@naver.com', '이한길', 'ghkvud2@naver.com', sysdate, 'n', '화평이형 같이 고고', '프로젝트 성공 기념 여행!','a3');

insert into admin_select_planner(p_id)
values(planner_p_id_seq.currval);


commit;


insert into pgroup(g_id, m_id)
values(pgroup_g_id_seq.nextval, 'guswl@naver.com');

insert into groupmembers(g_id, m_id)
values(pgroup_g_id_seq.currval, 'guswl@naver.com');

insert into planner(p_id, g_id, p_subject, start_day, end_day, p_img, p_public, likes, complete, m_id, m_name)
values(planner_p_id_seq.nextval, pgroup_g_id_seq.currval, '상윤오빠와 알콩달콩', '2016-10-22', '2016-10-23', 'a4', 1, 5, '0', 'guswl@naver.com', '김현지');

insert into likes(p_id, m_id)
values(planner_p_id_seq.currval, 'ghkvud2@naver.com');

insert into group_invitation(gi_id, g_id, m_id, m_name, to_id, gi_date, gi_check, gi_content, p_subject, p_img)
values(group_invitation_gi_id_seq.nextval, pgroup_g_id_seq.currval, 'guswl@naver.com', '김현지', 'ghkvud2@naver.com', sysdate, 'n', '화평오빠 운전좀 해주세요', '상윤오빠와 알콩달콩','a4');


commit;


insert into pgroup(g_id, m_id)
values(pgroup_g_id_seq.nextval, 'qudwls@naver.com');

insert into groupmembers(g_id, m_id)
values(pgroup_g_id_seq.currval, 'qudwls@naver.com');

insert into planner(p_id, g_id, p_subject, start_day, end_day, p_img, p_public, likes, complete, m_id, m_name)
values(planner_p_id_seq.nextval, pgroup_g_id_seq.currval, '부산에서 함 놀자!', '2016-10-15', '2016-10-18', 'a2', 1, 2, '0', 'qudwls@naver.com', '유병진');

insert into likes(p_id, m_id)
values(planner_p_id_seq.currval, 'ghkvud2@naver.com');

insert into group_invitation(gi_id, g_id, m_id, m_name, to_id, gi_date, gi_check, gi_content, p_subject, p_img)
values(group_invitation_gi_id_seq.nextval, pgroup_g_id_seq.currval, 'qudwls@naver.com', '유병진', 'ghkvud2@naver.com', sysdate, 'n', '화평아 부산 함 가자!!!', '부산에서 함 놀자!','a2');

commit;



insert into pgroup(g_id, m_id)
values(pgroup_g_id_seq.nextval, 'qudwls@naver.com');

insert into groupmembers(g_id, m_id)
values(pgroup_g_id_seq.currval, 'qudwls@naver.com');

insert into planner(p_id, g_id, p_subject, start_day, end_day, p_img, p_public, likes, complete, m_id, m_name)
values(planner_p_id_seq.nextval, pgroup_g_id_seq.currval, '제주도 2박3일!!', '2016-10-10', '2016-10-13', 'a8', 1, 2, '0', 'qudwls@naver.com', '유병진');

insert into group_invitation(gi_id, g_id, m_id, m_name, to_id, gi_date, gi_check, gi_content, p_subject, p_img)
values(group_invitation_gi_id_seq.nextval, pgroup_g_id_seq.currval, 'qudwls@naver.com', '유병진', 'ghkvud2@naver.com', sysdate, 'n', '제주도 유채꽃 보러~', '제주도 2박3일!!','a8');


commit;


insert into pgroup(g_id, m_id)
values(pgroup_g_id_seq.nextval, 'dbsgml@naver.com');

insert into groupmembers(g_id, m_id)
values(pgroup_g_id_seq.currval, 'dbsgml@naver.com');

insert into planner(p_id, g_id, p_subject, start_day, end_day, p_img, p_public, likes, complete, m_id, m_name)
values(planner_p_id_seq.nextval, pgroup_g_id_seq.currval, '고향 내려가면서', '2016-10-03', '2016-10-05', 'a7', 1, 1, '0', 'dbsgml@naver.com', '김윤희');



commit;


insert into pgroup(g_id, m_id)
values(pgroup_g_id_seq.nextval, 'tkddbs@naver.com');

insert into groupmembers(g_id, m_id)
values(pgroup_g_id_seq.currval, 'tkddbs@naver.com');

insert into planner(p_id, g_id, p_subject, start_day, end_day, p_img, p_public, likes, complete, m_id, m_name)
values(planner_p_id_seq.nextval, pgroup_g_id_seq.currval, '자전거 전국일주', '2016-09-05', '2016-09-18', 'a10', 1, 2, '0', 'tkddbs@naver.com', '신상윤');



commit;


insert into pgroup(g_id, m_id)
values(pgroup_g_id_seq.nextval, 'dbsgml@naver.com');

insert into groupmembers(g_id, m_id)
values(pgroup_g_id_seq.currval, 'dbsgml@naver.com');

insert into planner(p_id, g_id, p_subject, start_day, end_day, p_img, p_public, likes, complete, m_id, m_name)
values(planner_p_id_seq.nextval, pgroup_g_id_seq.currval, '부산여행 뿌잉뿌잉', '2016-10-10', '2016-10-13', 'a8', 1, 2, '0', 'dbsgml@naver.com', '김윤희');



commit;


insert into pgroup(g_id, m_id)
values(pgroup_g_id_seq.nextval, 'dbsgml@naver.com');

insert into groupmembers(g_id, m_id)
values(pgroup_g_id_seq.currval, 'dbsgml@naver.com');

insert into planner(p_id, g_id, p_subject, start_day, end_day, p_img, p_public, likes, complete, m_id, m_name)
values(planner_p_id_seq.nextval, pgroup_g_id_seq.currval, '캐나다 희망 여행!', '2016-10-10', '2016-10-13', 'a3', 1, 2, '0', 'dbsgml@naver.com', '김윤희');

commit;



insert into pgroup(g_id, m_id)
values(pgroup_g_id_seq.nextval, 'dbsgml@naver.com');

insert into groupmembers(g_id, m_id)
values(pgroup_g_id_seq.currval, 'dbsgml@naver.com');

insert into planner(p_id, g_id, p_subject, start_day, end_day, p_img, p_public, likes, complete, m_id, m_name)
values(planner_p_id_seq.nextval, pgroup_g_id_seq.currval, '캐나다 희망 여행!', '2016-10-10', '2016-10-27', 'a2', 1, 2, '0', 'dbsgml@naver.com', '김윤희');


commit;



insert into pgroup(g_id, m_id)
values(pgroup_g_id_seq.nextval, 'tkddbs@naver.com');

insert into groupmembers(g_id, m_id)
values(pgroup_g_id_seq.currval, 'tkddbs@naver.com');

insert into planner(p_id, g_id, p_subject, start_day, end_day, p_img, p_public, likes, complete, m_id, m_name)
values(planner_p_id_seq.nextval, pgroup_g_id_seq.currval, '전국 일주!', '2016-09-05', '2016-09-18', 'a1', 1, 2, '0', 'tkddbs@naver.com', '신상윤');


commit;



insert into pgroup(g_id, m_id)
values(pgroup_g_id_seq.nextval, 'qudwls@naver.com');

insert into groupmembers(g_id, m_id)
values(pgroup_g_id_seq.currval, 'qudwls@naver.com');

insert into planner(p_id, g_id, p_subject, start_day, end_day, p_img, p_public, likes, complete, m_id, m_name)
values(planner_p_id_seq.nextval, pgroup_g_id_seq.currval, '동남아 여행가자!!', '2016-10-02', '2016-10-13', 'a8', 1, 2, '0', 'qudwls@naver.com', '유병진');

commit;


insert into pgroup(g_id, m_id)
values(pgroup_g_id_seq.nextval, 'guswl@naver.com');

insert into groupmembers(g_id, m_id)
values(pgroup_g_id_seq.currval, 'guswl@naver.com');

insert into planner(p_id, g_id, p_subject, start_day, end_day, p_img, p_public, likes, complete, m_id, m_name)
values(planner_p_id_seq.nextval, pgroup_g_id_seq.currval, '아름다운 유럽으로~', '2016-09-02', '2016-09-20', 'a8', 1, 2, '0', 'guswl@naver.com', '김현지');

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
values(group_comment_gc_id_seq.nextval, pgroup_g_id_seq.currval, planner_p_id_seq.currval, 'ghkvud2@naver.com', '이화평', 'NCS 1기 여행경로 어떠세요? ', sysdate);

insert into group_comment(gc_id, g_id, p_id, m_id, m_name, gc_content, gc_date)
values(group_comment_gc_id_seq.nextval, pgroup_g_id_seq.currval, planner_p_id_seq.currval, 'gksrlf@naver.com', '이한길', '좋은 것 같아요 형', sysdate);

insert into group_comment(gc_id, g_id, p_id, m_id, m_name, gc_content, gc_date)
values(group_comment_gc_id_seq.nextval, pgroup_g_id_seq.currval, planner_p_id_seq.currval, 'guswl@naver.com', '김현지', '동해바다 근처는 어때요? 속초나 강릉', sysdate);

insert into group_comment(gc_id, g_id, p_id, m_id, m_name, gc_content, gc_date)
values(group_comment_gc_id_seq.nextval, pgroup_g_id_seq.currval, planner_p_id_seq.currval, 'ghkvud2@naver.com', '이화평', '현지야 너가 생각하는 루트 한 번 수정해봐 ㅋㅋㅋ', sysdate);

insert into group_comment(gc_id, g_id, p_id, m_id, m_name, gc_content, gc_date)
values(group_comment_gc_id_seq.nextval, pgroup_g_id_seq.currval, planner_p_id_seq.currval, 'guswl@naver.com', '김현지', '네 ㅎㅎ 지금 수정했어요 동해 쪽 위주로!!', sysdate);

insert into group_comment(gc_id, g_id, p_id, m_id, m_name, gc_content, gc_date)
values(group_comment_gc_id_seq.nextval, pgroup_g_id_seq.currval, planner_p_id_seq.currval, 'tkddbs@naver.com', '신상윤', '역시 현지 센스!! 좋다!', sysdate);

insert into planner(p_id, g_id, p_subject, start_day, end_day, p_img, p_public, likes, complete, m_id, m_name)
values(planner_p_id_seq.nextval, pgroup_g_id_seq.currval,  '같이 떠나는 KITRI 여행~', '2016-10-27', '2016-10-29', 'a1', 1, 10, '1', 'ghkvud2@naver.com', '이화평');



insert into admin_select_planner(p_id)
values(planner_p_id_seq.currval);

-- 첫 날 ( 서울 -> 속초 )
insert into day_route(p_id, dr_date, dr_order, dr_location, dr_lat, dr_lng)
values(planner_p_id_seq.currval, '2016-10-27', 0, '서울', 37.566299, 126.977737);

insert into day_route(p_id, dr_date, dr_order, dr_location, dr_lat, dr_lng)
values(planner_p_id_seq.currval, '2016-10-27', 1, '속초', 38.206902,   128.591827);

-- 둘째 날(속초->강릉)

insert into day_route(p_id, dr_date, dr_order, dr_location, dr_lat, dr_lng)
values(planner_p_id_seq.currval, '2016-10-28', 0, '속초', 38.206902,   128.591827);

insert into day_route(p_id, dr_date, dr_order, dr_location, dr_lat, dr_lng)
values(planner_p_id_seq.currval, '2016-10-28', 1, '강릉', 37.752072,   128.875959);


-- 셋째 날(강릉 -> 낙산사 -> 경포대 -> 고성 -> 서울)

insert into day_route(p_id, dr_date, dr_order, dr_location, dr_lat, dr_lng)
values(planner_p_id_seq.currval, '2016-10-29', 1, '강릉', 37.752072,   128.875959);

insert into day_route(p_id, dr_date, dr_order, dr_location, dr_lat, dr_lng)
values(planner_p_id_seq.currval, '2016-10-29', 1, '낙산사', 38.124523   , 128.628059);

insert into day_route(p_id, dr_date, dr_order, dr_location, dr_lat, dr_lng)
values(planner_p_id_seq.currval, '2016-10-29', 1, '경포대', 37.805563, 128.908096);

insert into day_route(p_id, dr_date, dr_order, dr_location, dr_lat, dr_lng)
values(planner_p_id_seq.currval, '2016-10-29', 1, '고성', 38.380538,   128.467753);

insert into day_route(p_id, dr_date, dr_order, dr_location, dr_lat, dr_lng)
values(planner_p_id_seq.currval, '2016-10-29', 1, '서울', 37.566299,   126.977737);



insert into day_plan(p_id, dp_date, dp_memo, dp_lodgment, dp_transportation)
values(planner_p_id_seq.currval, '2016-10-27', '여행 첫날 입니다. 모두 들뜬 마음 일단 가라앉히세요', '백상 호텔 102호, 103호', '속초까지 기차 그 외 버스');

insert into day_plan(p_id, dp_date, dp_memo, dp_lodgment, dp_transportation)
values(planner_p_id_seq.currval, '2016-10-28', '여행 둘째 날 입니다. 해변에서 놀아요', '강릉 호텔 1102호, 1103호', '강릉까지 버스 그 외 도보');

insert into day_plan(p_id, dp_date, dp_memo, dp_lodgment, dp_transportation)
values(planner_p_id_seq.currval, '2016-10-29', '마지막 날 입니다.', '', '낙산사 및 고성, 경포대는 버스');


commit;






















