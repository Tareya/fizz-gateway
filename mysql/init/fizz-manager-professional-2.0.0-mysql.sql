-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.7.22-log - MySQL Community Server (GPL)
-- 服务器操作系统:                      linux-glibc2.12
-- HeidiSQL 版本:                  10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 fizz_manager 的数据库结构
CREATE DATABASE IF NOT EXISTS `fizz_manager` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `fizz_manager`;

-- 导出  表 fizz_manager.blade_client 结构
CREATE TABLE IF NOT EXISTS `blade_client` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `client_id` varchar(48) NOT NULL COMMENT '客户端id',
  `client_secret` varchar(256) NOT NULL COMMENT '客户端密钥',
  `resource_ids` varchar(256) DEFAULT NULL COMMENT '资源集合',
  `scope` varchar(256) NOT NULL COMMENT '授权范围',
  `authorized_grant_types` varchar(256) NOT NULL COMMENT '授权类型',
  `web_server_redirect_uri` varchar(256) DEFAULT NULL COMMENT '回调地址',
  `authorities` varchar(256) DEFAULT NULL COMMENT '权限',
  `access_token_validity` int(11) NOT NULL COMMENT '令牌过期秒数',
  `refresh_token_validity` int(11) NOT NULL COMMENT '刷新令牌过期秒数',
  `additional_information` varchar(4096) DEFAULT NULL COMMENT '附加说明',
  `autoapprove` varchar(256) DEFAULT NULL COMMENT '自动授权',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) NOT NULL COMMENT '状态',
  `is_deleted` int(2) NOT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户端表';

-- 正在导出表  fizz_manager.blade_client 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `blade_client` DISABLE KEYS */;
INSERT INTO `blade_client` (`id`, `client_id`, `client_secret`, `resource_ids`, `scope`, `authorized_grant_types`, `web_server_redirect_uri`, `authorities`, `access_token_validity`, `refresh_token_validity`, `additional_information`, `autoapprove`, `create_user`, `create_dept`, `create_time`, `update_user`, `update_time`, `status`, `is_deleted`) VALUES
	(1123598811738675201, 'fizz', 'fizz_secret', '', 'all', 'refresh_token,password,authorization_code,captcha', 'http://localhost:8888', '', 3600, 604800, '', '', 1123598815738675201, 1123598813738675201, '2019-03-24 10:40:55', 1123598821738675201, '2020-05-14 14:20:12', 1, 0),
	(1123598811738675202, 'saber', 'saber_secret', NULL, 'all', 'refresh_token,password,authorization_code,captcha', 'http://localhost:8080', NULL, 3600, 604800, NULL, NULL, 1123598815738675201, 1123598813738675201, '2019-03-24 10:42:29', 1123598821738675201, '2020-05-14 14:31:41', 1, 1);
/*!40000 ALTER TABLE `blade_client` ENABLE KEYS */;

-- 导出  表 fizz_manager.blade_code 结构
CREATE TABLE IF NOT EXISTS `blade_code` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `datasource_id` bigint(64) DEFAULT NULL COMMENT '数据源主键',
  `service_name` varchar(64) DEFAULT NULL COMMENT '服务名称',
  `code_name` varchar(64) DEFAULT NULL COMMENT '模块名称',
  `table_name` varchar(64) DEFAULT NULL COMMENT '表名',
  `table_prefix` varchar(64) DEFAULT NULL COMMENT '表前缀',
  `pk_name` varchar(32) DEFAULT NULL COMMENT '主键名',
  `package_name` varchar(500) DEFAULT NULL COMMENT '后端包名',
  `base_mode` int(2) DEFAULT NULL COMMENT '基础业务模式',
  `wrap_mode` int(2) DEFAULT NULL COMMENT '包装器模式',
  `api_path` varchar(2000) DEFAULT NULL COMMENT '后端路径',
  `web_path` varchar(2000) DEFAULT NULL COMMENT '前端路径',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='代码生成表';

-- 正在导出表  fizz_manager.blade_code 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `blade_code` DISABLE KEYS */;
INSERT INTO `blade_code` (`id`, `datasource_id`, `service_name`, `code_name`, `table_name`, `table_prefix`, `pk_name`, `package_name`, `base_mode`, `wrap_mode`, `api_path`, `web_path`, `is_deleted`) VALUES
	(1123598812738675201, 1161483357481541634, 'blade-demo', '通知公告', 'blade_notice', 'blade_', 'id', 'org.springblade.desktop', 1, 1, 'D:\\Develop\\WorkSpace\\Git\\SpringBlade\\blade-ops\\blade-develop', 'D:\\Develop\\WorkSpace\\Git\\Sword', 0);
/*!40000 ALTER TABLE `blade_code` ENABLE KEYS */;

-- 导出  表 fizz_manager.blade_datasource 结构
CREATE TABLE IF NOT EXISTS `blade_datasource` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `driver_class` varchar(100) DEFAULT NULL COMMENT '驱动类',
  `url` varchar(500) DEFAULT NULL COMMENT '连接地址',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='数据源配置表';

-- 正在导出表  fizz_manager.blade_datasource 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `blade_datasource` DISABLE KEYS */;
INSERT INTO `blade_datasource` (`id`, `name`, `driver_class`, `url`, `username`, `password`, `remark`, `create_user`, `create_dept`, `create_time`, `update_user`, `update_time`, `status`, `is_deleted`) VALUES
	(1161483357481541634, 'mysql', 'com.mysql.cj.jdbc.Driver', 'jdbc:mysql://localhost:3306/bladex?useSSL=false&useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&transformedBitIsBoolean=true&serverTimezone=GMT%2B8&nullCatalogMeansCurrent=true&allowPublicKeyRetrieval=true', 'root', 'root', 'mysql', 1123598821738675201, 1123598813738675201, '2019-08-14 11:43:06', 1123598821738675201, '2019-08-14 11:43:06', 1, 0),
	(1161483504353484802, 'postgresql', 'org.postgresql.Driver', 'jdbc:postgresql://127.0.0.1:5432/bladex', 'postgres', '123456', 'postgresql', 1123598821738675201, 1123598813738675201, '2019-08-14 11:43:41', 1123598821738675201, '2019-08-14 11:43:41', 1, 0),
	(1161483594023510018, 'oracle', 'oracle.jdbc.OracleDriver', 'jdbc:oracle:thin:@127.0.0.1:49161:orcl', 'BLADEX', 'bladex', 'oracle', 1123598821738675201, 1123598813738675201, '2019-08-14 11:44:03', 1123598821738675201, '2019-08-14 11:44:03', 1, 0);
/*!40000 ALTER TABLE `blade_datasource` ENABLE KEYS */;

-- 导出  表 fizz_manager.blade_dept 结构
CREATE TABLE IF NOT EXISTS `blade_dept` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `parent_id` bigint(64) DEFAULT '0' COMMENT '父主键',
  `ancestors` varchar(2000) DEFAULT NULL COMMENT '祖级列表',
  `dept_category` int(2) DEFAULT NULL COMMENT '部门类型',
  `dept_name` varchar(45) DEFAULT NULL COMMENT '部门名',
  `full_name` varchar(45) DEFAULT NULL COMMENT '部门全称',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='机构表';

-- 正在导出表  fizz_manager.blade_dept 的数据：~10 rows (大约)
/*!40000 ALTER TABLE `blade_dept` DISABLE KEYS */;
INSERT INTO `blade_dept` (`id`, `tenant_id`, `parent_id`, `ancestors`, `dept_category`, `dept_name`, `full_name`, `sort`, `remark`, `is_deleted`) VALUES
	(1260823335286165505, '000000', 0, '0', 1, 'Fizz-Gateway公司', 'Fizz-Gateway公司', 1, '', 0),
	(1260823498956296193, '000000', 1260823335286165505, '0,1260823335286165505', 2, '部门1', '部门1', 1, '', 0),
	(1260823566425870338, '000000', 1260823335286165505, '0,1260823335286165505', NULL, '部门2', '部门2', 1, '', 1),
	(1260823600663973890, '000000', 1260823335286165505, '0,1260823335286165505', NULL, '部门3', '部门3', 1, '', 1),
	(1260831412349652993, '000000', 1260823498956296193, '0,1260823335286165505,1260823498956296193', 3, '部门4', '部门4', 1, '', 0),
	(1260831623927123970, '000000', 1260823498956296193, '0,1260823335286165505,1260823498956296193', 3, '部门5', '部门5', 1, '', 0),
	(1260831689035304962, '000000', 1260823498956296193, '0,1260823335286165505,1260823498956296193', 3, '部门6', '部门6', 2, '', 0),
	(1282913633092820994, '000000', 1260823498956296193, '0,1260823335286165505,1260823498956296193', 2, '部门7', '部门7', 6, '', 0),
	(1282913739351318529, '000000', 1260823498956296193, '0,1260823335286165505,1260823498956296193', 2, '部门8', '部门8', 8, '', 0),
	(1282914209750900737, '000000', 1260823498956296193, '0,1260823335286165505,1260823498956296193', 2, '部门9', '部门9', 8, '', 0);
/*!40000 ALTER TABLE `blade_dept` ENABLE KEYS */;

-- 导出  表 fizz_manager.blade_dict 结构
CREATE TABLE IF NOT EXISTS `blade_dict` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `parent_id` bigint(64) DEFAULT '0' COMMENT '父主键',
  `code` varchar(255) DEFAULT NULL COMMENT '字典码',
  `dict_key` varchar(255) DEFAULT NULL COMMENT '字典值',
  `dict_value` varchar(255) DEFAULT NULL COMMENT '字典名称',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '字典备注',
  `is_sealed` int(2) DEFAULT '0' COMMENT '是否已封存',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='字典表';

-- 正在导出表  fizz_manager.blade_dict 的数据：~54 rows (大约)
/*!40000 ALTER TABLE `blade_dict` DISABLE KEYS */;
INSERT INTO `blade_dict` (`id`, `parent_id`, `code`, `dict_key`, `dict_value`, `sort`, `remark`, `is_sealed`, `is_deleted`) VALUES
	(1123598814738675201, 0, 'sex', '-1', '性别', 1, NULL, 0, 0),
	(1123598814738675202, 1123598814738675201, 'sex', '1', '男', 1, NULL, 0, 0),
	(1123598814738675203, 1123598814738675201, 'sex', '2', '女', 2, NULL, 0, 0),
	(1123598814738675204, 0, 'notice', '-1', '通知类型', 2, NULL, 0, 0),
	(1123598814738675205, 1123598814738675204, 'notice', '1', '发布通知', 1, NULL, 0, 0),
	(1123598814738675206, 1123598814738675204, 'notice', '2', '批转通知', 2, NULL, 0, 0),
	(1123598814738675207, 1123598814738675204, 'notice', '3', '转发通知', 3, NULL, 0, 0),
	(1123598814738675208, 1123598814738675204, 'notice', '4', '指示通知', 4, NULL, 0, 0),
	(1123598814738675209, 1123598814738675204, 'notice', '5', '任免通知', 5, NULL, 0, 0),
	(1123598814738675210, 1123598814738675204, 'notice', '6', '事务通知', 6, NULL, 0, 0),
	(1123598814738675211, 0, 'menu_category', '-1', '菜单类型', 3, NULL, 0, 0),
	(1123598814738675212, 1123598814738675211, 'menu_category', '1', '菜单', 1, NULL, 0, 0),
	(1123598814738675213, 1123598814738675211, 'menu_category', '2', '按钮', 2, NULL, 0, 0),
	(1123598814738675214, 0, 'button_func', '-1', '按钮功能', 4, NULL, 0, 0),
	(1123598814738675215, 1123598814738675214, 'button_func', '1', '工具栏', 1, NULL, 0, 0),
	(1123598814738675216, 1123598814738675214, 'button_func', '2', '操作栏', 2, NULL, 0, 0),
	(1123598814738675217, 1123598814738675214, 'button_func', '3', '工具操作栏', 3, NULL, 0, 0),
	(1123598814738675218, 0, 'yes_no', '-1', '是否', 5, NULL, 0, 0),
	(1123598814738675219, 1123598814738675218, 'yes_no', '1', '否', 1, NULL, 0, 0),
	(1123598814738675220, 1123598814738675218, 'yes_no', '2', '是', 2, NULL, 0, 0),
	(1123598814738675221, 0, 'flow', '-1', '流程类型', 5, NULL, 0, 0),
	(1123598814738675222, 1123598814738675221, 'flow', '1', '请假流程', 1, 'leave', 0, 0),
	(1123598814738675223, 1123598814738675221, 'flow', '2', '报销流程', 2, 'expense', 0, 0),
	(1123598814738675227, 0, 'org_category', '-1', '机构类型', 7, NULL, 0, 0),
	(1123598814738675228, 1123598814738675227, 'org_category', '1', '公司', 1, NULL, 0, 0),
	(1123598814738675229, 1123598814738675227, 'org_category', '2', '部门', 2, NULL, 0, 0),
	(1123598814738675230, 1123598814738675227, 'org_category', '3', '小组', 3, NULL, 0, 0),
	(1123598814738675231, 0, 'data_scope_type', '-1', '数据权限', 8, NULL, 0, 0),
	(1123598814738675232, 1123598814738675231, 'data_scope_type', '1', '全部可见', 1, NULL, 0, 0),
	(1123598814738675233, 1123598814738675231, 'data_scope_type', '2', '本人可见', 2, NULL, 0, 0),
	(1123598814738675234, 1123598814738675231, 'data_scope_type', '3', '所在机构可见', 3, NULL, 0, 0),
	(1123598814738675235, 1123598814738675231, 'data_scope_type', '4', '所在机构及子级可见', 4, NULL, 0, 0),
	(1123598814738675236, 1123598814738675231, 'data_scope_type', '5', '自定义', 5, NULL, 0, 0),
	(1123598814738675237, 0, 'api_scope_type', '-1', '接口权限', 10, NULL, 0, 0),
	(1123598814738675238, 1123598814738675237, 'api_scope_type', '1', '系统接口', 1, NULL, 0, 0),
	(1123598814738675239, 1123598814738675237, 'api_scope_type', '2', '业务接口', 2, NULL, 0, 0),
	(1123598814738675240, 0, 'scope_category', '-1', '权限类型', 10, NULL, 0, 0),
	(1123598814738675241, 1123598814738675240, 'scope_category', '1', '数据权限', 1, NULL, 0, 0),
	(1123598814738675242, 1123598814738675240, 'scope_category', '2', '接口权限', 2, NULL, 0, 0),
	(1123598814738676224, 0, 'oss', '-1', '对象存储类型', 6, NULL, 0, 0),
	(1123598814738676225, 1123598814738676224, 'oss', '1', 'minio', 1, NULL, 0, 0),
	(1123598814738676226, 1123598814738676224, 'oss', '2', '七牛云', 2, NULL, 0, 0),
	(1123598814738676227, 1123598814738676224, 'oss', '3', '阿里云', 3, NULL, 0, 0),
	(1123598814738676228, 1123598814738676224, 'oss', '4', '腾讯云', 4, NULL, 0, 0),
	(1123598814738677220, 0, 'sms', '-1', '短信服务类型', 11, NULL, 0, 0),
	(1123598814738677221, 1123598814738677220, 'sms', '1', '云片', 1, NULL, 0, 0),
	(1123598814738677222, 1123598814738677220, 'sms', '2', '七牛云', 2, NULL, 0, 0),
	(1123598814738677223, 1123598814738677220, 'sms', '3', '阿里云', 3, NULL, 0, 0),
	(1123598814738677224, 1123598814738677220, 'sms', '4', '腾讯云', 4, NULL, 0, 0),
	(1123598814738777220, 0, 'post_category', '-1', '岗位类型', 12, NULL, 0, 0),
	(1123598814738777221, 1123598814738777220, 'post_category', '1', '高层', 1, NULL, 0, 0),
	(1123598814738777222, 1123598814738777220, 'post_category', '2', '中层', 2, NULL, 0, 0),
	(1123598814738777223, 1123598814738777220, 'post_category', '3', '基层', 3, NULL, 0, 0),
	(1123598814738777224, 1123598814738777220, 'post_category', '4', '其他', 4, NULL, 0, 0);
/*!40000 ALTER TABLE `blade_dict` ENABLE KEYS */;

-- 导出  表 fizz_manager.blade_dict_biz 结构
CREATE TABLE IF NOT EXISTS `blade_dict_biz` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `tenant_id` varchar(12) DEFAULT NULL COMMENT '租户ID',
  `parent_id` bigint(64) DEFAULT '0' COMMENT '父主键',
  `code` varchar(255) DEFAULT NULL COMMENT '字典码',
  `dict_key` varchar(255) DEFAULT NULL COMMENT '字典值',
  `dict_value` varchar(255) DEFAULT NULL COMMENT '字典名称',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '字典备注',
  `is_sealed` int(2) DEFAULT '0' COMMENT '是否已封存',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='业务字典表';

-- 正在导出表  fizz_manager.blade_dict_biz 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `blade_dict_biz` DISABLE KEYS */;
INSERT INTO `blade_dict_biz` (`id`, `tenant_id`, `parent_id`, `code`, `dict_key`, `dict_value`, `sort`, `remark`, `is_sealed`, `is_deleted`) VALUES
	(1250711447453839362, '000000', 0, 'wel', '-1', '首页', 1, '', 0, 1);
/*!40000 ALTER TABLE `blade_dict_biz` ENABLE KEYS */;

-- 导出  表 fizz_manager.blade_log_api 结构
CREATE TABLE IF NOT EXISTS `blade_log_api` (
  `id` bigint(64) NOT NULL COMMENT '编号',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `service_id` varchar(32) DEFAULT NULL COMMENT '服务ID',
  `server_host` varchar(255) DEFAULT NULL COMMENT '服务器名',
  `server_ip` varchar(255) DEFAULT NULL COMMENT '服务器IP地址',
  `env` varchar(255) DEFAULT NULL COMMENT '服务器环境',
  `type` char(1) DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) DEFAULT '' COMMENT '日志标题',
  `method` varchar(10) DEFAULT NULL COMMENT '操作方式',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `user_agent` varchar(1000) DEFAULT NULL COMMENT '用户代理',
  `remote_ip` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `method_class` varchar(255) DEFAULT NULL COMMENT '方法类',
  `method_name` varchar(255) DEFAULT NULL COMMENT '方法名',
  `params` text COMMENT '操作提交的数据',
  `time` varchar(64) DEFAULT NULL COMMENT '执行时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='接口日志表';

-- 正在导出表  fizz_manager.blade_log_api 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `blade_log_api` DISABLE KEYS */;
/*!40000 ALTER TABLE `blade_log_api` ENABLE KEYS */;

-- 导出  表 fizz_manager.blade_log_error 结构
CREATE TABLE IF NOT EXISTS `blade_log_error` (
  `id` bigint(64) NOT NULL COMMENT '编号',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `service_id` varchar(32) DEFAULT NULL COMMENT '服务ID',
  `server_host` varchar(255) DEFAULT NULL COMMENT '服务器名',
  `server_ip` varchar(255) DEFAULT NULL COMMENT '服务器IP地址',
  `env` varchar(255) DEFAULT NULL COMMENT '系统环境',
  `method` varchar(10) DEFAULT NULL COMMENT '操作方式',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `user_agent` varchar(1000) DEFAULT NULL COMMENT '用户代理',
  `stack_trace` text COMMENT '堆栈',
  `exception_name` varchar(255) DEFAULT NULL COMMENT '异常名',
  `message` text COMMENT '异常信息',
  `line_number` int(11) DEFAULT NULL COMMENT '错误行数',
  `remote_ip` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `method_class` varchar(255) DEFAULT NULL COMMENT '方法类',
  `file_name` varchar(1000) DEFAULT NULL COMMENT '文件名',
  `method_name` varchar(255) DEFAULT NULL COMMENT '方法名',
  `params` text COMMENT '操作提交的数据',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='错误日志表';

-- 正在导出表  fizz_manager.blade_log_error 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `blade_log_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `blade_log_error` ENABLE KEYS */;

-- 导出  表 fizz_manager.blade_log_usual 结构
CREATE TABLE IF NOT EXISTS `blade_log_usual` (
  `id` bigint(64) NOT NULL COMMENT '编号',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `service_id` varchar(32) DEFAULT NULL COMMENT '服务ID',
  `server_host` varchar(255) DEFAULT NULL COMMENT '服务器名',
  `server_ip` varchar(255) DEFAULT NULL COMMENT '服务器IP地址',
  `env` varchar(255) DEFAULT NULL COMMENT '系统环境',
  `log_level` varchar(10) DEFAULT NULL COMMENT '日志级别',
  `log_id` varchar(100) DEFAULT NULL COMMENT '日志业务id',
  `log_data` text COMMENT '日志数据',
  `method` varchar(10) DEFAULT NULL COMMENT '操作方式',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `remote_ip` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `method_class` varchar(255) DEFAULT NULL COMMENT '方法类',
  `method_name` varchar(255) DEFAULT NULL COMMENT '方法名',
  `user_agent` varchar(1000) DEFAULT NULL COMMENT '用户代理',
  `params` text COMMENT '操作提交的数据',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='通用日志表';

-- 正在导出表  fizz_manager.blade_log_usual 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `blade_log_usual` DISABLE KEYS */;
/*!40000 ALTER TABLE `blade_log_usual` ENABLE KEYS */;

-- 导出  表 fizz_manager.blade_menu 结构
CREATE TABLE IF NOT EXISTS `blade_menu` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `parent_id` bigint(64) DEFAULT '0' COMMENT '父级菜单',
  `code` varchar(255) DEFAULT NULL COMMENT '菜单编号',
  `name` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `alias` varchar(255) DEFAULT NULL COMMENT '菜单别名',
  `path` varchar(255) DEFAULT NULL COMMENT '请求地址',
  `source` varchar(255) DEFAULT NULL COMMENT '菜单资源',
  `sort` int(2) DEFAULT NULL COMMENT '排序',
  `category` int(2) DEFAULT NULL COMMENT '菜单类型',
  `action` int(2) DEFAULT '0' COMMENT '操作按钮类型',
  `is_open` int(2) DEFAULT '1' COMMENT '是否打开新页面',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='菜单表';

-- 正在导出表  fizz_manager.blade_menu 的数据：~100 rows (大约)
/*!40000 ALTER TABLE `blade_menu` DISABLE KEYS */;
INSERT INTO `blade_menu` (`id`, `parent_id`, `code`, `name`, `alias`, `path`, `source`, `sort`, `category`, `action`, `is_open`, `remark`, `is_deleted`) VALUES
	(1123598815738675203, 0, 'system', '系统管理', 'menu', '/system', 'iconfont iconicon_setting', 99, 1, 0, 1, NULL, 0),
	(1123598815738675204, 1123598815738675203, 'user', '用户管理', 'menu', '/system/user', 'iconfont iconicon_principal', 1, 1, 0, 1, NULL, 0),
	(1123598815738675205, 1123598815738675203, 'dept', '机构管理', 'menu', '/system/dept', 'iconfont iconicon_group', 2, 1, 0, 1, '', 0),
	(1123598815738675206, 1123598815738675203, 'dict', '系统字典', 'menu', '/system/dict', 'iconfont iconicon_addresslist', 4, 1, 0, 1, NULL, 0),
	(1123598815738675207, 1123598815738675203, 'menu', '菜单管理', 'menu', '/system/menu', 'iconfont iconicon_subordinate', 6, 1, 0, 1, NULL, 0),
	(1123598815738675209, 1123598815738675203, 'param', '参数管理', 'menu', '/system/param', 'iconfont iconicon_community_line', 8, 1, 0, 1, NULL, 0),
	(1123598815738675223, 1123598815738675204, 'user_add', '新增', 'add', '/system/user/add', 'plus', 1, 2, 1, 1, NULL, 0),
	(1123598815738675224, 1123598815738675204, 'user_edit', '修改', 'edit', '/system/user/edit', 'form', 2, 2, 2, 1, NULL, 0),
	(1123598815738675225, 1123598815738675204, 'user_delete', '删除', 'delete', '/api/blade-user/remove', 'delete', 3, 2, 3, 1, NULL, 0),
	(1123598815738675226, 1123598815738675204, 'user_role', '角色配置', 'role', NULL, 'user-add', 4, 2, 1, 1, NULL, 0),
	(1123598815738675227, 1123598815738675204, 'user_reset', '密码重置', 'reset-password', '/api/blade-user/reset-password', 'retweet', 5, 2, 1, 1, NULL, 0),
	(1123598815738675228, 1123598815738675204, 'user_view', '查看', 'view', '/system/user/view', 'file-text', 6, 2, 2, 1, NULL, 0),
	(1123598815738675229, 1123598815738675205, 'dept_add', '新增', 'add', '/system/dept/add', 'plus', 1, 2, 1, 1, NULL, 0),
	(1123598815738675230, 1123598815738675205, 'dept_edit', '修改', 'edit', '/system/dept/edit', 'form', 2, 2, 2, 1, NULL, 0),
	(1123598815738675231, 1123598815738675205, 'dept_delete', '删除', 'delete', '/api/blade-system/dept/remove', 'delete', 3, 2, 3, 1, NULL, 0),
	(1123598815738675232, 1123598815738675205, 'dept_view', '查看', 'view', '/system/dept/view', 'file-text', 4, 2, 2, 1, NULL, 0),
	(1123598815738675233, 1123598815738675206, 'dict_add', '新增', 'add', '/system/dict/add', 'plus', 1, 2, 1, 1, NULL, 0),
	(1123598815738675234, 1123598815738675206, 'dict_edit', '修改', 'edit', '/system/dict/edit', 'form', 2, 2, 2, 1, NULL, 0),
	(1123598815738675235, 1123598815738675206, 'dict_delete', '删除', 'delete', '/api/blade-system/dict/remove', 'delete', 3, 2, 3, 1, NULL, 0),
	(1123598815738675236, 1123598815738675206, 'dict_view', '查看', 'view', '/system/dict/view', 'file-text', 4, 2, 2, 1, NULL, 0),
	(1123598815738675237, 1123598815738675207, 'menu_add', '新增', 'add', '/system/menu/add', 'plus', 1, 2, 1, 1, NULL, 0),
	(1123598815738675238, 1123598815738675207, 'menu_edit', '修改', 'edit', '/system/menu/edit', 'form', 2, 2, 2, 1, NULL, 0),
	(1123598815738675239, 1123598815738675207, 'menu_delete', '删除', 'delete', '/api/blade-system/menu/remove', 'delete', 3, 2, 3, 1, NULL, 0),
	(1123598815738675240, 1123598815738675207, 'menu_view', '查看', 'view', '/system/menu/view', 'file-text', 4, 2, 2, 1, NULL, 0),
	(1123598815738675241, 1123598815738675308, 'role_add', '新增', 'add', '/authority/role/add', 'plus', 1, 2, 1, 1, NULL, 0),
	(1123598815738675242, 1123598815738675308, 'role_edit', '修改', 'edit', '/authority/role/edit', 'form', 2, 2, 2, 1, NULL, 0),
	(1123598815738675243, 1123598815738675308, 'role_delete', '删除', 'delete', '/api/blade-system/role/remove', 'delete', 3, 2, 3, 1, NULL, 0),
	(1123598815738675244, 1123598815738675308, 'role_view', '查看', 'view', '/authority/role/view', 'file-text', 4, 2, 2, 1, NULL, 0),
	(1123598815738675245, 1123598815738675209, 'param_add', '新增', 'add', '/system/param/add', 'plus', 1, 2, 1, 1, NULL, 0),
	(1123598815738675246, 1123598815738675209, 'param_edit', '修改', 'edit', '/system/param/edit', 'form', 2, 2, 2, 1, NULL, 0),
	(1123598815738675247, 1123598815738675209, 'param_delete', '删除', 'delete', '/api/blade-system/param/remove', 'delete', 3, 2, 3, 1, NULL, 0),
	(1123598815738675248, 1123598815738675209, 'param_view', '查看', 'view', '/system/param/view', 'file-text', 4, 2, 2, 1, NULL, 0),
	(1123598815738675256, 1123598815738675203, 'tenant', '租户管理', 'menu', '/system/tenant', 'iconfont icon-quanxian', 9, 1, 0, 1, NULL, 0),
	(1123598815738675257, 1123598815738675256, 'tenant_add', '新增', 'add', '/system/tenant/add', 'plus', 1, 2, 1, 1, NULL, 0),
	(1123598815738675258, 1123598815738675256, 'tenant_edit', '修改', 'edit', '/system/tenant/edit', 'form', 2, 2, 2, 1, NULL, 0),
	(1123598815738675259, 1123598815738675256, 'tenant_delete', '删除', 'delete', '/api/blade-system/tenant/remove', 'delete', 3, 2, 3, 1, NULL, 0),
	(1123598815738675260, 1123598815738675256, 'tenant_view', '查看', 'view', '/system/tenant/view', 'file-text', 4, 2, 2, 1, NULL, 0),
	(1123598815738675261, 1123598815738675203, 'client', '应用管理', 'menu', '/system/client', 'iconfont iconicon_mobilephone', 10, 1, 0, 1, NULL, 0),
	(1123598815738675262, 1123598815738675261, 'client_add', '新增', 'add', '/system/client/add', 'plus', 1, 2, 1, 1, NULL, 0),
	(1123598815738675263, 1123598815738675261, 'client_edit', '修改', 'edit', '/system/client/edit', 'form', 2, 2, 2, 2, NULL, 0),
	(1123598815738675264, 1123598815738675261, 'client_delete', '删除', 'delete', '/api/blade-system/client/remove', 'delete', 3, 2, 3, 3, NULL, 0),
	(1123598815738675265, 1123598815738675261, 'client_view', '查看', 'view', '/system/client/view', 'file-text', 4, 2, 2, 2, NULL, 0),
	(1123598815738675307, 0, 'authority', '权限管理', 'menu', '/authority', 'iconfont icon-bofangqi-suoping', 98, 1, 0, 1, '', 0),
	(1123598815738675308, 1123598815738675307, 'role', '角色管理', 'menu', '/authority/role', 'iconfont iconicon_boss', 1, 1, 0, 1, NULL, 0),
	(1123598815738675309, 1123598815738675307, 'data_scope', '数据权限', 'menu', '/authority/datascope', 'iconfont icon-shujuzhanshi2', 2, 1, 0, 1, '', 0),
	(1123598815738675310, 1123598815738675309, 'data_scope_setting', '权限配置', 'setting', NULL, 'setting', 1, 2, 2, 1, NULL, 0),
	(1123598815738675311, 1123598815738675307, 'api_scope', '接口权限', 'menu', '/authority/apiscope', 'iconfont icon-iconset0216', 3, 1, 0, 1, '', 0),
	(1123598815738675312, 1123598815738675311, 'api_scope_setting', '权限配置', 'setting', NULL, 'setting', 1, 2, 2, 1, NULL, 0),
	(1164733379658963251, 1123598815738675203, 'dictbiz', '业务字典', 'menu', '/system/dictbiz', 'iconfont iconicon_study', 5, 1, 0, 1, '', 0),
	(1164733379658963252, 1164733379658963251, 'dictbiz_add', '新增', 'add', '/system/dictbiz/add', 'plus', 1, 2, 1, 1, '', 0),
	(1164733379658963253, 1164733379658963251, 'dictbiz_edit', '修改', 'edit', '/system/dictbiz/edit', 'form', 2, 2, 2, 1, '', 0),
	(1164733379658963254, 1164733379658963251, 'dictbiz_delete', '删除', 'delete', '/api/blade-system/dict-biz/remove', 'delete', 3, 2, 3, 1, '', 0),
	(1164733379658963255, 1164733379658963251, 'dictbiz_view', '查看', 'view', '/system/dictbiz/view', 'file-text', 4, 2, 2, 1, '', 0),
	(1164733389668962251, 1123598815738675203, 'post', '岗位管理', 'menu', '/system/post', 'iconfont iconicon_message', 3, 1, 0, 1, NULL, 0),
	(1164733389668962252, 1164733389668962251, 'post_add', '新增', 'add', '/system/post/add', 'plus', 1, 2, 1, 1, NULL, 0),
	(1164733389668962253, 1164733389668962251, 'post_edit', '修改', 'edit', '/system/post/edit', 'form', 2, 2, 2, 1, NULL, 0),
	(1164733389668962254, 1164733389668962251, 'post_delete', '删除', 'delete', '/api/blade-system/post/remove', 'delete', 3, 2, 3, 1, NULL, 0),
	(1164733389668962255, 1164733389668962251, 'post_view', '查看', 'view', '/system/post/view', 'file-text', 4, 2, 2, 1, NULL, 0),
	(1250688137819074561, 0, 'proxy', '网关管理', 'menu', '/proxy', 'iconfont iconicon_cspace', 0, 1, 0, 1, '', 0),
	(1250709967393009666, 0, 'aggregate', '服务编排', 'menu', '/aggregate', 'iconfont iconicon_work', 2, 1, 0, 1, '', 0),
	(1250710176651030530, 1250709967393009666, 'aggregate_service', '服务管理', 'menu', '/aggregate/service', 'iconfont icon-caidanguanli', 2, 1, 0, 1, '', 0),
	(1250717036653326337, 1250709967393009666, 'aggregate_api', '接口列表', 'menu', '/aggregate/api', 'iconfont icon-daohanglanmoshi02', 1, 1, 0, 1, '', 0),
	(1252176803745869825, 1250710176651030530, 'aggregate_service_add', '新增', 'add', '', 'iconfont iconicon_add', 1, 2, 0, 1, '', 0),
	(1252178103506153473, 1250710176651030530, 'aggregate_service_edit', '编辑', 'edit', '', 'iconfont iconicon_compile', 2, 2, 0, 1, '', 0),
	(1252178732668530690, 1250710176651030530, 'aggregate_service_delete', '删除', 'delete', '', 'iconfont iconicon_delete', 3, 2, 0, 1, '', 0),
	(1252190114092789761, 1250717036653326337, 'aggregate_api_add', '新增', 'add', '/aggregate/api/add', 'iconfont iconicon_add', 1, 2, 0, 1, '', 0),
	(1252190377574772738, 1250717036653326337, 'aggregate_api_edit', '编辑', 'edit', '/aggregate/api/edit', 'iconfont iconicon_compile', 2, 2, 0, 1, '', 0),
	(1252191594883428353, 1250717036653326337, 'aggregate_api_delete', '删除', 'delete', '', 'iconfont iconicon_delete', 3, 2, 0, 1, '', 0),
	(1252445227646562305, 1250717036653326337, 'aggregate_api_export', '导出', 'export', '', 'iconfont iconicon_share', 4, 2, 0, 1, '', 0),
	(1252446258300301314, 1250717036653326337, 'aggregate_api_import', '导入', 'import', '', 'iconfont icon-tuichu', 5, 2, 0, 1, '', 0),
	(1252447242422431746, 1250717036653326337, 'aggregate_api_publish', '发布', 'publish', '', 'iconfont iconicon_send', 6, 2, 0, 1, '', 0),
	(1262276820200423425, 1250717036653326337, 'aggregate_api_offline', '下线', 'offline', '', 'iconfont icon-iconset0216', 8, 2, 0, 1, '', 0),
	(1262581030284525570, 1250717036653326337, 'aggregate_history_rollback', '发布回滚', 'rollback', '', 'iconfont iconicon_exchange', 7, 2, 0, 1, '', 0),
	(1267702462467297281, 1250710176651030530, 'aggregate_service', '默认列表', 'list', '', 'iconfont iconicon_work', 0, 2, 0, 1, '权限需默认选中', 0),
	(1267703863473885186, 1250717036653326337, 'aggregate_api', '默认列表', 'list', '', 'iconfont iconicon_work', 0, 2, 0, 1, '', 0),
	(1272781612135768066, 0, 'aggregate-record', '编排审核', 'menu', '/aggregateRecord', 'iconfont icon-rizhi1', 3, 1, 0, 1, '', 0),
	(1272787220389978114, 1272781612135768066, 'aggregateRecord_auditLog', '审核日志', 'auditLog', '/aggregateRecord/auditLog', 'iconfont icon-caidanguanli', 3, 1, 0, 1, '', 0),
	(1272791912985681922, 1272781612135768066, 'aggregateRecord_apply', '我的申请', 'apply', '/aggregateRecord/apply', 'iconfont iconicon_compile', 1, 1, 0, 1, '', 0),
	(1272792118531743746, 1272781612135768066, 'aggregateRecord_audit', '待审核', 'audit', '/aggregateRecord/audit', 'iconfont iconicon_dispose', 2, 1, 0, 1, '', 0),
	(1273181698086952961, 1250710176651030530, 'aggregate_service_authority', '权限', 'authority', '', 'iconfont iconicon_shakehands', 4, 2, 0, 1, '', 0),
	(1273548441347186689, 1272791912985681922, 'aggregate_apply_revoke', '撤回', 'revoke', '', 'iconfont iconicon_send', 2, 2, 0, 1, '', 0),
	(1273555224350449666, 1250717036653326337, 'aggregate_api_apply', '操作申请', 'apply', '', 'iconfont iconicon_roundadd', 9, 2, 0, 1, '发布|下线 等操作申请', 0),
	(1273806418805284866, 1250717036653326337, 'aggregate_api_view', '查看', 'view', '/aggregate/api/view', 'iconfont iconicon_glass', 2, 2, 0, 1, '', 0),
	(1273893476789936129, 1272792118531743746, 'aggregate_apply_audit', '审核', 'audit', '', 'iconfont iconicon_task_done', 2, 2, 0, 1, '', 0),
	(1281499690516439041, 1250709967393009666, 'aggregate_operationLog', '操作日志', 'menu', '/aggregate/operationLog', 'iconfont icon-rizhi1', 3, 1, 0, 1, '', 0),
	(1281501511255416834, 1272791912985681922, 'aggregate_apply_rollback', '批量回滚', 'rollback', '', 'iconfont iconicon_setting', 2, 2, 0, 1, '', 0),
	(1283604889368322050, 1272792118531743746, 'aggregateRecord_audit_view', '查看', 'view', '', 'iconfont iconicon_glass', 1, 2, 0, 1, '', 0),
	(1283607043512524801, 1272791912985681922, 'aggregateRecord_apply_view', '查看', 'view', '', 'iconfont iconicon_glass', 1, 2, 0, 1, '', 0),
	(1291655737419825153, 1272791912985681922, 'aggregate_apply_batchPublish', '批量发布', 'batchPublish', '', 'iconfont iconicon_roundadd', 3, 2, 0, 1, '', 0),
	(1291655869653647361, 1272791912985681922, 'aggregate_apply_batchOffline', '批量下线', 'batchOffline', '', 'iconfont iconicon_roundadd', 3, 2, 0, 1, '', 0),
	(1291656441609912321, 1250709967393009666, 'gateway_list', '网关缓存', 'menu', '/gateway/list', 'iconfont icon-iconset0265', 4, 1, 0, 1, '', 0),
	(1295999263393767426, 1250688137819074561, 'proxy_appid', 'appID管理', '	 menu', '/proxy/appid', 'iconfont icon-tubiao', 2, 1, 0, 1, '', 0),
	(1295999388346277889, 1295999263393767426, 'proxy_appid_add', '新增', 'add', '', 'iconfont iconicon_add', 1, 2, 0, 1, '', 0),
	(1295999521242800129, 1295999263393767426, 'proxy_appid_edit', '编辑', 'edit', '', 'iconfont iconicon_compile', 2, 2, 0, 1, '', 0),
	(1295999636061872130, 1295999263393767426, 'proxy_appid_delete', '删除', '	 delete', '', 'iconfont iconicon_delete', 3, 2, 0, 1, '', 0),
	(1295999776294232066, 1250688137819074561, 'proxy_api', '路由管理', 'menu', '/proxy/api', 'iconfont icon-caidan', 0, 1, 0, 1, '', 0),
	(1295999971534888962, 1295999776294232066, 'proxy_api_add', '新增', 'add', '', 'iconfont iconicon_roundadd', 1, 2, 0, 1, '', 0),
	(1296000096021831682, 1295999776294232066, 'proxy_api_edit', '编辑', 'edit', '', 'iconfont iconicon_roundadd', 2, 2, 0, 1, '', 0),
	(1296000280642510849, 1295999776294232066, 'proxy_api_view', '查看', 'view', '', 'iconfont iconicon_roundadd', 3, 2, 0, 1, '', 0),
	(1296000388528398338, 1295999776294232066, 'proxy_api_delete', '删除', 'delete', '', 'iconfont iconicon_roundadd', 4, 2, 0, 1, '', 0),
	(1297721756030636034, 1250688137819074561, 'proxy_ip', '接口统计', 'menu', '/proxy/ip', 'iconfont icon-canshu', 4, 1, 0, 1, '', 0),
    (1314474440901332993, 1250688137819074561, 'gateway_group', '网关分组', 'menu', '/gateway/group', 'iconfont iconicon_subordinate', 1, 1, 0, 1, '', 0),
    (1314474582710751234, 1314474440901332993, 'gateway_group_add', '新增', 'add', '', 'iconfont iconicon_roundadd', 1, 2, 0, 1, '', 0),
    (1314474738403315713, 1314474440901332993, 'gateway_group_edit', '编辑', 'edit', '', 'iconfont iconicon_roundadd', 2, 2, 0, 1, '', 0),
    (1314474819869282306, 1314474440901332993, 'gateway_group_view', '查看', 'view', '', 'iconfont iconicon_roundadd', 3, 2, 0, 1, '', 0),
    (1314474897845587969, 1314474440901332993, 'gateway_group_delete', '删除', 'delete', '', 'iconfont iconicon_roundadd', 4, 2, 0, 1, '', 0),
    (1314475082021670913, 1250688137819074561, 'gateway_plugin', '插件管理', 'menu', '/gateway/plugin', 'iconfont iconicon_ding', 1, 1, 0, 1, '', 0),
    (1314475246295781377, 1314475082021670913, 'gateway_plugin_add', '新增', 'add', '', 'iconfont iconicon_roundadd', 1, 2, 0, 1, '', 0),
    (1314475337735802881, 1314475082021670913, 'gateway_plugin_edit', '编辑', 'edit', '', 'iconfont iconicon_roundadd', 2, 2, 0, 1, '', 0),
    (1314475417159143425, 1314475082021670913, 'gateway_plugin_view', '查看', 'view', '', 'iconfont iconicon_roundadd', 3, 2, 0, 1, '', 0),
    (1314475484922318849, 1314475082021670913, 'gateway_plugin_delete', '删除', 'delete', '', 'iconfont iconicon_roundadd', 4, 2, 0, 1, '', 0),
    (1314475872941576193, 1250717036653326337, 'aggregate_api_debug', '打开/关闭调试模式', 'debug', '', 'iconfont iconicon_roundadd', 10, 2, 0, 1, '', 0),
    (1321642986177638401, 1295999263393767426, 'proxy_appid_view', '查看', 'view', '', 'iconfont iconicon_roundadd', 2, 2, 0, 1, '', 0),
    (1339851135036485633, 1250688137819074561, 'gateway_log', '网关日志', 'menu', '/gateway/log', 'iconfont icon-caidanguanli', 100, 1, 0, 1, '', 0),
    (1347015376856166401, 1250688137819074561, 'gateway_flow', '流控规则', 'menu', '/gateway/flow', 'iconfont icon-rizhi1', 88, 1, 0, 1, '', 0),
    (1352143980522958850, 0, 'callback', '回调管理', 'menu', 'callback', 'iconfont iconicon_affiliations_li', 1, 1, 0, 1, '', 0),
    (1352144194742841345, 1352143980522958850, 'callback_config', '回调配置', 'menu', '/callback/config', 'iconfont iconicon_setting', 1, 1, 0, 1, '', 0),
    (1352176334587097089, 1352143980522958850, 'callback_playback', '回调回放', 'menu', '/callback/playback', 'iconfont iconicon_share', 2, 1, 0, 1, '', 0),
    (1352176655757537282, 1352143980522958850, 'callback_log', '回放日志', 'menu', '/callback/log', 'iconfont icon-caidanguanli', 3, 1, 0, 1, '', 0),
    (1357631241997799426, 1352176334587097089, 'callback_playback_btn', '回放', 'playback', '', 'iconfont iconicon_roundadd', 1, 2, 0, 1, '', 0),
    (1371284407066873858, 0, 'rpc', 'RPC管理', 'menu', '/rpc', 'iconfont iconicon_savememo', 4, 1, 0, 1, '', 0),
    (1371295163011354625, 1371284407066873858, 'rpc_service', '服务声明', 'menu', '/rpc/service', 'iconfont icon-caidanguanli', 1, 1, 0, 1, '', 0),
    (1371295762515808258, 1371284407066873858, 'rpc_api', '接口管理', 'menu', '/rpc/api', 'iconfont icon-liuliangyunpingtaitubiao08', 2, 1, 0, 1, '', 0),
    (1371351815953608706, 1371295163011354625, 'rpc_service_add', '新增', 'add', '', 'iconfont iconicon_roundadd', 1, 2, 0, 1, '', 0),
    (1371352014721675265, 1371295163011354625, 'rpc_service_edit', '编辑', 'edit', '', 'iconfont iconicon_roundadd', 2, 2, 0, 1, '', 0),
    (1371352186675556353, 1371295163011354625, 'rpc_service_delete', '删除', 'delete', '', 'iconfont iconicon_roundadd', 3, 2, 0, 1, '', 0),
    (1371352604788944898, 1371295762515808258, 'rpc_api_add', '新增', 'add', '', 'iconfont iconicon_roundadd', 1, 2, 0, 1, '', 0),
    (1371352739900059650, 1371295762515808258, 'rpc_api_edit', '编辑', 'edit', '', 'iconfont iconicon_roundadd', 2, 2, 0, 1, '', 0),
    (1371353068112736258, 1371295762515808258, 'rpc_api_view', '查看', 'view', '', 'iconfont iconicon_roundadd', 3, 2, 0, 1, '', 0),
    (1371353169895911425, 1371295762515808258, 'rpc_api_delete', '删除', 'delete', '', 'iconfont iconicon_roundadd', 4, 2, 0, 1, '', 0),
    (1371353327412998145, 1371295762515808258, 'rpc_api_import', '导入', 'import', '', 'iconfont iconicon_roundadd', 5, 2, 0, 1, '', 0),
    (1371353436456513538, 1371295762515808258, 'rpc_api_export', '导出', 'export', '', 'iconfont iconicon_roundadd', 6, 2, 0, 1, '', 0);

/*!40000 ALTER TABLE `blade_menu` ENABLE KEYS */;

-- 导出  表 fizz_manager.blade_notice 结构
CREATE TABLE IF NOT EXISTS `blade_notice` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `category` int(11) DEFAULT NULL COMMENT '类型',
  `release_time` datetime DEFAULT NULL COMMENT '发布时间',
  `content` varchar(2000) DEFAULT NULL COMMENT '内容',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='通知公告表';

-- 正在导出表  fizz_manager.blade_notice 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `blade_notice` DISABLE KEYS */;
INSERT INTO `blade_notice` (`id`, `tenant_id`, `title`, `category`, `release_time`, `content`, `create_user`, `create_dept`, `create_time`, `update_user`, `update_time`, `status`, `is_deleted`) VALUES
	(1123598818738675223, '000000', '测试公告', 3, '2018-12-31 20:03:31', '222', 1123598821738675201, 1123598813738675201, '2018-12-05 20:03:31', 1123598821738675201, '2020-04-17 17:30:44', 1, 1),
	(1123598818738675224, '000000', '测试公告2', 1, '2018-12-05 20:03:31', '333', 1123598821738675201, 1123598813738675201, '2018-12-28 10:32:26', 1123598821738675201, '2020-04-17 17:54:31', 1, 0),
	(1123598818738675225, '000000', '测试公告3', 6, '2018-12-29 00:00:00', '11111', 1123598821738675201, 1123598813738675201, '2018-12-28 11:03:44', 1123598821738675201, '2018-12-28 11:10:28', 1, 0),
	(1252153823405912065, '000000', '', NULL, NULL, '', 1123598821738675201, 1123598813738675201, '2020-04-20 16:35:10', 1123598821738675201, '2020-04-20 16:40:08', 1, 1);
/*!40000 ALTER TABLE `blade_notice` ENABLE KEYS */;

-- 导出  表 fizz_manager.blade_oss 结构
CREATE TABLE IF NOT EXISTS `blade_oss` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `category` int(2) DEFAULT NULL COMMENT '分类',
  `oss_code` varchar(32) DEFAULT NULL COMMENT '资源编号',
  `endpoint` varchar(255) DEFAULT NULL COMMENT '资源地址',
  `access_key` varchar(255) DEFAULT NULL COMMENT 'accessKey',
  `secret_key` varchar(255) DEFAULT NULL COMMENT 'secretKey',
  `bucket_name` varchar(255) DEFAULT NULL COMMENT '空间名',
  `app_id` varchar(255) DEFAULT NULL COMMENT '应用ID',
  `region` varchar(255) DEFAULT NULL COMMENT '地域简称',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='对象存储表';

-- 正在导出表  fizz_manager.blade_oss 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `blade_oss` DISABLE KEYS */;
INSERT INTO `blade_oss` (`id`, `tenant_id`, `category`, `oss_code`, `endpoint`, `access_key`, `secret_key`, `bucket_name`, `app_id`, `region`, `remark`, `create_user`, `create_dept`, `create_time`, `update_user`, `update_time`, `status`, `is_deleted`) VALUES
	(1132486733992468482, '000000', 1, 'minio', 'http://127.0.0.1:9000', 'D99KGE6ZTQXSATTJWU24', 'QyVqGnhIQQE734UYSUFlGOZViE6+ZlDEfUG3NjhJ', 'bladex', '', '', '', 1123598821738675201, 1123598813738675201, '2019-05-26 11:20:52', 1123598821738675201, '2019-05-27 08:34:55', 2, 0),
	(1132487155981393922, '000000', 2, 'qiniu', 'http://ps458elcs.bkt.clouddn.com', 'N_Loh1ngBqcJovwiAJqR91Ifj2vgOWHOf8AwBA_h', 'AuzuA1KHAbkIndCU0dB3Zfii2O3crHNODDmpxHRS', 'bladex', '', '', '', 1123598821738675201, 1123598813738675201, '2019-05-26 11:22:33', 1123598821738675201, '2019-05-26 23:27:56', 1, 0);
/*!40000 ALTER TABLE `blade_oss` ENABLE KEYS */;

-- 导出  表 fizz_manager.blade_param 结构
CREATE TABLE IF NOT EXISTS `blade_param` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `param_name` varchar(255) DEFAULT NULL COMMENT '参数名',
  `param_key` varchar(255) DEFAULT NULL COMMENT '参数键',
  `param_value` varchar(255) DEFAULT NULL COMMENT '参数值',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='参数表';

-- 正在导出表  fizz_manager.blade_param 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `blade_param` DISABLE KEYS */;
INSERT INTO `blade_param` (`id`, `param_name`, `param_key`, `param_value`, `remark`, `create_user`, `create_dept`, `create_time`, `update_user`, `update_time`, `status`, `is_deleted`) VALUES
	(1123598819738675201, '是否开启注册功能', 'account.registerUser', 'true', '开启注册', 1123598821738675201, 1123598813738675201, '2018-12-28 12:19:01', 1123598821738675201, '2018-12-28 12:19:01', 1, 0),
	(1123598819738675202, '账号初始密码', 'account.initPassword', 'AsdF1234!', '初始密码', 1123598821738675201, 1123598813738675201, '2018-12-28 12:19:01', 1123598821738675201, '2020-07-17 15:46:46', 1, 0),
	(1238706101399142402, '租户默认管理密码', 'tenant.default.password', 'admin', NULL, 1123598821738675201, 1123598813738675201, '2020-03-14 13:58:43', 1123598821738675201, '2020-03-14 13:58:43', 1, 0),
	(1238706160295559170, '租户默认账号额度', 'tenant.default.accountNumber', '100', NULL, 1123598821738675201, 1123598813738675201, '2020-03-14 13:58:57', 1123598821738675201, '2020-03-14 13:58:57', 1, 0),
	(1238706330076790786, '租户默认菜单集合', 'tenant.default.menuCode', 'desk,flow,work,monitor,resource,role,user,dept,post,dictbiz,topmenu', NULL, 1123598821738675201, 1123598813738675201, '2020-03-14 13:59:38', 1123598821738675201, '2020-03-14 13:59:38', 1, 0),
    (1381913470028525569, '网站备案号', 'sys.website.beian.code', '', NULL, 1123598821738675201, 1260823335286165505, '2021-04-13 18:13:41', 1123598821738675201, '2021-04-13 18:13:41', 1, 0),
    (1381913643983089665, '网安备案号', 'sys.networksecurity.beian.code', '', NULL, 1123598821738675201, 1260823335286165505, '2021-04-13 18:14:22', 1123598821738675201, '2021-04-13 18:14:22', 1, 0);
/*!40000 ALTER TABLE `blade_param` ENABLE KEYS */;

-- 导出  表 fizz_manager.blade_post 结构
CREATE TABLE IF NOT EXISTS `blade_post` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `category` int(11) DEFAULT NULL COMMENT '岗位类型',
  `post_code` varchar(12) DEFAULT NULL COMMENT '岗位编号',
  `post_name` varchar(64) DEFAULT NULL COMMENT '岗位名称',
  `sort` int(2) DEFAULT NULL COMMENT '岗位排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '岗位描述',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='岗位表';

-- 正在导出表  fizz_manager.blade_post 的数据：~8 rows (大约)
/*!40000 ALTER TABLE `blade_post` DISABLE KEYS */;
INSERT INTO `blade_post` (`id`, `tenant_id`, `category`, `post_code`, `post_name`, `sort`, `remark`, `create_user`, `create_dept`, `create_time`, `update_user`, `update_time`, `status`, `is_deleted`) VALUES
	(1123598817738675201, '000000', 1, 'ceo', '首席执行官', 1, '总经理', 1123598821738675201, 1123598813738675201, '2020-04-01 00:00:00', 1123598821738675201, '2020-04-01 00:00:00', 1, 0),
	(1123598817738675202, '000000', 1, 'coo', '首席运营官', 2, '常务总经理', 1123598821738675201, 1123598813738675201, '2020-04-01 00:00:00', 1123598821738675201, '2020-04-01 00:00:00', 1, 0),
	(1123598817738675203, '000000', 1, 'cfo', '首席财务官', 3, '财务总经理', 1123598821738675201, 1123598813738675201, '2020-04-01 00:00:00', 1123598821738675201, '2020-04-01 00:00:00', 1, 0),
	(1123598817738675204, '000000', 1, 'cto', '首席技术官', 4, '技术总监', 1123598821738675201, 1123598813738675201, '2020-04-01 00:00:00', 1123598821738675201, '2020-04-01 00:00:00', 1, 0),
	(1123598817738675205, '000000', 1, 'cio', '首席信息官', 5, '信息总监', 1123598821738675201, 1123598813738675201, '2020-04-01 00:00:00', 1123598821738675201, '2020-04-01 00:00:00', 1, 0),
	(1123598817738675206, '000000', 2, 'pm', '技术经理', 6, '研发和产品是永远的朋友', 1123598821738675201, 1123598813738675201, '2020-04-01 00:00:00', 1123598821738675201, '2020-04-01 00:00:00', 1, 0),
	(1123598817738675207, '000000', 2, 'hrm', '人力经理', 7, '人力资源部门工作管理者', 1123598821738675201, 1123598813738675201, '2020-04-01 00:00:00', 1123598821738675201, '2020-04-01 00:00:00', 1, 0),
	(1123598817738675208, '000000', 3, 'staff', '普通员工', 8, '普通员工', 1123598821738675201, 1123598813738675201, '2020-04-01 00:00:00', 1123598821738675201, '2020-04-01 00:00:00', 1, 0);
/*!40000 ALTER TABLE `blade_post` ENABLE KEYS */;

-- 导出  表 fizz_manager.blade_process_leave 结构
CREATE TABLE IF NOT EXISTS `blade_process_leave` (
  `id` bigint(64) NOT NULL COMMENT '编号',
  `process_definition_id` varchar(64) DEFAULT NULL COMMENT '流程定义主键',
  `process_instance_id` varchar(64) DEFAULT NULL COMMENT '流程实例主键',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `reason` varchar(255) DEFAULT NULL COMMENT '请假理由',
  `task_user` varchar(255) DEFAULT NULL COMMENT '第一级审批人',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='流程请假业务表';

-- 正在导出表  fizz_manager.blade_process_leave 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `blade_process_leave` DISABLE KEYS */;
/*!40000 ALTER TABLE `blade_process_leave` ENABLE KEYS */;

-- 导出  表 fizz_manager.blade_role 结构
CREATE TABLE IF NOT EXISTS `blade_role` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `parent_id` bigint(64) DEFAULT '0' COMMENT '父主键',
  `role_name` varchar(255) DEFAULT NULL COMMENT '角色名',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `role_alias` varchar(255) DEFAULT NULL COMMENT '角色别名',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- 正在导出表  fizz_manager.blade_role 的数据：~8 rows (大约)
/*!40000 ALTER TABLE `blade_role` DISABLE KEYS */;
INSERT INTO `blade_role` (`id`, `tenant_id`, `parent_id`, `role_name`, `sort`, `role_alias`, `is_deleted`) VALUES
	(1123598816738675201, '000000', 0, '超级管理员', 1, 'administrator', 0),
	(1123598816738675202, '000000', 0, '用户', 2, 'user', 0),
	(1260829123538931714, '000000', 0, '管理员', 3, 'manage', 0),
	(1282895971654623233, '000000', 0, '开发人员', 7, 'developer', 0);
/*!40000 ALTER TABLE `blade_role` ENABLE KEYS */;

-- 导出  表 fizz_manager.blade_role_menu 结构
CREATE TABLE IF NOT EXISTS `blade_role_menu` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `menu_id` bigint(64) DEFAULT NULL COMMENT '菜单id',
  `role_id` bigint(64) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色菜单关联表';

-- 正在导出表  fizz_manager.blade_role_menu 的数据：~246 rows (大约)
/*!40000 ALTER TABLE `blade_role_menu` DISABLE KEYS */;
INSERT INTO `blade_role_menu` (`id`, `menu_id`, `role_id`) VALUES
	(1283949989650780161, 1267702462467297281, 1123598816738675202),
	(1283949989663363073, 1267703863473885186, 1123598816738675202),
	(1296352448151146498, 1250688137819074561, 1123598816738675201),
	(1296352448163729409, 1295999263393767426, 1123598816738675201),
	(1296352448163729410, 1295999388346277889, 1123598816738675201),
	(1296352448197283842, 1295999521242800129, 1123598816738675201),
	(1296352448209866753, 1295999636061872130, 1123598816738675201),
	(1296352448209866754, 1295999776294232066, 1123598816738675201),
	(1296352448230838274, 1295999971534888962, 1123598816738675201),
	(1296352448247615489, 1296000096021831682, 1123598816738675201),
	(1296352448260198401, 1296000280642510849, 1123598816738675201),
	(1296352448268587009, 1296000388528398338, 1123598816738675201),
	(1296352448281169921, 1250709967393009666, 1123598816738675201),
	(1296352448289558530, 1250710176651030530, 1123598816738675201),
	(1296352448297947138, 1267702462467297281, 1123598816738675201),
	(1296352448310530049, 1252176803745869825, 1123598816738675201),
	(1296352448318918658, 1252178103506153473, 1123598816738675201),
	(1296352448331501569, 1252178732668530690, 1123598816738675201),
	(1296352448339890177, 1273181698086952961, 1123598816738675201),
	(1296352448352473090, 1250717036653326337, 1123598816738675201),
	(1296352448360861697, 1267703863473885186, 1123598816738675201),
	(1296352448373444610, 1252190114092789761, 1123598816738675201),
	(1296352448381833217, 1273806418805284866, 1123598816738675201),
	(1296352448390221825, 1252190377574772738, 1123598816738675201),
	(1296352448402804737, 1252191594883428353, 1123598816738675201),
	(1296352448411193346, 1252445227646562305, 1123598816738675201),
	(1296352448423776257, 1252446258300301314, 1123598816738675201),
	(1296352448436359169, 1252447242422431746, 1123598816738675201),
	(1296352448444747778, 1262581030284525570, 1123598816738675201),
	(1296352448453136385, 1262276820200423425, 1123598816738675201),
	(1296352448465719298, 1273555224350449666, 1123598816738675201),
	(1296352448474107906, 1281499690516439041, 1123598816738675201),
	(1296352448486690818, 1291656441609912321, 1123598816738675201),
	(1296352448495079426, 1283607043512524801, 1123598816738675201),
	(1296352448507662338, 1273548441347186689, 1123598816738675201),
	(1296352448516050946, 1291655869653647361, 1123598816738675201),
	(1296352448516050947, 1272792118531743746, 1123598816738675201),
	(1296352448516050948, 1283604889368322050, 1123598816738675201),
	(1296352448516050949, 1273893476789936129, 1123598816738675201),
	(1296352448557993985, 1272787220389978114, 1123598816738675201),
	(1296352448566382593, 1123598815738675307, 1123598816738675201),
	(1296352448574771201, 1123598815738675308, 1123598816738675201),
	(1296352448578965506, 1123598815738675241, 1123598816738675201),
	(1296352448599937026, 1123598815738675242, 1123598816738675201),
	(1296352448608325633, 1123598815738675243, 1123598816738675201),
	(1296352448620908546, 1123598815738675244, 1123598816738675201),
	(1296352448629297153, 1123598815738675309, 1123598816738675201),
	(1296352448637685761, 1123598815738675310, 1123598816738675201),
	(1296352448650268674, 1123598815738675311, 1123598816738675201),
	(1296352448667045890, 1123598815738675312, 1123598816738675201),
	(1296352448683823105, 1123598815738675203, 1123598816738675201),
	(1296352448696406018, 1123598815738675204, 1123598816738675201),
	(1296352448704794626, 1123598815738675223, 1123598816738675201),
	(1296352448717377538, 1123598815738675224, 1123598816738675201),
	(1296352448725766145, 1123598815738675225, 1123598816738675201),
	(1296352448734154753, 1123598815738675226, 1123598816738675201),
	(1296352448746737666, 1123598815738675227, 1123598816738675201),
	(1296352448755126274, 1123598815738675228, 1123598816738675201),
	(1296352448763514881, 1123598815738675205, 1123598816738675201),
	(1296352448776097793, 1123598815738675229, 1123598816738675201),
	(1296352448784486401, 1123598815738675230, 1123598816738675201),
	(1296352448797069313, 1123598815738675231, 1123598816738675201),
	(1296352448805457922, 1123598815738675232, 1123598816738675201),
	(1296352448813846529, 1164733389668962251, 1123598816738675201),
	(1296352448826429442, 1164733389668962252, 1123598816738675201),
	(1296352448834818050, 1164733389668962253, 1123598816738675201),
	(1296352448847400961, 1164733389668962254, 1123598816738675201),
	(1296352448855789570, 1164733389668962255, 1123598816738675201),
	(1296352448872566785, 1123598815738675206, 1123598816738675201),
	(1296352448885149698, 1123598815738675233, 1123598816738675201),
	(1296352448893538306, 1123598815738675234, 1123598816738675201),
	(1296352448901926913, 1123598815738675235, 1123598816738675201),
	(1296352448914509825, 1123598815738675236, 1123598816738675201),
	(1296352448922898433, 1164733379658963251, 1123598816738675201),
	(1296352448943869953, 1164733379658963252, 1123598816738675201),
	(1296352448956452865, 1164733379658963253, 1123598816738675201),
	(1296352448964841473, 1164733379658963254, 1123598816738675201),
	(1296352448973230082, 1164733379658963255, 1123598816738675201),
	(1296352448985812994, 1123598815738675207, 1123598816738675201),
	(1296352448994201601, 1123598815738675237, 1123598816738675201),
	(1296352449006784513, 1123598815738675238, 1123598816738675201),
	(1296352449015173121, 1123598815738675239, 1123598816738675201),
	(1296352449027756034, 1123598815738675240, 1123598816738675201),
	(1296352449036144641, 1123598815738675209, 1123598816738675201),
	(1296352449044533250, 1123598815738675245, 1123598816738675201),
	(1296352449057116161, 1123598815738675246, 1123598816738675201),
	(1296352449065504769, 1123598815738675247, 1123598816738675201),
	(1296352449078087682, 1123598815738675248, 1123598816738675201),
	(1296352449086476289, 1123598815738675256, 1123598816738675201),
	(1296352449086476290, 1123598815738675257, 1123598816738675201),
	(1296352449107447809, 1123598815738675258, 1123598816738675201),
	(1296352449115836418, 1123598815738675259, 1123598816738675201),
	(1296352449115836419, 1123598815738675260, 1123598816738675201),
	(1296352449115836420, 1123598815738675261, 1123598816738675201),
	(1296352449161973761, 1123598815738675262, 1123598816738675201),
	(1296352449187139586, 1123598815738675263, 1123598816738675201),
	(1296352449195528193, 1123598815738675264, 1123598816738675201),
	(1296352449212305409, 1123598815738675265, 1123598816738675201),
	(1300618814274191361, 1267702462467297281, 1282895971654623233),
	(1300618814295162881, 1252176803745869825, 1282895971654623233),
	(1300618814307745793, 1252178103506153473, 1282895971654623233),
	(1300618814316134402, 1252178732668530690, 1282895971654623233),
	(1300618814328717314, 1250717036653326337, 1282895971654623233),
	(1300618814337105922, 1267703863473885186, 1282895971654623233),
	(1300618814349688834, 1252190114092789761, 1282895971654623233),
	(1300618814358077442, 1273806418805284866, 1282895971654623233),
	(1300618814379048961, 1252190377574772738, 1282895971654623233),
	(1300618814379048962, 1252191594883428353, 1282895971654623233),
	(1300618814404214786, 1252445227646562305, 1282895971654623233),
	(1300618814412603393, 1252446258300301314, 1282895971654623233),
	(1300618814412603394, 1252447242422431746, 1282895971654623233),
	(1300618814429380609, 1262581030284525570, 1282895971654623233),
	(1300618814437769217, 1262276820200423425, 1282895971654623233),
	(1300618814450352129, 1273555224350449666, 1282895971654623233),
	(1300618814454546434, 1281499690516439041, 1282895971654623233),
	(1300618814467129346, 1272791912985681922, 1282895971654623233),
	(1300618814475517954, 1283607043512524801, 1282895971654623233),
	(1300618814483906561, 1273548441347186689, 1282895971654623233),
	(1300618814492295169, 1281501511255416834, 1282895971654623233),
	(1300618814500683778, 1291655737419825153, 1282895971654623233),
	(1300618814509072385, 1291655869653647361, 1282895971654623233),
	(1300618814517460994, 1272792118531743746, 1282895971654623233),
	(1300618814525849602, 1283604889368322050, 1282895971654623233),
	(1300618814538432513, 1273893476789936129, 1282895971654623233),
	(1300619033980223490, 1250688137819074561, 1260829123538931714),
	(1300619034001195009, 1295999263393767426, 1260829123538931714),
	(1300619034009583617, 1295999388346277889, 1260829123538931714),
	(1300619034017972226, 1295999521242800129, 1260829123538931714),
	(1300619034026360833, 1295999636061872130, 1260829123538931714),
	(1300619034034749441, 1295999776294232066, 1260829123538931714),
	(1300619034043138050, 1295999971534888962, 1260829123538931714),
	(1300619034051526658, 1296000096021831682, 1260829123538931714),
	(1300619034059915265, 1296000280642510849, 1260829123538931714),
	(1300619034068303873, 1296000388528398338, 1260829123538931714),
	(1300619034076692481, 1297721756030636034, 1260829123538931714),
	(1300619034085081090, 1250709967393009666, 1260829123538931714),
	(1300619034093469697, 1250710176651030530, 1260829123538931714),
	(1300619034101858305, 1267702462467297281, 1260829123538931714),
	(1300619034110246913, 1252176803745869825, 1260829123538931714),
	(1300619034118635521, 1252178103506153473, 1260829123538931714),
	(1300619034127024130, 1252178732668530690, 1260829123538931714),
	(1300619034135412738, 1273181698086952961, 1260829123538931714),
	(1300619034143801346, 1250717036653326337, 1260829123538931714),
	(1300619034152189954, 1267703863473885186, 1260829123538931714),
	(1300619034160578561, 1252190114092789761, 1260829123538931714),
	(1300619034168967169, 1273806418805284866, 1260829123538931714),
	(1300619034177355777, 1252190377574772738, 1260829123538931714),
	(1300619034185744385, 1252191594883428353, 1260829123538931714),
	(1300619034198327298, 1252445227646562305, 1260829123538931714),
	(1300619034206715906, 1252446258300301314, 1260829123538931714),
	(1300619034215104513, 1252447242422431746, 1260829123538931714),
	(1300619034223493122, 1262581030284525570, 1260829123538931714),
	(1300619034231881730, 1262276820200423425, 1260829123538931714),
	(1300619034240270337, 1273555224350449666, 1260829123538931714),
	(1300619034248658946, 1281499690516439041, 1260829123538931714),
	(1300619034257047553, 1291656441609912321, 1260829123538931714),
	(1300619034265436162, 1272781612135768066, 1260829123538931714),
	(1300619034273824769, 1272791912985681922, 1260829123538931714),
	(1300619034282213378, 1283607043512524801, 1260829123538931714),
	(1300619034294796290, 1273548441347186689, 1260829123538931714),
	(1300619034303184897, 1281501511255416834, 1260829123538931714),
	(1300619034311573505, 1291655737419825153, 1260829123538931714),
	(1300619034319962113, 1291655869653647361, 1260829123538931714),
	(1300619034328350722, 1272792118531743746, 1260829123538931714),
	(1300619034336739329, 1283604889368322050, 1260829123538931714),
	(1300619034345127937, 1273893476789936129, 1260829123538931714),
	(1300619034353516545, 1272787220389978114, 1260829123538931714),
    (1315843630333722626, 1314474440901332993, 1123598816738675201),
    (1315843630333722627, 1314474582710751234, 1123598816738675201),
    (1315843630333722628, 1314474738403315713, 1123598816738675201),
    (1315843630371471361, 1314474819869282306, 1123598816738675201),
    (1315843630379859970, 1314474897845587969, 1123598816738675201),
    (1315843630379859971, 1314474440901332993, 1260829123538931714),
    (1315843630379859972, 1314474582710751234, 1260829123538931714),
    (1315843630379859973, 1314474738403315713, 1260829123538931714),
    (1315843630379859974, 1314474819869282306, 1260829123538931714),
    (1315843630379859975, 1314474897845587969, 1260829123538931714),
    (1315843630329528322, 1314475082021670913, 1123598816738675201),
    (1315843630329528323, 1314475246295781377, 1123598816738675201),
    (1315843630329528324, 1314475337735802881, 1123598816738675201),
    (1315843630329528325, 1314475417159143425, 1123598816738675201),
    (1315843630329528326, 1314475484922318849, 1123598816738675201),
    (1315843630287585281, 1314475082021670913, 1260829123538931714),
    (1315843630300168194, 1314475246295781377, 1260829123538931714),
    (1315843630308556802, 1314475337735802881, 1260829123538931714),
    (1315843630321139714, 1314475417159143425, 1260829123538931714),
    (1315843630329528321, 1314475484922318849, 1260829123538931714),
    (1315843630711209985, 1314475872941576193, 1260829123538931714);
/*!40000 ALTER TABLE `blade_role_menu` ENABLE KEYS */;

-- 导出  表 fizz_manager.blade_role_scope 结构
CREATE TABLE IF NOT EXISTS `blade_role_scope` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `scope_category` int(2) DEFAULT NULL COMMENT '权限类型(1:数据权限、2:接口权限)',
  `scope_id` bigint(64) DEFAULT NULL COMMENT '权限id',
  `role_id` bigint(64) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色数据权限关联表';

-- 正在导出表  fizz_manager.blade_role_scope 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `blade_role_scope` DISABLE KEYS */;
/*!40000 ALTER TABLE `blade_role_scope` ENABLE KEYS */;

-- 导出  表 fizz_manager.blade_scope_api 结构
CREATE TABLE IF NOT EXISTS `blade_scope_api` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `menu_id` bigint(64) DEFAULT NULL COMMENT '菜单主键',
  `resource_code` varchar(255) DEFAULT NULL COMMENT '资源编号',
  `scope_name` varchar(255) DEFAULT NULL COMMENT '接口权限名',
  `scope_path` varchar(255) DEFAULT NULL COMMENT '接口权限地址',
  `scope_type` int(2) DEFAULT NULL COMMENT '接口权限类型',
  `remark` varchar(255) DEFAULT NULL COMMENT '接口权限备注',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='接口权限表';

-- 正在导出表  fizz_manager.blade_scope_api 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `blade_scope_api` DISABLE KEYS */;
/*!40000 ALTER TABLE `blade_scope_api` ENABLE KEYS */;

-- 导出  表 fizz_manager.blade_scope_data 结构
CREATE TABLE IF NOT EXISTS `blade_scope_data` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `menu_id` bigint(64) DEFAULT NULL COMMENT '菜单主键',
  `resource_code` varchar(255) DEFAULT NULL COMMENT '资源编号',
  `scope_name` varchar(255) DEFAULT NULL COMMENT '数据权限名称',
  `scope_field` varchar(255) DEFAULT NULL COMMENT '数据权限字段',
  `scope_class` varchar(500) DEFAULT NULL COMMENT '数据权限类名',
  `scope_column` varchar(255) DEFAULT NULL COMMENT '数据权限字段',
  `scope_type` int(2) DEFAULT NULL COMMENT '数据权限类型',
  `scope_value` varchar(2000) DEFAULT NULL COMMENT '数据权限值域',
  `remark` varchar(255) DEFAULT NULL COMMENT '数据权限备注',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='数据权限表';

-- 正在导出表  fizz_manager.blade_scope_data 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `blade_scope_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `blade_scope_data` ENABLE KEYS */;

-- 导出  表 fizz_manager.blade_sms 结构
CREATE TABLE IF NOT EXISTS `blade_sms` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `category` int(2) DEFAULT NULL COMMENT '分类',
  `sms_code` varchar(32) DEFAULT NULL COMMENT '资源编号',
  `template_id` varchar(64) DEFAULT NULL COMMENT '模板ID',
  `access_key` varchar(255) DEFAULT NULL COMMENT 'accessKey',
  `secret_key` varchar(255) DEFAULT NULL COMMENT 'secretKey',
  `region_id` varchar(255) DEFAULT NULL COMMENT 'regionId',
  `sign_name` varchar(64) DEFAULT NULL COMMENT '短信签名',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='短信配置表';

-- 正在导出表  fizz_manager.blade_sms 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `blade_sms` DISABLE KEYS */;
/*!40000 ALTER TABLE `blade_sms` ENABLE KEYS */;

-- 导出  表 fizz_manager.blade_tenant 结构
CREATE TABLE IF NOT EXISTS `blade_tenant` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `tenant_name` varchar(50) NOT NULL COMMENT '租户名称',
  `domain` varchar(255) DEFAULT NULL COMMENT '域名地址',
  `background_url` varchar(1000) DEFAULT NULL COMMENT '系统背景',
  `linkman` varchar(20) DEFAULT NULL COMMENT '联系人',
  `contact_number` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `account_number` int(11) DEFAULT '-1' COMMENT '账号额度',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='租户表';

-- 正在导出表  fizz_manager.blade_tenant 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `blade_tenant` DISABLE KEYS */;
INSERT INTO `blade_tenant` (`id`, `tenant_id`, `tenant_name`, `domain`, `background_url`, `linkman`, `contact_number`, `address`, `account_number`, `expire_time`, `create_user`, `create_dept`, `create_time`, `update_user`, `update_time`, `status`, `is_deleted`) VALUES
	(1123598820738675201, '000000', '管理组', NULL, NULL, 'admin', '666666', '管理组', -1, NULL, 1123598821738675201, 1123598813738675201, '2019-01-01 00:00:39', 1123598821738675201, '2019-01-01 00:00:39', 1, 0);
/*!40000 ALTER TABLE `blade_tenant` ENABLE KEYS */;

-- 导出  表 fizz_manager.blade_top_menu 结构
CREATE TABLE IF NOT EXISTS `blade_top_menu` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `tenant_id` varchar(12) DEFAULT NULL COMMENT '租户id',
  `code` varchar(255) DEFAULT NULL COMMENT '顶部菜单编号',
  `name` varchar(255) DEFAULT NULL COMMENT '顶部菜单名',
  `source` varchar(255) DEFAULT NULL COMMENT '顶部菜单资源',
  `sort` int(2) DEFAULT NULL COMMENT '顶部菜单排序',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='顶部菜单表';

-- 正在导出表  fizz_manager.blade_top_menu 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `blade_top_menu` DISABLE KEYS */;
INSERT INTO `blade_top_menu` (`id`, `tenant_id`, `code`, `name`, `source`, `sort`, `create_user`, `create_dept`, `create_time`, `update_user`, `update_time`, `status`, `is_deleted`) VALUES
	(1250675404398669825, '000000', '1', '测试顶部', 'iconfont iconicon_roundadd', 1, 1123598821738675201, 1123598813738675201, '2020-04-16 14:40:27', 1123598821738675201, '2020-04-16 14:40:53', 1, 1),
	(1260824982821359618, '000000', '1', '测试', 'iconfont iconicon_roundclose', 1, 1123598821738675201, 1123598813738675201, '2020-05-14 14:51:16', 1123598821738675201, '2020-05-14 14:51:54', 1, 1);
/*!40000 ALTER TABLE `blade_top_menu` ENABLE KEYS */;

-- 导出  表 fizz_manager.blade_top_menu_setting 结构
CREATE TABLE IF NOT EXISTS `blade_top_menu_setting` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `top_menu_id` bigint(64) DEFAULT NULL COMMENT '顶部菜单主键',
  `menu_id` bigint(64) DEFAULT NULL COMMENT '菜单主键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='顶部菜单配置表';

-- 正在导出表  fizz_manager.blade_top_menu_setting 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `blade_top_menu_setting` DISABLE KEYS */;
INSERT INTO `blade_top_menu_setting` (`id`, `top_menu_id`, `menu_id`) VALUES
	(1260825107224416257, 1260824982821359618, 1250688137819074561),
	(1260825107224416258, 1260824982821359618, 1250689454666952706);
/*!40000 ALTER TABLE `blade_top_menu_setting` ENABLE KEYS */;

-- 导出  表 fizz_manager.blade_user 结构
CREATE TABLE IF NOT EXISTS `blade_user` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `code` varchar(12) DEFAULT NULL COMMENT '用户编号',
  `account` varchar(45) DEFAULT NULL COMMENT '账号',
  `password` varchar(45) DEFAULT NULL COMMENT '密码',
  `name` varchar(20) DEFAULT NULL COMMENT '昵称',
  `real_name` varchar(10) DEFAULT NULL COMMENT '真名',
  `avatar` varchar(500) DEFAULT NULL COMMENT '头像',
  `email` varchar(45) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(45) DEFAULT NULL COMMENT '手机',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `sex` smallint(6) DEFAULT NULL COMMENT '性别',
  `role_id` varchar(1000) DEFAULT NULL COMMENT '角色id',
  `dept_id` varchar(1000) DEFAULT NULL COMMENT '部门id',
  `post_id` varchar(1000) DEFAULT NULL COMMENT '岗位id',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- 正在导出表  fizz_manager.blade_user 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `blade_user` DISABLE KEYS */;
INSERT INTO `blade_user` (`id`, `tenant_id`, `code`, `account`, `password`, `name`, `real_name`, `avatar`, `email`, `phone`, `birthday`, `sex`, `role_id`, `dept_id`, `post_id`, `create_user`, `create_dept`, `create_time`, `update_user`, `update_time`, `status`, `is_deleted`) VALUES
	(1123598821738675201, '000000', '', 'admin', 'd06e458bd4bf7cc959b667d587bb0023ceebd4b3', '超级管理员', '超级管理员', 'https://gw.alipayobjects.com/zos/rmsportal/BiazfanxmamNRoxxVxka.png', '', '135', '2020-05-14 12:00:00', 3, '1123598816738675201', '1260823335286165505', '1123598817738675201', 1123598821738675201, 1123598813738675201, '2018-08-08 00:00:00', 1123598821738675201, '2020-08-24 11:29:59', 1, 0),
	(1260845115430141953, '000000', '', 'test', '3f78edefe724173ae574ea30ccc6fdaf8824663d', '测试人员', '测试人员', '', '', '', NULL, -1, '1260829123538931714', '1260831412349652993', '1123598817738675208', 1123598821738675201, 1260823335286165505, '2020-05-14 16:11:16', 1123598821738675201, '2020-07-17 09:55:42', 1, 0);
/*!40000 ALTER TABLE `blade_user` ENABLE KEYS */;

-- 导出  表 fizz_manager.blade_user_dept 结构
CREATE TABLE IF NOT EXISTS `blade_user_dept` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `user_id` bigint(64) DEFAULT '0' COMMENT '用户ID',
  `dept_id` bigint(64) DEFAULT '0' COMMENT '部门ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户部门表';

-- 正在导出表  fizz_manager.blade_user_dept 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `blade_user_dept` DISABLE KEYS */;
INSERT INTO `blade_user_dept` (`id`, `user_id`, `dept_id`) VALUES
	(1283943304521601025, 1260845115430141953, 1260831412349652993),
	(1287653944620871682, 1123598821738675201, 1260823335286165505);
/*!40000 ALTER TABLE `blade_user_dept` ENABLE KEYS */;

-- 导出  表 fizz_manager.tb_aggregate_apply 结构
CREATE TABLE IF NOT EXISTS `tb_aggregate_apply` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `type` tinyint(4) NOT NULL COMMENT '申请类型：0-发布 1-下线',
  `reason` varchar(2000) DEFAULT NULL COMMENT '申请原因',
  `approval_result` tinyint(4) DEFAULT NULL COMMENT '审核结果 1-审核不通过 2-审核通过',
  `approval_user` bigint(20) DEFAULT NULL COMMENT '审核人用户ID',
  `approval_by` varchar(20) DEFAULT NULL COMMENT '审核人名字',
  `approval_time` datetime DEFAULT NULL COMMENT '审核时间',
  `approval_remark` varchar(2000) DEFAULT NULL COMMENT '审核备注',
  `create_by` varchar(20) NOT NULL COMMENT '创建人名字（申请人）',
  `create_user` bigint(64) NOT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态 0-待审核 1-审核不通过 2-审核通过 3-撤回',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='聚合配置发布|下线申请';

-- 正在导出表  fizz_manager.tb_aggregate_apply 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `tb_aggregate_apply` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_aggregate_apply` ENABLE KEYS */;

-- 导出  表 fizz_manager.tb_aggregate_apply_approval_log 结构
CREATE TABLE IF NOT EXISTS `tb_aggregate_apply_approval_log` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `apply_id` bigint(64) NOT NULL COMMENT 'tb_aggregate_apply表主键',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `type` tinyint(4) NOT NULL COMMENT '申请类型：0-发布 1-下线',
  `reason` varchar(2000) DEFAULT NULL COMMENT '申请原因',
  `apply_by` varchar(20) NOT NULL COMMENT '申请人名字',
  `apply_user` bigint(64) NOT NULL COMMENT '申请人',
  `apply_time` datetime NOT NULL COMMENT '申请时间',
  `approval_result` tinyint(4) NOT NULL COMMENT '审核结果 1-审核不通过 2-审核通过',
  `approval_user` bigint(20) NOT NULL COMMENT '审核人用户ID',
  `approval_by` varchar(20) NOT NULL COMMENT '审核人名字',
  `approval_time` datetime NOT NULL COMMENT '审核时间',
  `approval_remark` varchar(2000) DEFAULT NULL COMMENT '审核备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='聚合配置发布|下线申请审核日志';

-- 正在导出表  fizz_manager.tb_aggregate_apply_approval_log 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `tb_aggregate_apply_approval_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_aggregate_apply_approval_log` ENABLE KEYS */;

-- 导出  表 fizz_manager.tb_aggregate_apply_approval_log_config_relation 结构
CREATE TABLE IF NOT EXISTS `tb_aggregate_apply_approval_log_config_relation` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `log_id` bigint(64) NOT NULL COMMENT 'tb_aggregate_apply_approval_log表主键',
  `service_id` bigint(64) NOT NULL COMMENT 'tb_service表主键',
  `service_name` varchar(200) NOT NULL COMMENT '服务名称',
  `config_id` bigint(64) NOT NULL COMMENT 'tb_aggregate_config表主键',
  `config_name` varchar(200) NOT NULL COMMENT '接口名',
  `order_by` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `log_id` (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='聚合配置发布|下线申请审核日志配置关联';

-- 正在导出表  fizz_manager.tb_aggregate_apply_approval_log_config_relation 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `tb_aggregate_apply_approval_log_config_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_aggregate_apply_approval_log_config_relation` ENABLE KEYS */;

-- 导出  表 fizz_manager.tb_aggregate_apply_config_op_log 结构
CREATE TABLE IF NOT EXISTS `tb_aggregate_apply_config_op_log` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `apply_id` bigint(64) NOT NULL COMMENT 'tb_aggregate_apply表主键',
  `service_id` bigint(64) NOT NULL COMMENT 'tb_service表主键',
  `service_name` varchar(200) NOT NULL COMMENT '服务名',
  `config_id` bigint(64) NOT NULL COMMENT 'tb_aggregate_config表主键',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '接口名',
  `remark` varchar(2000) DEFAULT NULL COMMENT '备注',
  `op_type` tinyint(4) NOT NULL COMMENT '操作类型 0-接口发布 1-接口下线 2-接口回滚 3-接口撤回 4-申请提交 5-申请撤回 6-申请重新提交 7-审核不通过 8-审核通过 9-修改审核人',
  `op_user_id` bigint(20) NOT NULL COMMENT '操作人用户ID',
  `op_by` varchar(50) NOT NULL COMMENT '操作人',
  `op_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `apply_id` (`apply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='聚合配置发布|下线申请关联配置操作日志（申请相关操作也记录进该表）';

-- 正在导出表  fizz_manager.tb_aggregate_apply_config_op_log 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `tb_aggregate_apply_config_op_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_aggregate_apply_config_op_log` ENABLE KEYS */;

-- 导出  表 fizz_manager.tb_aggregate_apply_config_relation 结构
CREATE TABLE IF NOT EXISTS `tb_aggregate_apply_config_relation` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `apply_id` bigint(64) NOT NULL COMMENT 'tb_aggregate_apply表主键',
  `service_id` bigint(64) NOT NULL COMMENT 'tb_service表主键',
  `service_name` varchar(200) NOT NULL COMMENT '服务名称',
  `config_id` bigint(64) NOT NULL COMMENT 'tb_aggregate_config表主键',
  `config_name` varchar(200) NOT NULL COMMENT '接口名',
  `order_by` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `apply_id` (`apply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='聚合配置发布|下线申请配置关联';

-- 正在导出表  fizz_manager.tb_aggregate_apply_config_relation 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `tb_aggregate_apply_config_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_aggregate_apply_config_relation` ENABLE KEYS */;

-- 导出  表 fizz_manager.tb_aggregate_config_history 结构
CREATE TABLE IF NOT EXISTS `tb_aggregate_config_history` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `origin_id` bigint(64) NOT NULL COMMENT '聚合配置表ID',
  `service_id` bigint(64) NOT NULL COMMENT '服务ID',
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接口名（对应配置里的name，同一服务下唯一）',
  `description` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '接口描述',
  `developer` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '开发人员',
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接口请求method类型',
  `path` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接口请求路径（格式：/proxy/服务名/**）',
  `config` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配置信息',
  `publisher` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发布人',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `publish_type` tinyint(3) unsigned NOT NULL COMMENT '发布类型：0-普通发布 1-回滚',
  `last_publish_id` bigint(20) DEFAULT NULL COMMENT '上一次发布ID，用于回滚',
  `version` bigint(20) DEFAULT NULL COMMENT '版本号',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`),
  KEY `origin_id_create_time` (`origin_id`,`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='聚合配置发布历史';

-- 正在导出表  fizz_manager.tb_aggregate_config_history 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `tb_aggregate_config_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_aggregate_config_history` ENABLE KEYS */;

-- 导出  表 fizz_manager.tb_aggregate_config_script 结构
CREATE TABLE IF NOT EXISTS `tb_aggregate_config_script` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `config_id` bigint(64) DEFAULT NULL COMMENT '该脚本所属的聚合配置ID',
  `script` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '脚本配置',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='聚合配置脚本';

-- 正在导出表  fizz_manager.tb_aggregate_config_script 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `tb_aggregate_config_script` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_aggregate_config_script` ENABLE KEYS */;

-- 导出  表 fizz_manager.tb_aggregate_config_script_history 结构
CREATE TABLE IF NOT EXISTS `tb_aggregate_config_script_history` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `script` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '脚本配置',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='聚合配置脚本发布历史';

-- 正在导出表  fizz_manager.tb_aggregate_config_script_history 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `tb_aggregate_config_script_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_aggregate_config_script_history` ENABLE KEYS */;

-- 导出  表 fizz_manager.tb_aggregate_op_log 结构
CREATE TABLE IF NOT EXISTS `tb_aggregate_op_log` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `service_id` bigint(64) NOT NULL COMMENT 'tb_service表主键',
  `service_name` varchar(200) NOT NULL COMMENT '服务名',
  `config_id` bigint(64) NOT NULL COMMENT 'tb_aggregate_config表主键',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '接口名',
  `description` varchar(2000) DEFAULT NULL COMMENT '接口描述',
  `developer` varchar(200) DEFAULT NULL COMMENT '开发人员',
  `method` varchar(10) NOT NULL COMMENT '接口请求method类型',
  `path` varchar(2000) NOT NULL COMMENT '接口请求路径（格式：/proxy/服务名/**）',
  `op_type` tinyint(4) NOT NULL COMMENT '操作类型 0-新增 1-修改 2-发布 3-下线 4-回滚 5-删除',
  `config` mediumtext NOT NULL COMMENT '配置信息',
  `version` bigint(20) DEFAULT NULL COMMENT '版本号',
  `op_user_id` bigint(20) NOT NULL COMMENT '操作人用户ID',
  `op_by` varchar(50) NOT NULL COMMENT '操作人',
  `op_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `op_time` (`op_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='聚合配置操作日志';

-- 正在导出表  fizz_manager.tb_aggregate_op_log 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `tb_aggregate_op_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_aggregate_op_log` ENABLE KEYS */;

-- 导出  表 fizz_manager.tb_aggregate_op_log_script_relation 结构
CREATE TABLE IF NOT EXISTS `tb_aggregate_op_log_script_relation` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `script` mediumtext NOT NULL COMMENT '脚本配置',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='聚合配置操作日志脚本关联';

-- 正在导出表  fizz_manager.tb_aggregate_op_log_script_relation 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `tb_aggregate_op_log_script_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_aggregate_op_log_script_relation` ENABLE KEYS */;

-- 导出  表 fizz_manager.tb_aggregate_test 结构
CREATE TABLE IF NOT EXISTS `tb_aggregate_test` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(2000) DEFAULT NULL COMMENT '测试用例名称',
  `config_id` bigint(64) NOT NULL COMMENT '聚合配置ID，tb_aggregate_config表主键',
  `content` mediumtext COMMENT '测试用例内容',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='聚合测试用例';

-- 正在导出表  fizz_manager.tb_aggregate_test 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `tb_aggregate_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_aggregate_test` ENABLE KEYS */;

-- 导出  表 fizz_manager.tb_aggregate_test_cookies 结构
CREATE TABLE IF NOT EXISTS `tb_aggregate_test_cookies` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content` mediumtext COMMENT 'cookies内容',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='聚合测试请求cookies';

-- 正在导出表  fizz_manager.tb_aggregate_test_cookies 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `tb_aggregate_test_cookies` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_aggregate_test_cookies` ENABLE KEYS */;

-- 导出  表 fizz_manager.tb_api_plugin 结构
CREATE TABLE IF NOT EXISTS `tb_api_plugin` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '整型自增主键',
  `api` mediumint(8) unsigned NOT NULL COMMENT 'tb_api_auth_opt的id',
  `plugin` mediumint(8) unsigned NOT NULL COMMENT 'tb_plugin的id',
  `order` tinyint(3) unsigned NOT NULL COMMENT 'plug执行顺序',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`),
  KEY `api` (`api`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  fizz_manager.tb_api_plugin 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `tb_api_plugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_api_plugin` ENABLE KEYS */;

-- 导出  表 fizz_manager.tb_api_plugin_config 结构
CREATE TABLE IF NOT EXISTS `tb_api_plugin_config` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '整型自增主键',
  `api_plugin` mediumint(8) unsigned NOT NULL COMMENT 'tb_api_plugin的id',
  `item` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '插件配置项的英文名，即tb_plugin.config中的',
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '配置项值的类型，与tb_plugin.config中的一致',
  `value` varchar(4000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配置项的值',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`),
  KEY `api_plugin` (`api_plugin`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  fizz_manager.tb_api_plugin_config 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `tb_api_plugin_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_api_plugin_config` ENABLE KEYS */;

-- 导出  表 fizz_manager.tb_mail 结构
CREATE TABLE IF NOT EXISTS `tb_mail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `subject` varchar(200) NOT NULL DEFAULT '' COMMENT '主题',
  `to` varchar(100) NOT NULL DEFAULT '' COMMENT '收件人',
  `text` mediumtext NOT NULL COMMENT '内容',
  `try_count` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '尝试发送次数',
  `biz_type` tinyint(3) unsigned NOT NULL COMMENT '业务类型 0-发布|下线申请 1-发布|下线申请撤回',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态 0-待发送 1-已发送 2-发送失败',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_deleted` tinyint(4) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件';

-- 正在导出表  fizz_manager.tb_mail 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `tb_mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_mail` ENABLE KEYS */;

-- 导出  表 fizz_manager.tb_plugin 结构
CREATE TABLE IF NOT EXISTS `tb_plugin` (
  `fixed_config` TEXT NULL COLLATE 'utf8mb4_unicode_ci',
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '整型自增主键',
  `eng_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'plugin的英文名',
  `chn_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'plugin的中文名',
  `config` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'json字符串，插件配置说明，前端可据此生成配置表单',
  `order` tinyint(3) unsigned NOT NULL COMMENT 'plugin默认执行顺序',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  fizz_manager.tb_plugin 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `tb_plugin` DISABLE KEYS */;
INSERT INTO `tb_plugin` (`fixed_config`, `eng_name`, `chn_name`, `config`, `order`, `create_user`, `create_dept`, `create_time`, `update_user`, `update_time`, `status`, `is_deleted`) VALUES
    ('{"users":{"abc":"Abcd1234!"}}', 'basicAuthPlugin', 'Basic Auth校验', '', 10, NULL, NULL, '2021-01-28 11:44:58', NULL, '2021-01-28 15:20:18', 1, 0),
    ('{\n"secretKey": "123456", \n"secretKey_desc": "secret key for HS256/HS384/HS512 Algorithm", \n"publicKey": "-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAuGbXWiK3dQTyCbX5xdE4\nyCuYp0AF2d15Qq1JSXT/lx8CEcXb9RbDddl8jGDv+spi5qPa8qEHiK7FwV2KpRE9\n83wGPnYsAm9BxLFb4YrLYcDFOIGULuk2FtrPS512Qea1bXASuvYXEpQNpGbnTGVs\nWXI9C+yjHztqyL2h8P6mlThPY9E9ue2fCqdgixfTFIF9Dm4SLHbphUS2iw7w1JgT\n69s7of9+I9l5lsJ9cozf1rxrXX4V1u/SotUuNB3Fp8oB4C1fLBEhSlMcUJirz1E8\nAziMCxS+VrRPDM+zfvpIJg3JljAh3PJHDiLu902v9w+Iplu1WyoB2aPfitxEhRN0\nYwIDAQAB\n-----END PUBLIC KEY-----",\n"publicKey_desc": "public key for RS256/RS384/RS512/ES256/ES256K/ES384/ES512 Algorithm" \n}', 'jwtAuthPlugin', 'JWT校验', '[{"field":"key","label":"密钥","component":"textarea","dataType":"string","desc":"用于校验JWT的密钥，RS256/RS384/RS512/ES256/ES256K/ES384/ES512算法则填写公钥；为空则使用\\"插件管理->自定义配置\\"里的全局密钥。","rules":[]},{"field":"extractClaims","label":"","component":"checkbox","dataType":"array","options":[{"label":"提取JWT Claims到上下文","value":true}],"desc":"把Claims放到上下文的“jwt.claims”属性","rules":[]},{"field":"passHeader","label":"","component":"checkbox","dataType":"array","default":true,"options":[{"label":"透传JWT请求头到目标接口","value":true}],"desc":"","rules":[]},{"field":"statusCode","label":"HTTP状态码","component":"select","dataType":"number","default":200,"options":[{"label":"100 - Continue","value":100},{"label":"101 - Switching Protocols","value":101},{"label":"102 - Processing","value":102},{"label":"103 - Checkpoint","value":103},{"label":"200 - OK","value":200},{"label":"201 - Created","value":201},{"label":"202 - Accepted","value":202},{"label":"203 - Non-Authoritative Information","value":203},{"label":"204 - No Content","value":204},{"label":"205 - Reset Content","value":205},{"label":"206 - Partial Content","value":206},{"label":"207 - Multi-Status","value":207},{"label":"208 - Already Reported","value":208},{"label":"226 - IM Used","value":226},{"label":"300 - Multiple Choices","value":300},{"label":"301 - Moved Permanently","value":301},{"label":"302 - Found","value":302},{"label":"302 - Moved Temporarily","value":302},{"label":"303 - See Other","value":303},{"label":"304 - Not Modified","value":304},{"label":"305 - Use Proxy","value":305},{"label":"307 - Temporary Redirect","value":307},{"label":"308 - Permanent Redirect","value":308},{"label":"400 - Bad Request","value":400},{"label":"401 - Unauthorized","value":401},{"label":"402 - Payment Required","value":402},{"label":"403 - Forbidden","value":403},{"label":"404 - Not Found","value":404},{"label":"405 - Method Not Allowed","value":405},{"label":"406 - Not Acceptable","value":406},{"label":"407 - Proxy Authentication Required","value":407},{"label":"408 - Request Timeout","value":408},{"label":"409 - Conflict","value":409},{"label":"410 - Gone","value":410},{"label":"411 - Length Required","value":411},{"label":"412 - Precondition Failed","value":412},{"label":"413 - Payload Too Large","value":413},{"label":"413 - Request Entity Too Large","value":413},{"label":"414 - URI Too Long","value":414},{"label":"414 - Request-URI Too Long","value":414},{"label":"415 - Unsupported Media Type","value":415},{"label":"416 - Requested range not satisfiable","value":416},{"label":"417 - Expectation Failed","value":417},{"label":"418 - I\'m a teapot","value":418},{"label":"419 - Insufficient Space On Resource","value":419},{"label":"420 - Method Failure","value":420},{"label":"421 - Destination Locked","value":421},{"label":"422 - Unprocessable Entity","value":422},{"label":"423 - Locked","value":423},{"label":"424 - Failed Dependency","value":424},{"label":"425 - Too Early","value":425},{"label":"426 - Upgrade Required","value":426},{"label":"428 - Precondition Required","value":428},{"label":"429 - Too Many Requests","value":429},{"label":"431 - Request Header Fields Too Large","value":431},{"label":"451 - Unavailable For Legal Reasons","value":451},{"label":"500 - Internal Server Error","value":500},{"label":"501 - Not Implemented","value":501},{"label":"502 - Bad Gateway","value":502},{"label":"503 - Service Unavailable","value":503},{"label":"504 - Gateway Timeout","value":504},{"label":"505 - HTTP Version not supported","value":505},{"label":"506 - Variant Also Negotiates","value":506},{"label":"507 - Insufficient Storage","value":507},{"label":"508 - Loop Detected","value":508},{"label":"509 - Bandwidth Limit Exceeded","value":509},{"label":"510 - Not Extended","value":510},{"label":"511 - Network Authentication Required","value":511}],"desc":"校验失败时响应的HTTP状态码","placeholder":"请选择","rules":[{"required":true,"message":"HTTP状态码不能为空","trigger":"change"}]},{"field":"contentType","label":"响应头content-type","component":"input","dataType":"string","default":"application/json; charset=UTF-8","desc":"校验失败时响应头的content-type","rules":[]},{"field":"respBody","label":"响应报文","component":"input","dataType":"string","desc":"校验失败时响应报文, 如：{\\"message\\": \\"invalid token\\"}","rules":[]}]', 10, NULL, NULL, '2021-01-29 16:50:27', NULL, '2021-02-01 16:06:08', 1, 0);
/*!40000 ALTER TABLE `tb_plugin` ENABLE KEYS */;

-- 导出  表 fizz_manager.tb_service 结构
CREATE TABLE IF NOT EXISTS `tb_service` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '服务名',
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '服务中文名',
  `description` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `team` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '团队',
  `person_in_charge` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '负责人',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='服务管理';

-- 正在导出表  fizz_manager.tb_service 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `tb_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_service` ENABLE KEYS */;

-- 导出  表 fizz_manager.tb_service_user_relation 结构
CREATE TABLE IF NOT EXISTS `tb_service_user_relation` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `service_id` bigint(64) NOT NULL COMMENT 'tb_service表主键',
  `user_id` bigint(64) NOT NULL COMMENT 'blade_user表主键',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`),
  KEY `service_id` (`service_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='服务用户关联';

-- 正在导出表  fizz_manager.tb_service_user_relation 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `tb_service_user_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_service_user_relation` ENABLE KEYS */;

-- 导出  表 fizz_manager.tb_aggregate_config 结构
CREATE TABLE IF NOT EXISTS `tb_aggregate_config` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `service_id` bigint(64) NOT NULL COMMENT '服务ID',
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接口名（对应配置里的name，同一服务下唯一）',
  `description` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '接口描述',
  `developer` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '开发人员',
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接口请求method类型',
  `path` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接口请求路径（格式：/proxy/服务名/**）',
  `debug_mode` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调试模式：0-禁用 1-启用',
  `config` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配置信息',
  `current_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '当前状态：0-未发布 1-已发布 2-已下线',
  `approval_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '审核状态：0-未申请 1-待审核 2-待发布 3-待下线 4-审核不通过 5-已操作 6-回滚 7-撤回',
  `apply_id` bigint(20) DEFAULT NULL COMMENT '申请ID，tb_aggregate_apply表中的ID',
  `is_modified` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否已修改：0-未修改 1-已修改（在发布或者下线后配置编辑过）',
  `publish_id` bigint(20) DEFAULT NULL COMMENT '当前发布版本ID，对应tb_aggregate_config_history表中的ID',
  `test_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '测试ID',
  `version` bigint(20) DEFAULT '1' COMMENT '版本号',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`),
  KEY `group_id_name_title` (`service_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='聚合配置';

-- 数据导出被取消选择。

-- 导出  表 fizz_manager.tb_api_auth_opt 结构
CREATE TABLE IF NOT EXISTS `tb_api_auth_opt` (
     `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '整型自增主键',
     `gateway_group` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '网关分组，c：2c分组（默认），b：2b分组，t：面向第三方的分组',
     `service` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '网关代理的服务',
     `method` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'path对应的http method，默认空',
     `path` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '服务对外暴露的请求路径，默认空，也相当/',
     `backend_service` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '后端服务名',
     `backend_path` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '后端API路径',
     `app` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '对应tb_app_auth中的app，默认空，代表2c/2b的应用，否则为第三方应用',
     `app_enabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT '启用调用方验证 1-启用 0-不启用',
     `access` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '访问控制，a：允许（默认），f：禁止',
     `proxy_mode` tinyint(4) NOT NULL COMMENT '路由类型, 1:服务编排, 2:服务发现, 3:反向代理 4:回调',
     `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
     `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
     `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
     `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
     `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
     `status` int(2) DEFAULT NULL COMMENT '状态',
     `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
     PRIMARY KEY (`id`),
     KEY `gateway_group_service_method_path_app` (`gateway_group`,`service`,`method`,`path`,`app`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 数据导出被取消选择。

-- 导出  表 fizz_manager.tb_api_backend_opt 结构
CREATE TABLE IF NOT EXISTS `tb_api_backend_opt` (
    `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `api` bigint(64) NOT NULL COMMENT 'api ID, 对应tb_api_auth表的ID',
    `backend_url` varchar(255) NOT NULL COMMENT '后端服务URL',
    `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
    `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
    `create_time` datetime DEFAULT NULL COMMENT '创建时间',
    `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
    `update_time` datetime DEFAULT NULL COMMENT '修改时间',
    `status` int(2) DEFAULT NULL COMMENT '状态',
    `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
    PRIMARY KEY (`id`),
    KEY `api` (`api`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 fizz_manager.tb_app_auth 结构
CREATE TABLE IF NOT EXISTS `tb_app_auth` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '整型自增主键',
  `app` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '第三方应用id',
  `app_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '第三方应用名',
  `secretkey` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '第三方应用的密钥',
  `use_white_list` int(2) NOT NULL DEFAULT '0' COMMENT '是否启用白名单 0-不启用 1-启用',
  `auth_ips` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'IP白名单，多个IP用逗号分隔',
  `use_auth` int(2) NOT NULL DEFAULT '0' COMMENT '是否启用签名 0-否 1-是',
  `auth_type` int(2) DEFAULT NULL COMMENT '认证方式 1-密钥 2-自定义认证插件',
  `custom_config` text COLLATE utf8mb4_unicode_ci COMMENT '自定义配置信息',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`),
  KEY `app` (`app`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 数据导出被取消选择。

-- 导出  表 fizz_manager.tb_gateway_group 结构
CREATE TABLE IF NOT EXISTS `tb_gateway_group` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `group_id` varchar(32) NOT NULL COMMENT '网关分组ID',
  `group_name` varchar(32) NOT NULL COMMENT '网关分组名称',
  `instance_ips` varchar(4000) DEFAULT NULL COMMENT '实例IP，多个逗号分隔',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='网关分组';

INSERT INTO `tb_gateway_group` (`group_id`, `group_name`, `instance_ips`) VALUES ('default', '默认分组', NULL);

-- 导出  表 fizz_manager.tb_interface_stat 结构
CREATE TABLE IF NOT EXISTS `tb_interface_stat` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `stat_date` datetime NOT NULL COMMENT '统计日期',
  `gateway_group` varchar(32) NOT NULL DEFAULT '' COMMENT '网关分组，c：2c分组，b：2b分组，t：面向第三方的分组',
  `interface_count` bigint(20) NOT NULL COMMENT '接口总数',
  `access_count` bigint(20) NOT NULL COMMENT '访问次数',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stat_date_gateway_group_unique` (`stat_date`,`gateway_group`),
  KEY `stat_date_gateway_group` (`stat_date`,`gateway_group`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='接口统计';

-- 数据导出被取消选择。

-- 导出  表 fizz_manager.tb_source_stat 结构
CREATE TABLE IF NOT EXISTS `tb_source_stat` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `ip` varchar(20) NOT NULL COMMENT 'IP地址',
  `gateway_group` varchar(32) NOT NULL DEFAULT '' COMMENT '网关分组',
  `service` varchar(50) NOT NULL COMMENT '网关代理的服务',
  `appid` varchar(200) DEFAULT NULL COMMENT '对应tb_app_auth中的app，代表2c/2b的应用，否则为第三方应用',
  `api_method` varchar(8) NOT NULL COMMENT 'path对应的http method',
  `api_path` varchar(500) NOT NULL COMMENT '请求路径',
  `recent_req_time` datetime NOT NULL COMMENT '最近请求时间',
  `req_count` bigint(20) NOT NULL COMMENT '请求次数',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip_gateway_group_service_appid_api_method_api_path` (`ip`,`gateway_group`,`service`,`appid`,`api_method`,`api_path`),
  KEY `recent_req_time` (`recent_req_time`),
  KEY `appid` (`appid`),
  KEY `api_path` (`api_path`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='请求源统计';

-- 数据导出被取消选择。

-- 导出  表 fizz_manager.tb_source_stat_simple 结构
CREATE TABLE IF NOT EXISTS `tb_source_stat_simple` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `gateway_group` varchar(32) NOT NULL DEFAULT '' COMMENT '网关分组',
  `service` varchar(50) NOT NULL COMMENT '网关代理的服务',
  `appid` varchar(200) DEFAULT NULL COMMENT '对应tb_app_auth中的app，代表2c/2b的应用，否则为第三方应用',
  `api_method` varchar(8) NOT NULL COMMENT 'path对应的http method',
  `api_path` varchar(500) NOT NULL COMMENT '请求路径',
  `recent_req_time` datetime NOT NULL COMMENT '最近请求时间',
  `req_count` bigint(20) NOT NULL COMMENT '请求次数',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `gateway_group_service_appid_api_method_api_path` (`gateway_group`,`service`,`appid`,`api_method`,`api_path`),
  KEY `recent_req_time` (`recent_req_time`),
  KEY `appid` (`appid`),
  KEY `api_path` (`api_path`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='请求源统计,比tb_source_stat表少了ip字段';

-- 数据导出被取消选择。

-- 导出  表 fizz_manager.tb_gateway_log 结构
DROP TABLE IF EXISTS `tb_gateway_log`;
CREATE TABLE IF NOT EXISTS `tb_gateway_log` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `biz_id` varchar(50) NOT NULL DEFAULT '' COMMENT '业务ID',
    `server_ip` varchar(50) NOT NULL DEFAULT '' COMMENT '服务器IP地址',
    `level` int(10) NOT NULL COMMENT '日志等级 100-FATAL 200-ERROR 300-WARN 400-INFO 500-DEBUG 600-TRACE',
    `log_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '日志时间',
    `content` text NOT NULL COMMENT '日志内容',
    PRIMARY KEY (`id`),
    KEY `biz_id` (`biz_id`),
    KEY `log_time` (`log_time`),
    KEY `server_ip_log_time_level` (`server_ip`,`log_time`,`level`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='网关日志';

-- 导出  表 fizz_manager.tb_flow_control_rule 结构
CREATE TABLE IF NOT EXISTS `tb_flow_control_rule` (
      `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '整型自增主键',
      `type` tinyint(3) unsigned NOT NULL COMMENT '流控类型 1-全局配置 2-服务默认配置 3-服务',
      `service` varchar(50) DEFAULT NULL COMMENT '前端服务名',
      `qps` int(10) unsigned DEFAULT NULL COMMENT '每秒请求数',
      `concurrent` int(10) unsigned DEFAULT NULL COMMENT '并发数',
      `response_content_type` varchar(100) DEFAULT NULL COMMENT '限流响应ContentType',
      `response_content` text COMMENT '限流响应报文',
      `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
      `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
      `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
      `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
      `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
      `status` int(2) DEFAULT '1' COMMENT '状态 0-不启用 1-启用',
      `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
      PRIMARY KEY (`id`),
      KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='流控规则';

-- 数据导出被取消选择。

-- 导出  表 fizz_manager.tb_flow_stat 结构
CREATE TABLE IF NOT EXISTS `tb_flow_stat` (
        `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '整型自增主键',
        `flow_control_rule_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'tb_flow_control_rule表ID',
        `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '流控类型 1-全局配置 2-服务默认配置 3-服务',
        `resource` varchar(250) NOT NULL DEFAULT '' COMMENT '资源ID',
        `ip` varchar(20) NOT NULL DEFAULT '' COMMENT '服务器IP地址',
        `interval_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '统计时间间隔类型 0-10秒（6分钟） 1-1分钟（4小时） 2-5分钟（13小时） 3-60分钟（120天） 4-24小时（永久）',
        `interval_type_second` int(11) NOT NULL DEFAULT '2147483647' COMMENT '统计时间间隔秒数',
        `start_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '开始时间',
        `next_interval_type_start_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '下一统计时间间隔类型开始时间',
        `next_interval_type_second` int(11) NOT NULL DEFAULT '2147483647' COMMENT '下一统计时间间隔秒数',
        `min` bigint(20) unsigned NOT NULL DEFAULT '9223372036854775807' COMMENT '最小响应时间',
        `max` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '最大响应时间',
        `avg_rt` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '平均响应时间',
        `total` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '总请求数',
        `completed` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '完成请求数',
        `error` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '总错误数',
        `rps` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均每秒请求数',
        `peak_concurrent` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最高并发数',
        `block` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '阻断请求数',
        `total_block` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '总阻断请求数(实际请求被阻断数)',
        `create_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
        PRIMARY KEY (`id`),
        UNIQUE KEY `unique_fcr_id_type_resource_ip_interval_type_start_time` (`flow_control_rule_id`,`type`,`resource`,`ip`,`interval_type`,`start_time`),
        KEY `key_interval_type_start_time` (`interval_type`,`start_time`),
        KEY `key_resource_id_interval_type_start_time_ip` (`resource`,`interval_type`,`start_time`,`ip`),
        KEY `key_flow_control_rule_id_interval_type_start_time_ip` (`flow_control_rule_id`,`interval_type`,`start_time`,`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='流量统计';

CREATE TABLE `tb_flow_stat_1` (
      `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '整型自增主键',
      `flow_control_rule_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'tb_flow_control_rule表ID',
      `type` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '流控类型 1-全局配置 2-服务默认配置 3-服务',
      `resource` VARCHAR(250) NOT NULL DEFAULT '' COMMENT '资源ID',
      `ip` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '服务器IP地址',
      `interval_type` TINYINT(3) NOT NULL DEFAULT '0' COMMENT '统计时间间隔类型 0-10秒（6分钟） 1-1分钟（4小时） 2-5分钟（13小时） 3-60分钟（120天） 4-24小时（永久）',
      `interval_type_second` INT(11) NOT NULL DEFAULT '2147483647' COMMENT '统计时间间隔秒数',
      `start_time` BIGINT(20) NOT NULL DEFAULT '0' COMMENT '开始时间',
      `next_interval_type_start_time` BIGINT(20) NOT NULL DEFAULT '0' COMMENT '下一统计时间间隔类型开始时间',
      `next_interval_type_second` INT(11) NOT NULL DEFAULT '2147483647' COMMENT '下一统计时间间隔秒数',
      `min` BIGINT(20) UNSIGNED NOT NULL DEFAULT '9223372036854775807' COMMENT '最小响应时间',
      `max` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最大响应时间',
      `avg_rt` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '平均响应时间',
      `total` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '总请求数',
      `completed` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '完成请求数',
      `error` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '总错误数',
      `rps` DECIMAL(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '平均每秒请求数',
      `peak_concurrent` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最高并发数',
      `block` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '阻断请求数',
      `total_block` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '总阻断请求数(实际请求被阻断数)',
      `create_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
      PRIMARY KEY (`id`),
      UNIQUE INDEX `unique_fcr_id_type_resource_ip_interval_type_start_time` (`flow_control_rule_id`, `type`, `resource`, `ip`, `interval_type`, `start_time`),
      INDEX `key_interval_type_start_time` (`interval_type`, `start_time`),
      INDEX `key_resource_id_interval_type_start_time_ip` (`resource`, `interval_type`, `start_time`, `ip`),
      INDEX `key_flow_control_rule_id_interval_type_start_time_ip` (`flow_control_rule_id`, `interval_type`, `start_time`, `ip`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='流量统计';
CREATE TABLE `tb_flow_stat_2` (
      `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '整型自增主键',
      `flow_control_rule_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'tb_flow_control_rule表ID',
      `type` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '流控类型 1-全局配置 2-服务默认配置 3-服务',
      `resource` VARCHAR(250) NOT NULL DEFAULT '' COMMENT '资源ID',
      `ip` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '服务器IP地址',
      `interval_type` TINYINT(3) NOT NULL DEFAULT '0' COMMENT '统计时间间隔类型 0-10秒（6分钟） 1-1分钟（4小时） 2-5分钟（13小时） 3-60分钟（120天） 4-24小时（永久）',
      `interval_type_second` INT(11) NOT NULL DEFAULT '2147483647' COMMENT '统计时间间隔秒数',
      `start_time` BIGINT(20) NOT NULL DEFAULT '0' COMMENT '开始时间',
      `next_interval_type_start_time` BIGINT(20) NOT NULL DEFAULT '0' COMMENT '下一统计时间间隔类型开始时间',
      `next_interval_type_second` INT(11) NOT NULL DEFAULT '2147483647' COMMENT '下一统计时间间隔秒数',
      `min` BIGINT(20) UNSIGNED NOT NULL DEFAULT '9223372036854775807' COMMENT '最小响应时间',
      `max` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最大响应时间',
      `avg_rt` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '平均响应时间',
      `total` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '总请求数',
      `completed` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '完成请求数',
      `error` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '总错误数',
      `rps` DECIMAL(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '平均每秒请求数',
      `peak_concurrent` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最高并发数',
      `block` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '阻断请求数',
      `total_block` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '总阻断请求数(实际请求被阻断数)',
      `create_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
      PRIMARY KEY (`id`),
      UNIQUE INDEX `unique_fcr_id_type_resource_ip_interval_type_start_time` (`flow_control_rule_id`, `type`, `resource`, `ip`, `interval_type`, `start_time`),
      INDEX `key_interval_type_start_time` (`interval_type`, `start_time`),
      INDEX `key_resource_id_interval_type_start_time_ip` (`resource`, `interval_type`, `start_time`, `ip`),
      INDEX `key_flow_control_rule_id_interval_type_start_time_ip` (`flow_control_rule_id`, `interval_type`, `start_time`, `ip`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='流量统计';
CREATE TABLE `tb_flow_stat_3` (
      `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '整型自增主键',
      `flow_control_rule_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'tb_flow_control_rule表ID',
      `type` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '流控类型 1-全局配置 2-服务默认配置 3-服务',
      `resource` VARCHAR(250) NOT NULL DEFAULT '' COMMENT '资源ID',
      `ip` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '服务器IP地址',
      `interval_type` TINYINT(3) NOT NULL DEFAULT '0' COMMENT '统计时间间隔类型 0-10秒（6分钟） 1-1分钟（4小时） 2-5分钟（13小时） 3-60分钟（120天） 4-24小时（永久）',
      `interval_type_second` INT(11) NOT NULL DEFAULT '2147483647' COMMENT '统计时间间隔秒数',
      `start_time` BIGINT(20) NOT NULL DEFAULT '0' COMMENT '开始时间',
      `next_interval_type_start_time` BIGINT(20) NOT NULL DEFAULT '0' COMMENT '下一统计时间间隔类型开始时间',
      `next_interval_type_second` INT(11) NOT NULL DEFAULT '2147483647' COMMENT '下一统计时间间隔秒数',
      `min` BIGINT(20) UNSIGNED NOT NULL DEFAULT '9223372036854775807' COMMENT '最小响应时间',
      `max` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最大响应时间',
      `avg_rt` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '平均响应时间',
      `total` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '总请求数',
      `completed` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '完成请求数',
      `error` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '总错误数',
      `rps` DECIMAL(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '平均每秒请求数',
      `peak_concurrent` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最高并发数',
      `block` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '阻断请求数',
      `total_block` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '总阻断请求数(实际请求被阻断数)',
      `create_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
      PRIMARY KEY (`id`),
      UNIQUE INDEX `unique_fcr_id_type_resource_ip_interval_type_start_time` (`flow_control_rule_id`, `type`, `resource`, `ip`, `interval_type`, `start_time`),
      INDEX `key_interval_type_start_time` (`interval_type`, `start_time`),
      INDEX `key_resource_id_interval_type_start_time_ip` (`resource`, `interval_type`, `start_time`, `ip`),
      INDEX `key_flow_control_rule_id_interval_type_start_time_ip` (`flow_control_rule_id`, `interval_type`, `start_time`, `ip`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='流量统计';
CREATE TABLE `tb_flow_stat_4` (
      `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '整型自增主键',
      `flow_control_rule_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'tb_flow_control_rule表ID',
      `type` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '流控类型 1-全局配置 2-服务默认配置 3-服务',
      `resource` VARCHAR(250) NOT NULL DEFAULT '' COMMENT '资源ID',
      `ip` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '服务器IP地址',
      `interval_type` TINYINT(3) NOT NULL DEFAULT '0' COMMENT '统计时间间隔类型 0-10秒（6分钟） 1-1分钟（4小时） 2-5分钟（13小时） 3-60分钟（120天） 4-24小时（永久）',
      `interval_type_second` INT(11) NOT NULL DEFAULT '2147483647' COMMENT '统计时间间隔秒数',
      `start_time` BIGINT(20) NOT NULL DEFAULT '0' COMMENT '开始时间',
      `next_interval_type_start_time` BIGINT(20) NOT NULL DEFAULT '0' COMMENT '下一统计时间间隔类型开始时间',
      `next_interval_type_second` INT(11) NOT NULL DEFAULT '2147483647' COMMENT '下一统计时间间隔秒数',
      `min` BIGINT(20) UNSIGNED NOT NULL DEFAULT '9223372036854775807' COMMENT '最小响应时间',
      `max` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最大响应时间',
      `avg_rt` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '平均响应时间',
      `total` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '总请求数',
      `completed` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '完成请求数',
      `error` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '总错误数',
      `rps` DECIMAL(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '平均每秒请求数',
      `peak_concurrent` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最高并发数',
      `block` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '阻断请求数',
      `total_block` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '总阻断请求数(实际请求被阻断数)',
      `create_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
      PRIMARY KEY (`id`),
      UNIQUE INDEX `unique_fcr_id_type_resource_ip_interval_type_start_time` (`flow_control_rule_id`, `type`, `resource`, `ip`, `interval_type`, `start_time`),
      INDEX `key_interval_type_start_time` (`interval_type`, `start_time`),
      INDEX `key_resource_id_interval_type_start_time_ip` (`resource`, `interval_type`, `start_time`, `ip`),
      INDEX `key_flow_control_rule_id_interval_type_start_time_ip` (`flow_control_rule_id`, `interval_type`, `start_time`, `ip`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='流量统计';

INSERT INTO `tb_flow_control_rule` (`id`, `type`, `service`, `qps`, `concurrent`, `response_content_type`, `response_content`, `create_user`, `create_dept`, `create_time`, `update_user`, `update_time`, `status`, `is_deleted`) VALUES
    (1, 1, NULL, NULL, NULL, 'application/json; charset=UTF-8', '{"msg":"rate limit, please try again"}', NULL, NULL, '2021-01-04 10:36:35', NULL, '2021-01-04 10:36:35', 0, 0),
    (2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-04 10:37:24', NULL, '2021-01-04 10:37:24', 0, 0);

CREATE TABLE `tb_app_auth_tag` (
       `id` BIGINT(64) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
       `app_auth_id` MEDIUMINT(8) UNSIGNED NOT NULL COMMENT 'tb_app_auth表id字段',
       `tag` VARCHAR(20) NOT NULL COMMENT '标签',
       `create_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
       PRIMARY KEY (`id`),
       INDEX `app_auth_id` (`app_auth_id`),
       INDEX `tag` (`tag`)
)
    COMMENT='appID标签'
    COLLATE='utf8_general_ci'
    ENGINE=InnoDB
;

CREATE TABLE `tb_api_app_opt` (
      `id` BIGINT(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
      `api` BIGINT(64) NOT NULL COMMENT 'api ID, 对应tb_api_auth表的ID',
      `app` VARCHAR(64) NOT NULL COMMENT '对应tb_app_auth中的app',
      `create_user` BIGINT(64) NULL DEFAULT NULL COMMENT '创建人',
      `create_dept` BIGINT(64) NULL DEFAULT NULL COMMENT '创建部门',
      `create_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
      `update_user` BIGINT(64) NULL DEFAULT NULL COMMENT '修改人',
      `update_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
      `status` INT(2) NULL DEFAULT '1' COMMENT '状态 1-启用 0-不启用',
      `is_deleted` INT(2) NULL DEFAULT '0' COMMENT '是否已删除',
      PRIMARY KEY (`id`),
      INDEX `api` (`api`),
      INDEX `app` (`app`)
)
    COMMENT='api权限app关联'
    COLLATE='utf8_general_ci'
    ENGINE=InnoDB
;

CREATE TABLE `tb_callback_config` (
      `id` BIGINT(64) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
      `api` BIGINT(64) UNSIGNED NOT NULL COMMENT 'api ID, 对应tb_api_auth_opt表的ID',
      `type` CHAR(1) NOT NULL COMMENT '回调方式，s：同步（默认），a：异步',
      `receivers` TEXT NULL COMMENT '接收回调请求的服务及接口，JSON字符串格式，如：[{"service": "服务发现/聚合服务的名字", "type": 1, /*取值同上面的 proxyMode*/, "path": "xxx"}]',
      `resp_headers` VARCHAR(4000) NULL DEFAULT NULL COMMENT 'type=a时，响应头映射表，JSON字符串格式，如：[{"key":"header1","value":"value1"},{"key":"header2","value":"value2"}]',
      `resp_body` MEDIUMTEXT NULL COMMENT 'type=a时，响应的内容',
      `create_user` BIGINT(64) NULL DEFAULT NULL COMMENT '创建人',
      `create_dept` BIGINT(64) NULL DEFAULT NULL COMMENT '创建部门',
      `create_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
      `update_user` BIGINT(64) NULL DEFAULT NULL COMMENT '修改人',
      `update_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
      `status` INT(2) NULL DEFAULT NULL COMMENT '状态',
      `is_deleted` INT(2) NULL DEFAULT '0' COMMENT '是否已删除',
      PRIMARY KEY (`id`),
      INDEX `api` (`api`)
)
    COMMENT='回调配置'
    COLLATE='utf8_general_ci'
    ENGINE=InnoDB
;


CREATE TABLE `tb_callback_request` (
       `id` BIGINT(64) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
       `callback_config_id` BIGINT(64) UNSIGNED NOT NULL COMMENT 'tb_callback_config表id',
       `app` VARCHAR(64) NULL DEFAULT NULL COMMENT '第三方应用id',
       `req_id` VARCHAR(50) NOT NULL COMMENT '网关生成的请求id',
       `recv_time` BIGINT(20) NOT NULL COMMENT '网关收到请求的时间，unix时间戳',
       `gateway_group` VARCHAR(100) NULL DEFAULT NULL COMMENT '网关分组，如：c/b/t',
       `origin` VARCHAR(50) NULL DEFAULT NULL COMMENT '请求源的ip',
       `method` VARCHAR(8) NOT NULL COMMENT '请求方法',
       `service` VARCHAR(50) NOT NULL COMMENT '前端服务名',
       `path` VARCHAR(200) NOT NULL COMMENT '请求路径',
       `query` VARCHAR(4000) NULL DEFAULT NULL COMMENT '查询字符串',
       `headers` VARCHAR(4000) NULL DEFAULT NULL COMMENT '请求头映射表，JSON字符串格式，如：{"header1":["value1-1","value1-2"],"header2":["value2-1","value2-2"]}',
       `body` MEDIUMTEXT NULL COMMENT '请求的内容',
       `targets` VARCHAR(4000) NULL DEFAULT NULL COMMENT '接收此回调请求的所有服务及部署，如：[{"service":"xservice","host":"192.168.0.6","port":8080}]',
       `create_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
       PRIMARY KEY (`id`),
       INDEX `recv_time` (`recv_time`),
       INDEX `origin_ip` (`origin`),
       INDEX `service` (`service`)
)
    COMMENT='回调请求'
    COLLATE='utf8_general_ci'
    ENGINE=InnoDB
;


CREATE TABLE `tb_callback_request_replay_log` (
      `id` BIGINT(64) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
      `callback_request_id` BIGINT(64) UNSIGNED NOT NULL COMMENT 'tb_callback_request表主键',
      `recv_time` BIGINT(20) NOT NULL COMMENT '网关收到请求的时间，unix时间戳',
      `origin` VARCHAR(50) NULL DEFAULT NULL COMMENT '请求源的ip',
      `method` VARCHAR(8) NOT NULL COMMENT '请求方法',
      `service` VARCHAR(50) NOT NULL COMMENT '前端服务名',
      `path` VARCHAR(200) NOT NULL COMMENT '请求路径',
      `query` VARCHAR(4000) NULL DEFAULT NULL COMMENT '查询字符串',
      `headers` VARCHAR(4000) NULL DEFAULT NULL COMMENT '请求头映射表，JSON字符串格式，如：{"header1":["value1-1","value1-2"],"header2":["value2-1","value2-2"]}',
      `body` MEDIUMTEXT NULL COMMENT '请求的内容',
      `mode` TINYINT(3) UNSIGNED NOT NULL COMMENT '回放方式 1-按原路径回放 2-选择接收的回放服务',
      `receivers` VARCHAR(4000) NULL DEFAULT NULL COMMENT '接收服务信息，根据回放方式不同放置不同数据',
      `result` TINYINT(3) NOT NULL DEFAULT '1' COMMENT '回放结果 1-成功 2-失败',
      `err_msg` VARCHAR(4000) NULL DEFAULT NULL COMMENT '回放失败信息',
      `create_by` VARCHAR(20) NOT NULL COMMENT '创建人名字（操作人）',
      `create_user` BIGINT(64) NOT NULL COMMENT '创建人',
      `create_dept` BIGINT(64) NULL DEFAULT NULL COMMENT '创建部门',
      `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
      `update_user` BIGINT(64) NULL DEFAULT NULL COMMENT '修改人',
      `update_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
      `status` INT(2) NULL DEFAULT NULL COMMENT '状态',
      `is_deleted` INT(2) NULL DEFAULT '0' COMMENT '是否已删除',
      PRIMARY KEY (`id`),
      INDEX `create_time` (`create_time`),
      INDEX `create_by` (`create_by`),
      INDEX `recv_time` (`recv_time`),
      INDEX `origin` (`origin`),
      INDEX `service` (`service`),
      INDEX `callback_request_id` (`callback_request_id`)
)
    COMMENT='回调回放日志'
    COLLATE='utf8_general_ci'
    ENGINE=InnoDB
;

CREATE TABLE `tb_license` (
      `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
      `code` VARCHAR(8192) NOT NULL DEFAULT '' COMMENT '授权码',
      PRIMARY KEY (`id`)
)
    COMMENT='授权'
    COLLATE='utf8_general_ci'
    ENGINE=InnoDB
;
INSERT INTO `tb_license` (`id`, `code`) VALUES (1, '');

CREATE TABLE `tb_rpc_service` (
      `id` BIGINT(64) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
      `type` TINYINT(3) UNSIGNED NOT NULL COMMENT '类型 1-Dubbo 2-gRPC 3-HTTP',
      `service` VARCHAR(1000) NOT NULL COMMENT '服务名',
      `version` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '版本',
      `group` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '分组',
      `instance` VARCHAR(4000) NOT NULL DEFAULT '' COMMENT '实例列表，多个实例用逗号分隔',
      `load_balance_type` TINYINT(3) UNSIGNED NULL DEFAULT NULL COMMENT '负载均衡类型 1-轮询 2-随机',
      `create_user` BIGINT(64) NULL DEFAULT NULL COMMENT '创建人',
      `create_dept` BIGINT(64) NULL DEFAULT NULL COMMENT '创建部门',
      `create_time` DATETIME NULL DEFAULT NULL COMMENT '创建时间',
      `update_user` BIGINT(64) NULL DEFAULT NULL COMMENT '修改人',
      `update_time` DATETIME NULL DEFAULT NULL COMMENT '修改时间',
      `status` INT(2) NOT NULL COMMENT '状态',
      `is_deleted` INT(2) NOT NULL COMMENT '是否已删除',
      PRIMARY KEY (`id`),
      INDEX `type` (`type`)
)
    COMMENT='RPC服务信息'
    COLLATE='utf8_general_ci'
    ENGINE=InnoDB
;

CREATE TABLE `tb_rpc_service_method` (
     `id` BIGINT(64) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
     `rpc_service_id` BIGINT(64) UNSIGNED NOT NULL COMMENT '关联tb_rpc_service表id字段',
     `method` VARCHAR(200) NOT NULL COMMENT '方法名，java接口下的方法名',
     `name` VARCHAR(200) NOT NULL COMMENT '接口名称，方法中文名称',
     `param_type` VARCHAR(4000) NOT NULL DEFAULT '' COMMENT '参数类型列表，多个参数用逗号分隔',
     `metadata` VARCHAR(4000) NULL DEFAULT NULL COMMENT '元数据参数列表，多个参数用逗号分隔',
     `note` VARCHAR(4000) NULL DEFAULT NULL COMMENT '备注',
     `create_user` BIGINT(64) NULL DEFAULT NULL COMMENT '创建人',
     `create_dept` BIGINT(64) NULL DEFAULT NULL COMMENT '创建部门',
     `create_time` DATETIME NULL DEFAULT NULL COMMENT '创建时间',
     `update_user` BIGINT(64) NULL DEFAULT NULL COMMENT '修改人',
     `update_time` DATETIME NULL DEFAULT NULL COMMENT '修改时间',
     `status` INT(2) NOT NULL COMMENT '状态',
     `is_deleted` INT(2) NOT NULL COMMENT '是否已删除',
     PRIMARY KEY (`id`),
     INDEX `interface_id` (`rpc_service_id`)
)
    COMMENT='RPC服务关联方法信息'
    COLLATE='utf8_general_ci'
    ENGINE=InnoDB
;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
