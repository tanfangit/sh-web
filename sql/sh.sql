CREATE TABLE `sh_user` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `realname` varchar(255) DEFAULT NULL COMMENT '真实名称',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `portrait` varchar(250) DEFAULT NULL COMMENT '头像',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(100) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL COMMENT '邮件',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `status` varchar(255) DEFAULT NULL COMMENT '系统用户的状态',
  `create_by` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sys_user_username` (`username`),
  UNIQUE KEY `idx_sys_user_email` (`email`),
  UNIQUE KEY `idx_sys_user_phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `sh_role` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `code` varchar(255) DEFAULT NULL COMMENT '英文名称',
  `is_sys` varchar(64) DEFAULT NULL COMMENT '是否系统数据',
  `usable` varchar(64) DEFAULT NULL COMMENT '是否可用',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_role_del_flag` (`del_flag`),
  KEY `sys_role_enname` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

CREATE TABLE `sh_user_role` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `user_id` varchar(32) NOT NULL COMMENT '用户编号',
  `role_id` varchar(32) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`id`),
  KEY `sys_user_role_userid` (`user_id`),
  KEY `sys_user_role_roleid` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-角色';

CREATE TABLE `sh_menu` (
  `id` varchar(32) NOT NULL,
  `name` varchar(100) DEFAULT NULL COMMENT '资源路径',
  `type` varchar(50) DEFAULT NULL COMMENT '资源类型',
  `url` varchar(200) DEFAULT NULL COMMENT '点击后前往的地址',
  `parent_id` varchar(32) DEFAULT NULL COMMENT '父编号',
  `parent_ids` varchar(1000) DEFAULT NULL COMMENT '父编号列表',
  `permission` varchar(100) DEFAULT NULL COMMENT '权限字符串',
  `isshow` tinyint(1) DEFAULT '0' COMMENT '是否显示',
  `sort` int(5) DEFAULT NULL COMMENT '排序',
  `menu_icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `remarks` varchar(255) DEFAULT NULL COMMENT '摘要',
  `create_by` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `del_flag` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sys_resource_parent_id` (`parent_id`),
  KEY `idx_sys_resource_parent_ids` (`parent_ids`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `sh_role_menu` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `menu_id` varchar(32) NOT NULL COMMENT '菜单编号',
  `role_id` varchar(32) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`id`),
  KEY `sh_role_menu_menuid` (`menu_id`),
  KEY `sh_role_menu_roleid` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-菜单';

INSERT INTO `sh_user` VALUES ('40288ab85ce3c20a015ce3ca6df60000', '测试用户', 'test', NULL, '947bae5be3028b93fce10e38e56500f5', 'fb58966ee87eb054165fe59d033f436d', 'test@qq.com', '15085980308', '1', NULL, NULL, '4028ea815a3d2a8c015a3d2f8d2a0002', '2017-7-22 23:25:25', NULL, '0');
INSERT INTO `sh_user` VALUES ('4028ea815a3d2a8c015a3d2f8d2a0002', '系统管理员', 'admin', 'upload/2017/07/06/1499311798749.jpg', 'ae8b5fbb3b5496c87b52fab896db7830', '78cb8d7012d98c91f98963e803fe68bd', 'test2@qq.com', '14785571304', '1', NULL, NULL, NULL, NULL, NULL, '0');

INSERT INTO `sh_role` VALUES ('402880e45b5d7636015b5d8baca60000', '普通用户', 'normal', '1', '1', NULL, '2017-4-11 23:04:46', '4028ea815a3d2a8c015a3d2f8d2a0002', '2017-7-6 08:20:00', '', '0');
INSERT INTO `sh_role` VALUES ('40288ab85a362150015a3675ca950006', '系统管理员', 'admin', '1', '1', NULL, '2017-2-13 15:52:53', NULL, '2017-2-15 14:31:15', '系统管理员', '0');

INSERT INTO `sh_user_role` VALUES ('07fa904d9dc941eda2e1aaa898972437', '40288ab85ce3c20a015ce3ca6df60000', '402880e45b5d7636015b5d8baca60000');
INSERT INTO `sh_user_role` VALUES ('40288ab85d159689015d159aa13d0002', '4028ea815a3d2a8c015a3d2f8d2a0002', '402880e45b5d7636015b5d8baca60000');
INSERT INTO `sh_user_role` VALUES ('40288ab85d159689015d159aa1400003', '4028ea815a3d2a8c015a3d2f8d2a0002', '40288ab85a362150015a3675ca950006');

INSERT INTO `sh_menu` VALUES ('40281e815beda90f015bedcf7102000f', '计划任务', NULL, 'task/schedulejob', '40288ab85cf8276b015cf82debcb005b', '40288ab85cf8276b015cf82debcb005b/', 'task:schedulejob:list', 1, 4, '', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40281e815c097acf015c097bcaea0000', '用户最后在线情况', NULL, 'sys/lastOnline', '4028ea815a701416015a7075b4f9001f', '4028ea815a701416015a7075b4f9001f/', 'sys:userlastonline', 1, 2, '', '用户最后在线情况', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40281e815c547c32015c54a21e260038', '生成案列', NULL, '', '4028ea815a78e9e6015a78f1dc9d0000', '4028ea815a78e9e6015a78f1dc9d0000/', '', 1, 3, '', '生成案列', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40281e815c54d147015c54daf16c0001', '系统日志', NULL, 'sys/log', '4028ea815a701416015a7075b4f9001f', '4028ea815a701416015a7075b4f9001f/', 'sys:log', 1, 6, 'fa-book', '系统日志', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40281e815c580ea3015c58c8635d0037', '测试单表', NULL, 'test/singletable', '40281e815c547c32015c54a21e260038', '4028ea815a78e9e6015a78f1dc9d0000/40281e815c547c32015c54a21e260038/', 'test:singletable', 1, 1, '', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40281e815c880c25015c880d29870001', '短信发送', NULL, 'sms/send/sms', '40288ab85c8593cd015c859f47960016', '40288ab85c8593cd015c859f47960016/', 'sms:send', 1, 3, '', '短信发送', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40281e815c8f3512015c8f41cea7001b', '发送日志', NULL, 'email/emailsendlog', '40288ab85bea9452015beaa7f25a0000', '40288ab85bea9452015beaa7f25a0000/', 'email:emailsendlog', 1, 4, '', '发送日志', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40281e815c8f3512015c8f4233fc001c', '邮件模版', NULL, 'email/emailtemplate', '40288ab85bea9452015beaa7f25a0000', '40288ab85bea9452015beaa7f25a0000/', 'email:emailtemplate', 1, 3, '', '模板配置', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40281e815c8f3512015c8f5cc7220040', '邮件发送', NULL, 'email/send/email', '40288ab85bea9452015beaa7f25a0000', '40288ab85bea9452015beaa7f25a0000/', 'email:send', 1, 2, '', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40281e815c912406015c9149f7b80044', '通知公告', NULL, '', NULL, NULL, '', 1, 5, 'fa-television', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40281e815c912406015c914a1bc30045', '通知公告', NULL, 'oa/oanotification', '40281e815c912406015c9149f7b80044', '40281e815c912406015c9149f7b80044/', 'oa:oanotification', 1, 1, '', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40281e815cef1f76015cef268ff0000e', '测试树', NULL, 'test/testtree', '40281e815c547c32015c54a21e260038', '4028ea815a78e9e6015a78f1dc9d0000/40281e815c547c32015c54a21e260038/', 'test:testtree', 1, 1, '', '测试树', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40288ab85a5eecc6015a5ef22ad80001', '系统设置', NULL, '', NULL, NULL, '', 1, 2, 'fa-gear', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40288ab85a5eecc6015a5ef6ce870002', '用户管理', NULL, 'sys/user', '40288ab85a5eecc6015a5ef22ad80001', '40288ab85a5eecc6015a5ef22ad80001/', 'sys:user:list', 1, 1, 'fa-tv', 'sdfdsfsdfsdfsdfsdfsf', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40288ab85a5eecc6015a5ef8f2890003', '部门管理', NULL, 'sys/organization', '40288ab85a5eecc6015a5ef22ad80001', '40288ab85a5eecc6015a5ef22ad80001/', 'sys:organization:list', 1, 2, 'fa-balance-scale', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40288ab85a5eecc6015a5ef95c700004', '角色管理', NULL, 'sys/role', '40288ab85a5eecc6015a5ef22ad80001', '40288ab85a5eecc6015a5ef22ad80001/', 'sys:role:list', 1, 3, 'fa-amazon', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40288ab85a5eecc6015a5ef9f6160005', '菜单管理', NULL, 'sys/menu', '40288ab85a5eecc6015a5ef22ad80001', '40288ab85a5eecc6015a5ef22ad80001/', 'sys:menu:list', 1, 4, 'fa-balance-scale', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40288ab85a5eecc6015a5efaa75d0006', '数据字典', NULL, 'sys/dict/group', '40288ab85a5eecc6015a5ef22ad80001', '40288ab85a5eecc6015a5ef22ad80001/', 'sys:dict:list', 1, 5, 'fa-amazon', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40288ab85b604adf015b605023a70000', '在线用户', NULL, 'sys/online', '4028ea815a701416015a7075b4f9001f', '4028ea815a701416015a7075b4f9001f/', 'sys:online:list', 1, 1, '', '在线用户', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40288ab85bea9452015beaa7f25a0000', '邮箱设置', NULL, '', NULL, NULL, '', 1, 5, 'fa-envelope', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40288ab85bea9452015beaa846180001', '参数设置', NULL, 'sys/setting/email', '40288ab85bea9452015beaa7f25a0000', '40288ab85bea9452015beaa7f25a0000/', 'sys:setting:email', 1, NULL, '', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40288ab85bea9452015beaa9e7a70002', '参数配置', NULL, 'sys/setting/sms', '40288ab85c8593cd015c859f47960016', '40288ab85c8593cd015c859f47960016/', 'sys:setting:sms', 1, 1, '', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40288ab85befd65a015bf088333a0015', '多数据源管理', NULL, 'sys/datasource', '40288ab85cf8276b015cf82debcb005b', '40288ab85cf8276b015cf82debcb005b/', 'sys:datasource:list', 1, 5, '', '动态数据源', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40288ab85c1ae76c015c1b12b68a0000', '代码案例', NULL, '', NULL, NULL, '', 1, 12, 'fa-code', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40288ab85c1ae76c015c1b1316680001', '编辑器', NULL, 'demo/form/editor', '40288ab85c1ae76c015c1b12b68a0000', '40288ab85c1ae76c015c1b12b68a0000/', '', 1, 1, '', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40288ab85c1e2442015c1e3246b70000', '文件上传', NULL, 'demo/form/upload', '40288ab85c1ae76c015c1b12b68a0000', '40288ab85c1ae76c015c1b12b68a0000/', '', 1, 2, '', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40288ab85c33548d015c33cdc5a600f3', '附件信息', NULL, 'sys/attachment', '4028ea815a701416015a7075b4f9001f', '4028ea815a701416015a7075b4f9001f/', 'sys:attachment:list', 1, 5, '', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40288ab85c3df6b7015c3e3d1e770000', '搜索自动补全', NULL, 'demo/form/combox', '40288ab85c1ae76c015c1b12b68a0000', '40288ab85c1ae76c015c1b12b68a0000/', '', 1, 3, 'fa-500px', '测试菜单', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40288ab85c8593cd015c859f47960016', '短信设置', NULL, '', NULL, NULL, '', 1, 6, 'fa-comments', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40288ab85c8593cd015c859fa3240017', '短信模版', NULL, 'sms/smstemplate', '40288ab85c8593cd015c859f47960016', '40288ab85c8593cd015c859f47960016/', 'sms:smstemplate', 1, 3, '', '短信模版', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40288ab85c85fa54015c860cee2e0023', '发送日志', NULL, 'sms/smssendlog', '40288ab85c8593cd015c859f47960016', '40288ab85c8593cd015c859f47960016/', 'sms:smssendlog', 1, 4, '', '短信发送日志', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40288ab85c9eeb5c015c9f4d1f8e0000', '统计报表', NULL, '', NULL, NULL, '', 1, 10, 'fa-bar-chart', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40288ab85c9eeb5c015c9f4e1cd00001', '折线图', NULL, '/charts/echarts/chart/line', '40288ab85c9eeb5c015c9f4d1f8e0000', '40288ab85c9eeb5c015c9f4d1f8e0000/', '', 1, 1, '', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40288ab85c9eeb5c015c9f5fa02e002a', '柱状图', NULL, '/charts/echarts/chart/bar', '40288ab85c9eeb5c015c9f4d1f8e0000', '40288ab85c9eeb5c015c9f4d1f8e0000/', '', 1, 2, '', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40288ab85c9eeb5c015c9f626f58002d', '漏斗图', NULL, '/charts/echarts/chart/funnel', '40288ab85c9eeb5c015c9f4d1f8e0000', '40288ab85c9eeb5c015c9f4d1f8e0000/', '', 1, 5, '', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40288ab85c9eeb5c015c9f62e726002e', '仪表盘', NULL, '/charts/echarts/chart/gauge', '40288ab85c9eeb5c015c9f4d1f8e0000', '40288ab85c9eeb5c015c9f4d1f8e0000/', '', 1, 6, '', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40288ab85c9eeb5c015c9f6390fd002f', 'K线图', NULL, '/charts/echarts/chart/k', '40288ab85c9eeb5c015c9f4d1f8e0000', '40288ab85c9eeb5c015c9f4d1f8e0000/', '', 1, 7, '', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40288ab85c9eeb5c015c9f6572630030', '饼状图', NULL, '/charts/echarts/chart/pie', '40288ab85c9eeb5c015c9f4d1f8e0000', '40288ab85c9eeb5c015c9f4d1f8e0000/', '', 1, 7, '', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40288ab85c9eeb5c015c9f65e3a50031', '雷达图', NULL, '/charts/echarts/chart/radar', '40288ab85c9eeb5c015c9f4d1f8e0000', '40288ab85c9eeb5c015c9f4d1f8e0000/', '', 1, 9, '', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40288ab85c9eeb5c015c9f672f2e0032', '散点图', NULL, '/charts/echarts/chart/scatter', '40288ab85c9eeb5c015c9f4d1f8e0000', '40288ab85c9eeb5c015c9f4d1f8e0000/', '', 1, 9, '', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40288ab85c9eeb5c015c9f9694480064', '关系图', NULL, '/charts/echarts/chart/circular', '40288ab85c9eeb5c015c9f4d1f8e0000', '40288ab85c9eeb5c015c9f4d1f8e0000/', '', 1, 11, '', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40288ab85cf81b04015cf8213da10002', '一对多', NULL, 'test/testordermain', '40281e815c547c32015c54a21e260038', '4028ea815a78e9e6015a78f1dc9d0000/40281e815c547c32015c54a21e260038/', 'test:testordermain', 1, 1, '', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('40288ab85cf8276b015cf82debcb005b', '常见工具', NULL, '', NULL, NULL, '', 1, 4, 'fa-binoculars', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('4028ea815a701416015a7075b4f9001f', '系统监控', NULL, '', NULL, NULL, '', 1, 3, 'fa-video-camera', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('4028ea815a701416015a70766a7a0020', '数据库监控', NULL, 'monitor/druid', '4028ea815a701416015a7075b4f9001f', '4028ea815a701416015a7075b4f9001f/', 'monitor:druid:index', 1, 3, '', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('4028ea815a78e9e6015a78f1dc9d0000', '代码生成器', NULL, '', NULL, NULL, '', 1, 1, 'fa-file-code-o', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `sh_menu` VALUES ('4028ea815a78e9e6015a78f35cbe0001', '表单配置', NULL, 'codegen/table', '4028ea815a78e9e6015a78f1dc9d0000', '4028ea815a78e9e6015a78f1dc9d0000/', 'codegen:table:list', 1, 1, '', '', NULL, NULL, NULL, NULL, '0');

INSERT INTO `sh_role_menu` VALUES ('045e9154a8c14e1a8a37629d2b69e5d2', '40281e815c912406015c9149f7b80044', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('06cdd56c4de24e65b8bd2110123d58c8', '40288ab85c9eeb5c015c9f6390fd002f', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('0aae925fae234f9490c4848d03e2fee7', '40288ab85b604adf015b605023a70000', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('1e922261bf714fb7b9c3b69f424be1ce', '40288ab85c33548d015c33cdc5a600f3', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('1ea66a37c5e64b6a9a7176016723d9d3', '40288ab85c9eeb5c015c9f672f2e0032', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('26cd377a5c3d4a0496fcc7f110ec7b3b', '40281e815c097acf015c097bcaea0000', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('2b5797f7c514460b8abadfb382c5b692', '40288ab85c9eeb5c015c9f6572630030', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('3a618256295e4810a7ee82865b09fce3', '40288ab85c1e2442015c1e3246b70000', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('40288ab85cf80b14015cf8138103002e', '40281e815c912406015c9149f7b80044', '402880e45b5d7636015b5d8baca60000');
INSERT INTO `sh_role_menu` VALUES ('40288ab85cf80b14015cf8138105002f', '40281e815c912406015c914a1bc30045', '402880e45b5d7636015b5d8baca60000');
INSERT INTO `sh_role_menu` VALUES ('40288ab85cf80b14015cf81381050030', '40288ab85a5eecc6015a5ef22ad80001', '402880e45b5d7636015b5d8baca60000');
INSERT INTO `sh_role_menu` VALUES ('40288ab85cf80b14015cf81381050031', '40288ab85a5eecc6015a5ef9f6160005', '402880e45b5d7636015b5d8baca60000');
INSERT INTO `sh_role_menu` VALUES ('40288ab85cf80b14015cf81381050032', '40288ab85a5eecc6015a5efaa75d0006', '402880e45b5d7636015b5d8baca60000');
INSERT INTO `sh_role_menu` VALUES ('40288ab85cf80b14015cf81381060033', '40288ab85c8593cd015c859f47960016', '402880e45b5d7636015b5d8baca60000');
INSERT INTO `sh_role_menu` VALUES ('40288ab85cf80b14015cf81381060034', '40281e815c880c25015c880d29870001', '402880e45b5d7636015b5d8baca60000');
INSERT INTO `sh_role_menu` VALUES ('40288ab85cf80b14015cf81381060035', '40288ab85bea9452015beaa9e7a70002', '402880e45b5d7636015b5d8baca60000');
INSERT INTO `sh_role_menu` VALUES ('40288ab85cf80b14015cf81381060036', '40288ab85c8593cd015c859fa3240017', '402880e45b5d7636015b5d8baca60000');
INSERT INTO `sh_role_menu` VALUES ('40288ab85cf80b14015cf81381060037', '40288ab85c85fa54015c860cee2e0023', '402880e45b5d7636015b5d8baca60000');
INSERT INTO `sh_role_menu` VALUES ('4028ea815a701416015a7080f45b0030', '40288ab85a5eecc6015a5ef22ad80001', '40288ab85a406a03015a40781a6e0000');
INSERT INTO `sh_role_menu` VALUES ('4028ea815a701416015a7080f45d0031', '40288ab85a5eecc6015a5ef8f2890003', '40288ab85a406a03015a40781a6e0000');
INSERT INTO `sh_role_menu` VALUES ('4028ea815a701416015a7080f45d0032', '40288ab85a5eecc6015a5ef95c700004', '40288ab85a406a03015a40781a6e0000');
INSERT INTO `sh_role_menu` VALUES ('4028ea815a701416015a7080f45d0033', '40288ab85a5eecc6015a5ef9f6160005', '40288ab85a406a03015a40781a6e0000');
INSERT INTO `sh_role_menu` VALUES ('4028ea815a701416015a7080f45d0034', '40288ab85a5eecc6015a5efaa75d0006', '40288ab85a406a03015a40781a6e0000');
INSERT INTO `sh_role_menu` VALUES ('4028ea815a701416015a7080f45d0035', '4028ea815a701416015a7075b4f9001f', '40288ab85a406a03015a40781a6e0000');
INSERT INTO `sh_role_menu` VALUES ('4028ea815a701416015a7080f45e0036', '4028ea815a701416015a70766a7a0020', '40288ab85a406a03015a40781a6e0000');
INSERT INTO `sh_role_menu` VALUES ('46644aa9b872491cb9c0a871df31d5be', '40288ab85c9eeb5c015c9f4d1f8e0000', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('4b004fb16ad64110a04a181aac4cc0f7', '40288ab85a5eecc6015a5efaa75d0006', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('4d7bf5c02d09408b9ab6a6dfc2a6f186', '40288ab85bea9452015beaa9e7a70002', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('4e90a193575c4e618b101e87fb8ca07b', '40288ab85c1ae76c015c1b12b68a0000', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('58cc45046ab145ad8f791df1453025df', '40288ab85cf8276b015cf82debcb005b', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('5b19946425bf41bc9909ac0f205dda15', '4028ea815a78e9e6015a78f1dc9d0000', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('5f9f4ae6b820458c832ea774569320c1', '40288ab85c9eeb5c015c9f62e726002e', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('5fbad80054e74d8a865f3a8d86f8ad4f', '40281e815c8f3512015c8f4233fc001c', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('6681d0add432416886e4a83a2cd71a10', '40281e815cef1f76015cef268ff0000e', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('70ff3de593ab4024b09a1e1d1007388f', '40281e815c912406015c914a1bc30045', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('75c0148853b247a58e4e3fe06671c59e', '40288ab85a5eecc6015a5ef95c700004', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('764c7f3aa59b491e9acc9e9749110197', '40281e815beda90f015bedcf7102000f', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('7f19c52e3e1a48b39faa376865c932ec', 'fbd497ee95904388b40d29c4e7c85fa2', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('803e8668b69a422990cf9d7c30fbf93e', '40288ab85a5eecc6015a5ef9f6160005', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('82b5ebb4c9a647e6a667ff6906a231ec', '40288ab85c8593cd015c859fa3240017', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('84de55ae99ba457694976501370079b6', '40288ab85befd65a015bf088333a0015', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('90d3016ffa464d65a263f7236ff9b481', '24277aae46044082a6d13382f45fac5e', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('96e16722f83b474cae4ec20d762fe5fa', '40281e815c580ea3015c58c8635d0037', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('99d85041f2054a2a9eaed4811cc7858b', '40288ab85c1ae76c015c1b1316680001', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('9b0b50db51c34311b6453c17238a1eea', 'cb243770ba8843e297580f9e87db3afe', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('9b6b973245d64f799aff97d445887151', '4028ea815a701416015a7075b4f9001f', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('9dc4dd19a83c43c1ada494d5ec8714a6', '40288ab85a5eecc6015a5ef6ce870002', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('aaa0f58e0a4c48a6bb4fe7980bbdc38f', '40281e815c880c25015c880d29870001', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('acec4e4d63d54b5bbdfaf0e070859e99', '40288ab85c8593cd015c859f47960016', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('ae6636b84c124068ab2e4720dbc218bd', '40288ab85bea9452015beaa846180001', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('b650f6557bb949a1b069723e74792355', '40288ab85c9eeb5c015c9f5fa02e002a', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('b7efa05ea3744785b6637d6974bf5455', '40288ab85c9eeb5c015c9f65e3a50031', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('b8e7ad202dc84ce9b08b0cef6bcc1b7c', '40288ab85cf81b04015cf8213da10002', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('bd1b57f90c984f9cb46e09c48bb7a75d', '40281e815c8f3512015c8f5cc7220040', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('be535be5febd48ba8cf7b1d5a0b9859f', '40288ab85c9eeb5c015c9f9694480064', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('cbcdb08bce454302898f27f7b6ccbbbc', '40288ab85bea9452015beaa7f25a0000', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('cde97ea9cb73423fa61cfe7c12746fd9', '40288ab85c9eeb5c015c9f626f58002d', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('d962b01fcd2144f1a22fc9c431b7d399', '4028ea815a78e9e6015a78f35cbe0001', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('dc221368afc4498f93505f0eaf3f26de', '14f02c7b9d9140b5a8deab457ec59f1d', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('e455dcbf18a04daa8af55f0266a784ad', '40288ab85c9eeb5c015c9f4e1cd00001', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('ec7a5f55eae74f8ca290cd5731b4b956', '40281e815c54d147015c54daf16c0001', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('ed022243781447c0b0022cc102b7a2cf', '4028ea815a701416015a70766a7a0020', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('eebed0463b094950a484aacd2f2ef80e', '40288ab85c85fa54015c860cee2e0023', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('efe83857624845948bfcdd0f7825a08b', '40288ab85c3df6b7015c3e3d1e770000', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('f75bfab4fb9447a9a4340aa2a59d20ed', '40281e815c547c32015c54a21e260038', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('fa61d2dc0968475f83bbad6617b2e33d', '40288ab85a5eecc6015a5ef8f2890003', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('fe4b6ce2a2514b458b8e5f11b218d797', '40281e815c8f3512015c8f41cea7001b', '40288ab85a362150015a3675ca950006');
INSERT INTO `sh_role_menu` VALUES ('ff0f095578b04648899a362c2ad46079', '40288ab85a5eecc6015a5ef22ad80001', '40288ab85a362150015a3675ca950006');

CREATE TABLE `sh_organization` (
  `id` varchar(32) NOT NULL,
  `name` varchar(100) DEFAULT NULL COMMENT '机构名称',
  `parent_id` varchar(32) DEFAULT NULL COMMENT '父节点',
  `parent_ids` varchar(1000) DEFAULT NULL COMMENT '父节点路径',
  `create_by` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `del_flag` char(1) DEFAULT NULL COMMENT '删除标记',
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sys_organization_parent_id` (`parent_id`),
  KEY `idx_sys_organization_parent_ids` (`parent_ids`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sh_user_organization` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `user_id` varchar(32) NOT NULL COMMENT '用户主键',
  `organization_id` varchar(32) NOT NULL COMMENT '部门主键',
  PRIMARY KEY (`id`),
  KEY `sys_user_role_userid` (`user_id`),
  KEY `sys_user_role_roleid` (`organization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-部门';

INSERT INTO `sh_organization` VALUES ('40288ab85b6080e1015b60996d690005', '数立行', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sh_organization` VALUES ('4028ea815a452f69015a45346f7b0001', '研发部', '40288ab85b6080e1015b60996d690005', '40288ab85b6080e1015b60996d690005/', NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO `sh_user_organization` VALUES ('40281e815cfc4624015cfcc8c640000e', '40288ab85cf6aab4015cf6ecea890000', '40288ab85c20329e015c2037a7800003');
INSERT INTO `sh_user_organization` VALUES ('40281e815cfc4624015cfcc8c641000f', '40288ab85cf6aab4015cf6ecea890000', '40288ab85c20329e015c2037d2090004');
INSERT INTO `sh_user_organization` VALUES ('40281e815cfc4624015cfcdff7f1006b', '4028ea815a3d2a8c015a3d2f8d2a0002', '40288ab85c20329e015c2037a7800003');
INSERT INTO `sh_user_organization` VALUES ('40281e815cfc4624015cfce005b3006e', '40281e815cfc4624015cfcce3d310029', '4028ea815a452f69015a45346f7b0001');
INSERT INTO `sh_user_organization` VALUES ('40288ab85d159689015d159aa14b0004', '4028ea815a3d2a8c015a3d2f8d2a0002', '40288ab85b6080e1015b60996d690005');
INSERT INTO `sh_user_organization` VALUES ('97ff87247a1a4293b7a17f29e9fab66d', '40288ab85ce3c20a015ce3ca6df60000', '4028ea815a452f69015a45346f7b0001');

CREATE TABLE `sh_user_last_online` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `uid` varchar(100) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `user_agent` varchar(200) DEFAULT NULL,
  `system_host` varchar(100) DEFAULT NULL,
  `last_login_timestamp` datetime DEFAULT '0000-00-00 00:00:00',
  `last_stop_timestamp` datetime DEFAULT NULL,
  `login_count` bigint(20) DEFAULT NULL,
  `total_online_time` bigint(20) DEFAULT NULL,
  `create_by` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_sh_user_last_online_sh_user_id` (`user_id`),
  KEY `idx_sh_user_last_online_username` (`username`),
  KEY `idx_sh_user_last_online_host` (`host`),
  KEY `idx_sh_user_last_online_system_host` (`system_host`),
  KEY `idx_sh_user_last_online_last_login_timestamp` (`last_login_timestamp`),
  KEY `idx_sh_user_last_online_last_stop_timestamp` (`last_stop_timestamp`),
  KEY `idx_sh_user_last_online_user_agent` (`user_agent`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;



CREATE TABLE `sh_user_online` (
  `id` varchar(100) NOT NULL,
  `user_id` varchar(32) DEFAULT '',
  `username` varchar(100) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `system_host` varchar(100) DEFAULT NULL,
  `user_agent` varchar(200) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `start_timestsamp` datetime DEFAULT '0000-00-00 00:00:00',
  `last_access_time` datetime DEFAULT '0000-00-00 00:00:00',
  `online_timeout` bigint(20) DEFAULT NULL,
  `online_session` mediumtext,
  `create_by` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sh_user_online_sys_user_id` (`user_id`),
  KEY `idx_sh_user_online_username` (`username`),
  KEY `idx_sh_user_online_host` (`host`),
  KEY `idx_sh_user_online_system_host` (`system_host`),
  KEY `idx_sh_user_online_start_timestsamp` (`start_timestsamp`),
  KEY `idx_sh_user_online_last_access_time` (`last_access_time`),
  KEY `idx_sh_user_online_user_agent` (`user_agent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TRIGGER `trigger_sh_user_off_online` AFTER DELETE ON `sh_user_online` FOR EACH ROW begin
   if OLD.`user_id` is not null then
      if not exists(select `user_id` from `sh_user_last_online` where `user_id` = OLD.`user_id`) then
        insert into `sh_user_last_online`
                  (`user_id`, `username`, `uid`, `host`, `user_agent`, `system_host`,
                   `last_login_timestamp`, `last_stop_timestamp`, `login_count`, `total_online_time`)
                values
                   (OLD.`user_id`,OLD.`username`, OLD.`id`, OLD.`host`, OLD.`user_agent`, OLD.`system_host`,
                    OLD.`start_timestsamp`, OLD.`last_access_time`,
                    1, (OLD.`last_access_time` - OLD.`start_timestsamp`));
      else
        update `sh_user_last_online`
          set `username` = OLD.`username`, `uid` = OLD.`id`, `host` = OLD.`host`, `user_agent` = OLD.`user_agent`,
            `system_host` = OLD.`system_host`, `last_login_timestamp` = OLD.`start_timestsamp`,
             `last_stop_timestamp` = OLD.`last_access_time`, `login_count` = `login_count` + 1,
             `total_online_time` = `total_online_time` + (OLD.`last_access_time` - OLD.`start_timestsamp`)
        where `user_id` = OLD.`user_id`;
      end if ;
   end if;
end;


