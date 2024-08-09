create table cq.cq_user_title
(
    id        int(4) unsigned auto_increment
        primary key,
    player_id int(4) unsigned default 0 not null,
    type      int(4) unsigned default 0 null,
    title_id  int(4) unsigned default 0 null,
    status    int(4) unsigned default 0 null,
    del_time  int(4) unsigned default 0 null
)
    engine = MyISAM;

create index idx_player_id
    on cq.cq_user_title (player_id);

create table cq.cq_title_rule
(
    title_type int(4) unsigned default 0 not null,
    title_id   int(4) unsigned default 0 not null,
    rule       int(4) unsigned default 0 not null,
    relation   int(4) unsigned default 0 not null,
    data1      int(4) unsigned default 0 not null,
    data2      int(4) unsigned default 0 not null,
    data3      int(4) unsigned default 0 not null,
    data4      int(4) unsigned default 0 not null,
    data5      int(4) unsigned default 0 not null,
    data6      int(4) unsigned default 0 not null,
    data7      int(4) unsigned default 0 not null,
    data8      int(4) unsigned default 0 not null,
    constraint u_title_rule
        unique (title_type, title_id)
)
    engine = MyISAM;

create table cq.cq_title_type
(
    type         int(4) unsigned default 0      null,
    id           int(4) unsigned default 0      null,
    name         varchar(15)     default 'null' not null,
    save_time    int(4) unsigned default 0      null,
    cost_7       int(4) unsigned default 0      null,
    cost_30      int(4) unsigned default 0      null,
    cost_forever int(4) unsigned default 0      null,
    score        int(4) unsigned default 0      null,
    constraint u_title_type
        unique (type, id)
)
    engine = MyISAM;

create table cq.cq_coat_storage_attr
(
    id          int(4) unsigned auto_increment
        primary key,
    coat_type   int(4) unsigned default 0 null,
    amount      int(4) unsigned default 0 null,
    attr_type_1 int(4) unsigned default 0 null,
    attr_1      int(4) unsigned default 0 null,
    attr_type_2 int(4) unsigned default 0 null,
    attr_2      int(4) unsigned default 0 null,
    attr_type_3 int(4) unsigned default 0 null,
    attr_3      int(4) unsigned default 0 null,
    attr_type_4 int(4) unsigned default 0 null,
    attr_4      int(4) unsigned default 0 null
)
    engine = MyISAM;

create table cq.cq_coat_storage_type
(
    item_type_id     int(4) unsigned default 0 not null
        primary key,
    coat_id          int(4) unsigned default 0 null,
    coat_type        int(4) unsigned default 0 null,
    cost_7           int(4) unsigned default 0 null,
    cost_30          int(4) unsigned default 0 null,
    cost_forever     int(4) unsigned default 0 null,
    forever_itemtype int(4) unsigned default 0 null,
    star             int(4) unsigned default 0 null
)
    engine = MyISAM;

