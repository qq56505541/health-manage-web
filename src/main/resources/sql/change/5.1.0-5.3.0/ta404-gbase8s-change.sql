-- 新增表
DROP TABLE IF EXISTS TATEMPLATE;
CREATE TABLE TATEMPLATE (
    TEMPLATEID      VARCHAR(36)                     NOT NULL,
    TEMPLATENAME    VARCHAR(100)                    NOT NULL,
    TEMPLATETYPE    VARCHAR(2)                      NOT NULL,
    TEMPLATEINTRO   VARCHAR(255)                    NOT NULL,
    TEMPLATECONTENT LVARCHAR(30000)                 NOT NULL,
    EFFECTIVE       VARCHAR(1)                      NOT NULL,
    DESTROY         VARCHAR(1)                      NOT NULL,
    CREATEUSER      VARCHAR(36)                     NOT NULL,
    CREATEDATE      DATETIME YEAR TO FRACTION(5)    NOT NULL,
    primary key (TEMPLATEID) constraint PK_TATEMPLATE
);
COMMENT ON TABLE TATEMPLATE is '在线表单模板表';
COMMENT ON COLUMN TATEMPLATE.TEMPLATEID IS '模板ID';
COMMENT ON COLUMN TATEMPLATE.TEMPLATENAME IS '模板名称';
COMMENT ON COLUMN TATEMPLATE.TEMPLATETYPE IS '模板类型';
COMMENT ON COLUMN TATEMPLATE.TEMPLATEINTRO IS '模板描述';
COMMENT ON COLUMN TATEMPLATE.TEMPLATECONTENT IS '模板内容';
COMMENT ON COLUMN TATEMPLATE.EFFECTIVE IS '有效性';
COMMENT ON COLUMN TATEMPLATE.DESTROY IS '是否销毁';
COMMENT ON COLUMN TATEMPLATE.CREATEUSER IS '创建者';
COMMENT ON COLUMN TATEMPLATE.CREATEDATE IS '创建时间';

-- 新增url数据
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('253c2eae3e0046c2ba4f53f4ffa89ba3', '在线表单模板管理', 'onlineForm/templateMg/templateMgRestService/**', NULL, '0', '1', current, '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('d9a5e31b83b141279b387bc4dfac0713', '表单模板条件分页查询', 'onlineForm/templateMg/templateMgRestService/queryTemplate', '253c2eae3e0046c2ba4f53f4ffa89ba3', '1', '1', current, '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('66ee423b80f84407a952e4edf2d27901', '通过ID查询模板JSON字符串', 'onlineForm/templateMg/templateMgRestService/queryTemplateContentById', '253c2eae3e0046c2ba4f53f4ffa89ba3', '1', '1', current, '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('2133136c1fca4fa79ed4c5b960bf914c', '新增表单模板', 'onlineForm/templateMg/templateMgRestService/insertTemplate', '253c2eae3e0046c2ba4f53f4ffa89ba3', '1', '1', current, '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('8d50ff41b6aa42c383f119cc4dd9abf6', '更新表单模板', 'onlineForm/templateMg/templateMgRestService/updateTemplate', '253c2eae3e0046c2ba4f53f4ffa89ba3', '1', '1', current, '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('59ea5a521dd1439f839466603c76302a', '更新模板有效性', 'onlineForm/templateMg/templateMgRestService/updateTemplateEffective', '253c2eae3e0046c2ba4f53f4ffa89ba3', '1', '1', current, '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('c433ed5a2a1340f6a0063637861de279', '删除表单模板', 'onlineForm/templateMg/templateMgRestService/deleteTemplates', '253c2eae3e0046c2ba4f53f4ffa89ba3', '1', '1', current, '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('632895cc5cd14dbdb76d9c10fffd0786', '获取表结构', 'onlineForm/templateMg/templateMgRestService/queryTableColumns', '253c2eae3e0046c2ba4f53f4ffa89ba3', '1', '1', current, '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('60bd58fe73d0472881349ecbfdd0bd29', '获取数据库表', 'onlineForm/templateMg/templateMgRestService/queryTable', '253c2eae3e0046c2ba4f53f4ffa89ba3', '1', '1', current, '1');
-- 新增resource数据
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('823c2134cae14d029f7db31e42b3451f', '7459c1b525934151a1d309a304933644', '在线表单模板管理', NULL, 'sysmg', 'onlineForm.html#/formTemplate', '70', '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/7459c1b525934151a1d309a304933644/823c2134cae14d029f7db31e42b3451f', '银海软件/管理系统/资源管理/在线表单模板管理', '3', '', '', '2', 0, '1', '1', '1', NULL, current, '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
-- 新增resourceurl数据
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('823c2134cae14d029f7db31e42b3451f', '253c2eae3e0046c2ba4f53f4ffa89ba3', '0');

-- 调整dict字段长度
ALTER TABLE TADICT alter column CSSCLASS type varchar(128);
-- 删除dict数据
DELETE FROM TADICT WHERE TYPE = 'TEMPLATESOURCE';
DELETE FROM TADICT WHERE type = 'TEMPLATETYPE' AND VALUE in ('2', '3');
-- 更新dict数据
UPDATE TADICT SET LABEL = '表单模板' WHERE TYPE = 'TEMPLATETYPE' AND VALUE = '1'
-- 添加dict数据
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, system, newtype) VALUES ('模版类型', 'TEMPLATETYPE', '开发模板', '2', NULL, 20, '0', NULL, NULL, NULL, current, '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, system, newtype) VALUES ('配置数据类型', 'CONFIGDATATYPE', 'YAML(YML)', '5', NULL, 50, '0', NULL, NULL, NULL, current, '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');

-- tasysconfig字段
alter table tasysconfig add originalvalue varchar(800);
comment on column tasysconfig.originalvalue is '配置原始值';

-- 新增tauserresource表
create table TAUSERRESOURCE
(
    USERID     VARCHAR(36) not null,
    RESOURCEID VARCHAR(36) not null,
    CREATETIME DATETIME YEAR TO FRACTION(5) not null,
primary key (userid, resourceid)
    constraint PK_TAUSERRESOURCE
);
comment on table TAUSERRESOURCE is '用户资源表';
comment on column TAUSERRESOURCE.USERID is '用户id';
comment on column TAUSERRESOURCE.RESOURCEID is '资源id';
comment on column TAUSERRESOURCE.CREATETIME is '创建时间';

-- 添加taaccesssystem扩展字段
ALTER TABLE taaccesssystem ADD field01 LVARCHAR(1000);
ALTER TABLE taaccesssystem ADD field02 LVARCHAR(1000);
ALTER TABLE taaccesssystem ADD field03 LVARCHAR(1000);
ALTER TABLE taaccesssystem ADD field04 LVARCHAR(1000);
ALTER TABLE taaccesssystem ADD field05 LVARCHAR(1000);
ALTER TABLE taaccesssystem ADD field06 LVARCHAR(1000);
ALTER TABLE taaccesssystem ADD field07 LVARCHAR(1000);
ALTER TABLE taaccesssystem ADD field08 LVARCHAR(1000);
ALTER TABLE taaccesssystem ADD field09 LVARCHAR(1000);
ALTER TABLE taaccesssystem ADD field10 LVARCHAR(1000);
comment on column TAACCESSSYSTEM.FIELD01 is '扩展字段01';
comment on column TAACCESSSYSTEM.FIELD02 is '扩展字段02';
comment on column TAACCESSSYSTEM.FIELD03 is '扩展字段03';
comment on column TAACCESSSYSTEM.FIELD04 is '扩展字段04';
comment on column TAACCESSSYSTEM.FIELD05 is '扩展字段05';
comment on column TAACCESSSYSTEM.FIELD06 is '扩展字段06';
comment on column TAACCESSSYSTEM.FIELD07 is '扩展字段07';
comment on column TAACCESSSYSTEM.FIELD08 is '扩展字段08';
comment on column TAACCESSSYSTEM.FIELD09 is '扩展字段09';
comment on column TAACCESSSYSTEM.FIELD10 is '扩展字段10';

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
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, system, newtype) VALUES ('学历', 'EDUCATION', '初中及以下', '1', NULL, 10, '0', NULL, NULL, NULL, current, '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, system, newtype) VALUES ('学历', 'EDUCATION', '中专/中技', '2', NULL, 20, '0', NULL, NULL, NULL, current, '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, system, newtype) VALUES ('学历', 'EDUCATION', '高中', '3', NULL, 30, '0', NULL, NULL, NULL, current, '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, system, newtype) VALUES ('学历', 'EDUCATION', '大专', '4', NULL, 40, '0', NULL, NULL, NULL, current, '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, system, newtype) VALUES ('学历', 'EDUCATION', '本科', '5', NULL, 50, '0', NULL, NULL, NULL, current, '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, system, newtype) VALUES ('学历', 'EDUCATION', '硕士', '6', NULL, 60, '0', NULL, NULL, NULL, current, '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, system, newtype) VALUES ('学历', 'EDUCATION', '博士', '7', NULL, 70, '0', NULL, NULL, NULL, current, '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');

-- 调整url独立授权表的主键
ALTER TABLE taroleurlauthority DROP CONSTRAINT PK_TAROLEURLAUTHORITY;
ALTER TABLE taroleurlauthority ADD CONSTRAINT PK_TAROLEURLAUTHORITY PRIMARY KEY (ROLEID,URLID,RESOURCEID);