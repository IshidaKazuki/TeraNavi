#users�\
INSERT INTO users(login_id,
user_name,
user_name_kana,
sex,sex_visible_flag,
birth_date,mail_address,
password,
secret_answer,
user_header_path,
user_icon_path,
blog_title,
blog_header_path,
admin_flag,
last_login_date,
admin_last_login_date,
user_status_flag,
user_lock_start_date,
user_lock_end_date,
blog_explanation,
user_profile,
blog_status_flag)
VALUES(
tsuchiya19,
'�y���q��',
'����Ƃ���',
m,
0,
'1995/02/11 20:20:20',
'tt14@mail.com',
'���ΐ搶',
'/images/(user_id)/header.jpg',
'/images/(user_id)/icon.jpg',
'����u���O',
'/images/default/header.jpg',
0,
'1995/02/11 20:20:30',
'1995/02/11 20:20:40',
0,
'2020/02/11 20:20:20',
'2020/02/11 20:30:20',
'���̃u���O�͊y����',
'�Q�[�����D���ł�',
0);

INSERT INTO users(login_id,
user_name,
user_name_kana,
sex,sex_visible_flag,
birth_date,mail_address,
password,
secret_answer,
user_header_path,
user_icon_path,
blog_title,
blog_header_path,
admin_flag,
last_login_date,
admin_last_login_date,
user_status_flag,
user_lock_start_date,
user_lock_end_date,
blog_explanation,
user_profile,
blog_status_flag)
VALUES(
tsuchiya19,
'�y���q��',
'����Ƃ���',
f,
1,
'1995/02/11 20:20:20',
'tt14@mail.com',
'���ΐ搶',
'/images/(user_id)/header.jpg',
'/images/(user_id)/icon.jpg',
'����u���O',
'/images/default/header.jpg',
1,
'1995/02/11 20:20:30',
'1995/02/11 20:20:40',
1,
'2020/02/11 20:20:20',
'2020/02/11 20:30:20',
'���̃u���O�͊y����',
'�Q�[�����D���ł�',
1);



INSERT INTO users(login_id,
user_name,
user_name_kana,
sex,sex_visible_flag,
birth_date,mail_address,
password,
secret_answer,
user_header_path,
user_icon_path,
blog_title,
blog_header_path,
admin_flag,
last_login_date,
admin_last_login_date,
user_status_flag,
user_lock_start_date,
user_lock_end_date,
blog_explanation,
user_profile,
blog_status_flag)
VALUES(
tsuchiya19,
'�y���q��',
'����Ƃ���',
f,
1,
'1995/02/11 20:20:20',
'tt14@mail.com',
'���ΐ搶',
'/images/(user_id)/header.jpg',
'/images/(user_id)/icon.jpg',
'����u���O',
'/images/default/header.jpg',
1,
'1995/02/11 20:20:30',
'1995/02/11 20:20:40',
2,
'2020/02/11 20:20:20',
'2020/02/11 20:30:20',
'���̃u���O�͊y����',
'�Q�[�����D���ł�',
1);


INSERT INTO users(login_id,
user_name,
user_name_kana,
sex,sex_visible_flag,
birth_date,mail_address,
password,
secret_answer,
user_header_path,
user_icon_path,
blog_title,
blog_header_path,
admin_flag,
last_login_date,
admin_last_login_date,
user_status_flag,
user_lock_start_date,
user_lock_end_date,
blog_explanation,
user_profile,
blog_status_flag)
VALUES(
tsuchiya19,
'�y���q��',
'����Ƃ���',
f,
1,
'1995/02/11 20:20:20',
'tt14@mail.com',
'���ΐ搶',
'/images/(user_id)/header.jpg',
'/images/(user_id)/icon.jpg',
'����u���O',
'/images/default/header.jpg',
1,
'1995/02/11 20:20:30',
'1995/02/11 20:20:40',
3,
'2020/02/11 20:20:20',
'2020/02/11 20:30:20',
'���̃u���O�͊y����',
'�Q�[�����D���ł�',
1);


#secret_questions�\
INSERT INTO secret_questions(seqret_question_body)VALUES('���Ȃ��̐搶�́H');

#communities�\
INSERT INTO communities(
community_name,
community_profile,
community_icon_path,
community_header_path,
community_created_date,
community_delete_flag
)VALUES(
'�u���b�N�o�X��ނ낤�̉�',
'�u���b�N�o�X��ނ邽�߂̒m�������L���܂�',
'/images/(community_id)/icon/icon.jpg',
'/images/(community_id)/header/header.jpg',
'2001/02/11 20:30:20',
0);

INSERT INTO communities(
community_name,
community_profile,
community_icon_path,
community_header_path,
community_created_date,
community_delete_flag
)VALUES(
'�u���b�N�o�X��ނ낤�̉�',
'�u���b�N�o�X��ނ邽�߂̒m�������L���܂�',
'/images/(community_id)/icon/icon.jpg',
'/images/(community_id)/header/header.jpg',
'2001/02/11 20:30:20',
1);


#articles�\
INSERT INTO articles(
article_title,
article_dody,
article_created_date,
article_status_flag)
VALUES(
'����Ԃ낮',
'�ڂ������̓y������',
'2004/02/11 20:30:20',
0
);

INSERT INTO articles(
article_title,
article_dody,
article_created_date,
article_status_flag)
VALUES(
'����Ԃ낮',
'�ڂ������̓y������',
'2004/02/11 20:30:20',
1
);

INSERT INTO articles(
article_title,
article_dody,
article_created_date,
article_status_flag)
VALUES(
'����Ԃ낮',
'�ڂ������̓y������',
'2004/02/11 20:30:20',
2
);


#community_members_list�\
INSERT INTO community_members_list(community_admin_flag)VALUES(0);
INSERT INTO community_members_list(community_admin_flag)VALUES(1);


#tags�\
INSERT INTO tags(tag_name) VALUES('�ɓ���');


#comments�\
INSERT INTO comments(
comment_date,
comment_body,
comment_delete_flag)VALUES(
'2004/02/11 20:30:20',
'�y�����ł���',
1
);

INSERT INTO comments(
comment_date,
comment_body,
comment_delete_flag)VALUES(
'2004/02/11 20:30:20',
'�y�����ł���',
2
);


#dm�\
INSERT INTO direct_message(
message_body,
message_date)VALUES(
'�V��Ł[',
'2004/02/11 20:30:20'
);


#contacts�\
INSERT INTO contacts(
contact_user_name,
contact_title,
contact_body,
contact_date,
contact_address,
contact_category)VALUES(
'�y���q��',
'���₢���킹�ł�',
'���₢���킹���܂���',
'2004/02/22 20:30:20'
'tsuchiya@mail.com',
'���̑�'
);


#cautions�\
INSERT INTO cautions(
caution_date,
caution_title,
caution_body,
report_page_url
)VALUES(
'2004/02/14 20:30:20'
'�x���ł�',
'�x�����ł�',
'http://www.keikoku.com'
);


#topic�\
INSERT INTO topic(
topic_name,
topic_update_date,
topic_created_date
)VALUES(
'�ɓ���',
'2004/02/14 20:30:20'
'2004/02/13 20:30:20'
);


#chat�\
INSERT INTO chat(
chat_body,
chat_date,
chat_delete_flag
)VALUES(
'���[����������������',
'2002/02/14 20:30:20'
0
);

INSERT INTO chat(
chat_body,
chat_date,
chat_delete_flag
)VALUES(
'���[����������������',
'2002/02/14 20:30:20'
1
);


#sign_up_keys�\
INSERT INTO sign_up_keys(key_status)VALUES(0);
INSERT INTO sign_up_keys(key_status)VALUES(1);


#policy�\
INSERT INTO policy(
policy_date,
policy_body)VALUES(
'2002/02/14 20:30:20',
'�v���C�o�V�[�|���V�[�ł�'
);


#rules�\
INSERT INTO rules(
rule_date,
rule_body
)VALUES(
'2002/02/14 20:30:20',
'�K��ł�'
);