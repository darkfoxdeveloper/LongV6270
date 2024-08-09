INSERT INTO cq_action (id, id_next, id_nextfail, type, data, param) VALUES (564004, 0, 0, 518, 3100011, '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1440');
INSERT INTO cq_action (id, id_next, id_nextfail, type, data, param) VALUES (564003, 0, 0, 518, 3100017, '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1440');
INSERT INTO cq_action (id, id_next, id_nextfail, type, data, param) VALUES (564002, 0, 0, 518, 3100016, '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1440');
INSERT INTO cq_action (id, id_next, id_nextfail, type, data, param) VALUES (564001, 0, 0, 518, 3100015, '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1440');
INSERT INTO cq_action (id, id_next, id_nextfail, type, data, param) VALUES (564000, 0, 0, 518, 3100014, '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1440');
INSERT INTO cq_action (id, id_next, id_nextfail, type, data, param) VALUES (563999, 0, 0, 518, 3100013, '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1440');
INSERT INTO cq_action (id, id_next, id_nextfail, type, data, param) VALUES (90123300, 0, 0, 20002, 0, 'SendMail_Main 90123300');
INSERT INTO cq_action (id, id_next, id_nextfail, type, data, param) VALUES (90123301, 0, 0, 20002, 0, 'SendMail_Main 90123301');
INSERT INTO cq_action (id, id_next, id_nextfail, type, data, param) VALUES (90123302, 0, 0, 20002, 0, 'SendMail_Main 90123302');
INSERT INTO cq_action (id, id_next, id_nextfail, type, data, param) VALUES (90123303, 0, 0, 20002, 0, 'SendMail_Main 90123303');
INSERT INTO cq_action (id, id_next, id_nextfail, type, data, param) VALUES (90123304, 0, 0, 20002, 0, 'SendMail_Main 90123304');

INSERT INTO cq_config (id, type, data1, data2, data3, data4, data5, describ) VALUES (80261, 6015, 564004, 15, 0, 0, 0, '');
INSERT INTO cq_config (id, type, data1, data2, data3, data4, data5, describ) VALUES (80262, 6016, 2, 7, 14, 21, 28, '');
INSERT INTO cq_config (id, type, data1, data2, data3, data4, data5, describ) VALUES (80263, 6017, 90123300, 90123301, 90123302, 90123303, 90123304, '');

create table cq_sign_everyday
(
    id              int unsigned auto_increment primary key,
    player_id       int unsigned        default 0 not null,
    award_camulate  tinyint(4) unsigned default 0 null,
    sign_day        int unsigned        default 0 null,
    fill_sign_times tinyint(4) unsigned default 0 null
) engine = MyISAM;

create index player_id
    on cq_sign_everyday (player_id);

