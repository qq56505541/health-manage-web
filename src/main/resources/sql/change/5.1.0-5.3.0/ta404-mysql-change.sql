-- 新增表
DROP TABLE IF EXISTS TATEMPLATE;
CREATE TABLE TATEMPLATE (
    TEMPLATEID      VARCHAR(36)     NOT NULL    COMMENT '模板ID',
    TEMPLATENAME    VARCHAR(100)    NOT NULL    COMMENT '模板名称',
    TEMPLATETYPE    VARCHAR(2)      NOT NULL    COMMENT '模板类型',
    TEMPLATEINTRO   VARCHAR(255)    NOT NULL    COMMENT '模板描述',
    TEMPLATECONTENT TEXT            NOT NULL    COMMENT '模板内容',
    EFFECTIVE       VARCHAR(1)      NOT NULL    COMMENT '有效性',
    DESTROY         VARCHAR(1)      NOT NULL    COMMENT '是否销毁',
    CREATEUSER      VARCHAR(36)     NOT NULL    COMMENT '创建者',
    CREATEDATE      datetime        NOT NULL    COMMENT '创建时间',
    constraint PK_TATEMPLATE primary key (TEMPLATEID)
);
alter table TATEMPLATE comment '在线表单模板表';

-- 新增url数据
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('253c2eae3e0046c2ba4f53f4ffa89ba3', '在线表单模板管理', 'onlineForm/templateMg/templateMgRestService/**', NULL, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('d9a5e31b83b141279b387bc4dfac0713', '表单模板条件分页查询', 'onlineForm/templateMg/templateMgRestService/queryTemplate', '253c2eae3e0046c2ba4f53f4ffa89ba3', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('66ee423b80f84407a952e4edf2d27901', '通过ID查询模板JSON字符串', 'onlineForm/templateMg/templateMgRestService/queryTemplateContentById', '253c2eae3e0046c2ba4f53f4ffa89ba3', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('2133136c1fca4fa79ed4c5b960bf914c', '新增表单模板', 'onlineForm/templateMg/templateMgRestService/insertTemplate', '253c2eae3e0046c2ba4f53f4ffa89ba3', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('8d50ff41b6aa42c383f119cc4dd9abf6', '更新表单模板', 'onlineForm/templateMg/templateMgRestService/updateTemplate', '253c2eae3e0046c2ba4f53f4ffa89ba3', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('59ea5a521dd1439f839466603c76302a', '更新模板有效性', 'onlineForm/templateMg/templateMgRestService/updateTemplateEffective', '253c2eae3e0046c2ba4f53f4ffa89ba3', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('c433ed5a2a1340f6a0063637861de279', '删除表单模板', 'onlineForm/templateMg/templateMgRestService/deleteTemplates', '253c2eae3e0046c2ba4f53f4ffa89ba3', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('632895cc5cd14dbdb76d9c10fffd0786', '获取表结构', 'onlineForm/templateMg/templateMgRestService/queryTableColumns', '253c2eae3e0046c2ba4f53f4ffa89ba3', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('60bd58fe73d0472881349ecbfdd0bd29', '获取数据库表', 'onlineForm/templateMg/templateMgRestService/queryTable', '253c2eae3e0046c2ba4f53f4ffa89ba3', '1', '1', now(), '1');
-- 新增resource数据
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('823c2134cae14d029f7db31e42b3451f', '7459c1b525934151a1d309a304933644', '在线表单模板管理', NULL, 'sysmg', 'onlineForm.html#/formTemplate', '70', '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/7459c1b525934151a1d309a304933644/823c2134cae14d029f7db31e42b3451f', '银海软件/管理系统/资源管理/在线表单模板管理', '3', '', '', '2', 0, '1', '1', '1', NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
-- 新增resourceurl数据
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('823c2134cae14d029f7db31e42b3451f', '253c2eae3e0046c2ba4f53f4ffa89ba3', '0');

-- 调整dict表格字段长度
ALTER TABLE TADICT MODIFY CSSCLASS varchar(128);
-- 删除dict数据
DELETE FROM TADICT WHERE TYPE = 'TEMPLATESOURCE';
DELETE FROM TADICT WHERE type = 'TEMPLATETYPE' AND VALUE in ('2', '3');
-- 更新dict数据
UPDATE TADICT SET LABEL = '表单模板' WHERE TYPE = 'TEMPLATETYPE' AND VALUE = '1';
-- 添加dict数据
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, system, newtype) VALUES ('模版类型', 'TEMPLATETYPE', '开发模板', '2', NULL, 20, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, system, newtype) VALUES ('配置数据类型', 'CONFIGDATATYPE', 'YAML(YML)', '5', NULL, 50, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');


--tasysconfig字段
ALTER TABLE tasysconfig ADD originalvalue varchar(800) comment '配置原始值';

-- 字段长度调整
ALTER TABLE taserverexceptionlog MODIFY COLUMN CREATETIME datetime(6) NULL COMMENT '创建时间';
ALTER TABLE taorgoplog MODIFY COLUMN OPTIME datetime(6) NOT NULL COMMENT '创建时间';
ALTER TABLE taonlinelog MODIFY COLUMN LOGINTIME datetime(6) NOT NULL COMMENT '登录时间';
ALTER TABLE taloginhistorylog MODIFY COLUMN LOGINTIME datetime(6) NOT NULL COMMENT '登录时间';
ALTER TABLE taloginhistorylog MODIFY COLUMN LOGOUTTIME datetime(6) NOT NULL COMMENT '退出时间';

-- 新增tauserresource表
create table tauserresource
(
    userid     varchar(36) not null comment '用户id',
    resourceid varchar(36) not null comment '资源id',
    createtime timestamp   not null comment '创建时间',
    primary key (userid, resourceid)
);
alter table TAUSERRESOURCE comment '用户资源表';

-- 添加taaccesssystem扩展字段
ALTER TABLE taaccesssystem ADD field01 varchar(1000) comment '扩展字段01';
ALTER TABLE taaccesssystem ADD field02 varchar(1000) comment '扩展字段02';
ALTER TABLE taaccesssystem ADD field03 varchar(1000) comment '扩展字段03';
ALTER TABLE taaccesssystem ADD field04 varchar(1000) comment '扩展字段04';
ALTER TABLE taaccesssystem ADD field05 varchar(1000) comment '扩展字段05';
ALTER TABLE taaccesssystem ADD field06 varchar(1000) comment '扩展字段06';
ALTER TABLE taaccesssystem ADD field07 varchar(1000) comment '扩展字段07';
ALTER TABLE taaccesssystem ADD field08 varchar(1000) comment '扩展字段08';
ALTER TABLE taaccesssystem ADD field09 varchar(1000) comment '扩展字段09';
ALTER TABLE taaccesssystem ADD field10 varchar(1000) comment '扩展字段10';


-- 配置菜单图标
UPDATE taresource SET icon='setting' WHERE resourceid = '0415d44401b24605a21b589b6aaa349e';
UPDATE taresource SET icon='layout' WHERE resourceid = '0aac95c1e73947bea41be639cc4e9036';
UPDATE taresource SET icon='setting' WHERE resourceid = '1d4e283ad5584e02811f6b188d3592bc';
UPDATE taresource SET icon='cluster' WHERE resourceid = '1e706f26bc144c1da12022359c238053';
UPDATE taresource SET icon='hdd' WHERE resourceid = '322e200d71544e3986d2f374e3506805';
UPDATE taresource SET icon='deployment-unit' WHERE resourceid = '3dbde33722154503a7d22ac60f6a0e4e';
UPDATE taresource SET icon='tags' WHERE resourceid = '3df588fc565d4287b3cefcd00a39cd91';
UPDATE taresource SET icon='exception' WHERE resourceid = '43f468b40c6c4c76a3a2fe4be903f4c7';
UPDATE taresource SET icon='usergroup-add' WHERE resourceid = '48afedddc8f04c668b3c1572c30a7745';
UPDATE taresource SET icon='gold' WHERE resourceid = '4b2eee0d7ded4e8094d4acf439fd3a1c';
UPDATE taresource SET icon='global' WHERE resourceid = '5611d1533d494a839c0be1e7a05da31f';
UPDATE taresource SET icon='api' WHERE resourceid = '59a7fb9c459a4dd48d468f2add1d32b2';
UPDATE taresource SET icon='block' WHERE resourceid = '5e67c7acef914c349d8aff076921f6b5';
UPDATE taresource SET icon='block' WHERE resourceid = '60554e93387146bb9c7357907ba093fa';
UPDATE taresource SET icon='form' WHERE resourceid = '722e1cc774a14178a488eb42ef4099de';
UPDATE taresource SET icon='form' WHERE resourceid = '72888507aba5484a8942e8dd0e6b6f7f';
UPDATE taresource SET icon='align-left' WHERE resourceid = '7459c1b525934151a1d309a304933644';
UPDATE taresource SET icon='safety-certificate' WHERE resourceid = '78ad02fdb879406ebc5e7a4faf8f5905';
UPDATE taresource SET icon='laptop' WHERE resourceid = '7b7f9cd1675a4b54b05c7c7cf0a7ac63';
UPDATE taresource SET icon='file-sync' WHERE resourceid = '7c1dabd160974d8f90858c187cefa128';
UPDATE taresource SET icon='snippets' WHERE resourceid = '823c2134cae14d029f7db31e42b3451f';
UPDATE taresource SET icon='team' WHERE resourceid = '877e407281dd48acb05a77fcb922bc73';
UPDATE taresource SET icon='safety' WHERE resourceid = '8aa86ed4c7f84183935a262db4a605d3';
UPDATE taresource SET icon='idcard' WHERE resourceid = '95bb9b749bf54e4692b0b1f14fd1b5ab';
UPDATE taresource SET icon='database' WHERE resourceid = 'a3c94b4edf1e4e9d8665a81dc1c5f778';
UPDATE taresource SET icon='user' WHERE resourceid = 'bd9d0bba145c458e841aa9da0aeeb1d8';
UPDATE taresource SET icon='compass' WHERE resourceid = 'bf447212de284c79a0d73c658d0692b4';
UPDATE taresource SET icon='copyright' WHERE resourceid = 'c2745b7cae7846acb9bcf8d0f4e836e8';
UPDATE taresource SET icon='clock-circle' WHERE resourceid = 'c578d9f8626d48f2971d7a18ac5281c5';
UPDATE taresource SET icon='tool' WHERE resourceid = 'cd49aa1e1a724404a4dfb4f290e1ed62';
UPDATE taresource SET icon='user' WHERE resourceid = 'daceeff8a97b46cb9573b93ba3a5a792';
UPDATE taresource SET icon='compass' WHERE resourceid = 'ec56a0a43b09429482632cb61f7c6908';
UPDATE taresource SET icon='gold' WHERE resourceid = 'fb8637c2e52e4b05bd2c07d742141ee7';
UPDATE taresource SET icon='form' WHERE resourceid = 'fe8be18859b5478d8b76a7653f02e5eb';
UPDATE taresource SET icon='book' WHERE resourceid = 'ffa74f43e853441dac0ee90c787cb2e6';

-- 菜单变动
-- INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('823c2134cae14d029f7db31e42b3451f', '7459c1b525934151a1d309a304933644', '在线表单模板管理', NULL, 'sysmg', 'onlineForm.html#/formTemplate', '70', '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/7459c1b525934151a1d309a304933644/823c2134cae14d029f7db31e42b3451f', '银海软件/管理系统/资源管理/在线表单模板管理', '3', '', '', '2', 0, '1', '1', '1', NULL, sysdate, '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
-- 删除在线表单模板管理菜单
DELETE FROM taresource WHERE resourceid = '823c2134cae14d029f7db31e42b3451f';
-- 变更润乾模板管理菜单前端路径
UPDATE taresource SET url = 'functionModules.html#/runqian' WHERE resourceid = '722e1cc774a14178a488eb42ef4099de';

-- 学历码表
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('学历', 'EDUCATION', '初中及以下', '1', NULL, 10, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('学历', 'EDUCATION', '中专/中技', '2', NULL, 20, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('学历', 'EDUCATION', '高中', '3', NULL, 30, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('学历', 'EDUCATION', '大专', '4', NULL, 40, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('学历', 'EDUCATION', '本科', '5', NULL, 50, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('学历', 'EDUCATION', '硕士', '6', NULL, 60, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('学历', 'EDUCATION', '博士', '7', NULL, 70, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');

-- 调整url独立授权表的主键
ALTER TABLE taroleurlauthority DROP PRIMARY KEY;
ALTER TABLE taroleurlauthority ADD CONSTRAINT taroleurlauthority_pk PRIMARY KEY (ROLEID,URLID,RESOURCEID);

-- 补回mysql seq相关内容
CREATE TABLE seq (
                     name varchar(20) NOT NULL DEFAULT '',
                     val bigint(20) unsigned NOT NULL,
                     PRIMARY KEY (name)
);
INSERT INTO seq (name,val) VALUES  ('SEQ_DEFAULT',1000000000);
INSERT INTO seq (name,val) VALUES  ('HIBERNATE_SEQUENCE',1000000000);

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE FUNCTION  seq(seq_name varchar(20)) RETURNS bigint(20)
BEGIN
UPDATE seq SET val = LAST_INSERT_ID(val+1) WHERE name = seq_name;
RETURN LAST_INSERT_ID();
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;