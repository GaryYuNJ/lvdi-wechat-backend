
DROP TABLE IF EXISTS `u_user_role`;
DROP TABLE IF EXISTS `u_role_permission`;

/*表结构插入 权限表*/
DROP TABLE IF EXISTS `u_permission`;

CREATE TABLE `u_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(256) NOT NULL unique COMMENT 'url地址',
  `name` varchar(64) NOT NULL COMMENT 'url描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;


/*Table structure for table `u_role` 角色表*/
DROP TABLE IF EXISTS `u_role`;

CREATE TABLE `u_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL unique COMMENT '角色名称',
  `code` varchar(10) NOT NULL  unique  COMMENT '角色类型 code 唯一码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

  
/*Table structure for table `u_role_permission` */
DROP TABLE IF EXISTS `u_role_permission`;

CREATE TABLE `u_role_permission` (
  `rid` bigint(20) NOT NULL COMMENT '角色ID',
  `pid` bigint(20) NOT NULL COMMENT '权限ID',
  FOREIGN KEY (rid) REFERENCES u_role(id) ON DELETE CASCADE,
  FOREIGN KEY (pid) REFERENCES u_permission(id) ON DELETE CASCADE,
  UNIQUE KEY rolePermission (rid,pid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `u_user` */

DROP TABLE IF EXISTS `owner_callfix_form`;
DROP TABLE IF EXISTS `public_information`;
DROP TABLE IF EXISTS `lost_info_form`;
DROP TABLE IF EXISTS `u_user_role`;
DROP TABLE IF EXISTS `user_property_company_rel`;

DROP TABLE IF EXISTS `u_user`;

CREATE TABLE `u_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) NOT NULL COMMENT '用户姓名',
  `mobile` varchar(15) NOT NULL UNIQUE COMMENT '手机号|登录帐号',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱',
  `pswd` varchar(32) NOT NULL COMMENT '密码',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `status` bigint(1) DEFAULT '1' COMMENT '1:有效，0:禁止登录',
  `dimission_status` bigint(1) DEFAULT '0' COMMENT '是否已离职; 1:已离职，0:未离职',
  `dimission_time` datetime DEFAULT NULL COMMENT '离职时间',
  `dimission_process_flag` bigint(1) DEFAULT '0' COMMENT '离职后佣金数据已处理标记; 1:已处理，0:未处理',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Table structure for table `u_user_role` */

DROP TABLE IF EXISTS `u_user_role`;

CREATE TABLE `u_user_role` (
  `uid` bigint(20) NOT NULL COMMENT '用户ID',
  `rid` bigint(20) NOT NULL COMMENT '角色ID',
  FOREIGN KEY (rid) REFERENCES u_role(id) ON DELETE CASCADE,
  FOREIGN KEY (uid) REFERENCES u_user(id) ON DELETE CASCADE,
  UNIQUE KEY user_role (rid,uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



/*Table structure for table `province` 省*/
DROP TABLE IF EXISTS `member_house_rel`;
DROP TABLE IF EXISTS `owner_callfix_form`;
DROP TABLE IF EXISTS `public_information`;
DROP TABLE IF EXISTS `lost_info_form`;

DROP TABLE IF EXISTS `owner_house_rel`;
DROP TABLE IF EXISTS `house`;
DROP TABLE IF EXISTS `building`;

DROP TABLE IF EXISTS `owner_parking_space_rel`;
DROP TABLE IF EXISTS `parking_space`;
DROP TABLE IF EXISTS `community`;

DROP TABLE IF EXISTS `district`;
DROP TABLE IF EXISTS `city`;
DROP TABLE IF EXISTS `province`;

CREATE TABLE `province` (
  `id` bigint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '省名称',
  `code` varchar(20) NOT NULL unique COMMENT '省编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8  COMMENT='省份信息表' ;


/*Table structure for table `city` 城市*/
DROP TABLE IF EXISTS `city`;

CREATE TABLE `city` (
  `id` bigint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '城市名称',
  `code` varchar(20) NOT NULL unique COMMENT '市编码',
  `province_code`  varchar(20)  NOT NULL COMMENT '省编码',
  PRIMARY KEY (`id`),
  FOREIGN KEY (province_code) REFERENCES province(code) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Table structure for table `district` 区*/
DROP TABLE IF EXISTS `district`;

CREATE TABLE `district` (
  `id` bigint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '区名称',
  `code` varchar(20) NOT NULL unique COMMENT '区编码',
  `city_code` varchar(20)  NOT NULL  COMMENT '省编码',
  PRIMARY KEY (`id`),
  FOREIGN KEY (city_code) REFERENCES city(code) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;


/*Table structure for table `property_company` 物业公司*/
DROP TABLE IF EXISTS `property_company`;

CREATE TABLE `property_company` (
  `id` bigint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '物业公司名称',
  `code` varchar(20) default NULL  COMMENT '物业公司编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8
COMMENT '物业公司数据表';

/*Table structure for table `user_property_company_rel` 系统用户与物业公司关系*/
DROP TABLE IF EXISTS `user_property_company_rel`;

CREATE TABLE `user_property_company_rel` (
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `property_company_id` bigint(20) NOT NULL COMMENT '物业公司Id',
  `status` bigint(1) DEFAULT '1' COMMENT '1:有效，0:无效',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  FOREIGN KEY (user_id) REFERENCES u_user(id) ON DELETE CASCADE,
  FOREIGN KEY (property_company_id) REFERENCES property_company(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*Table structure for table `community` 小区 */

DROP TABLE IF EXISTS `building`;
DROP TABLE IF EXISTS `member_house_rel`;
DROP TABLE IF EXISTS `owner_callfix_form`;
DROP TABLE IF EXISTS `public_information`;
DROP TABLE IF EXISTS `lost_info_form`;

DROP TABLE IF EXISTS `owner_parking_space_rel`;
DROP TABLE IF EXISTS `parking_space`;

DROP TABLE IF EXISTS `community`;

CREATE TABLE `community` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(25) default NULL COMMENT '唯一编号',
  `name` varchar(20) NOT NULL COMMENT '小区名称',
  `province_code` varchar(20) default NULL COMMENT '省code',
  `city_code`  varchar(20) DEFAULT NULL COMMENT '城市code',
  `district_code` varchar(20) DEFAULT NULL COMMENT '区code',
  `address` varchar(100) DEFAULT NULL COMMENT '详细地址',
  `property_company_id` bigint(5) DEFAULT NULL COMMENT '物业公司Id',
  `bigint1` bigint(20) DEFAULT NULL COMMENT '扩展字段',
  `bigint2` bigint(20) DEFAULT NULL COMMENT '扩展字段',
  `varchar1` varchar(25) DEFAULT NULL COMMENT '扩展字段',
  `varchar2` varchar(25) DEFAULT NULL COMMENT '扩展字段',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  FOREIGN KEY (province_code) REFERENCES province(code),
  FOREIGN KEY (city_code) REFERENCES city(code),
  FOREIGN KEY (district_code) REFERENCES district(code),
  FOREIGN KEY (property_company_id) REFERENCES property_company(id)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8
COMMENT '小区数据表';



/*Table structure for table `building` 楼栋数据表*/
DROP TABLE IF EXISTS `building`;
CREATE TABLE `building` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(25) default NULL COMMENT '唯一编号',
  `name` varchar(50) NOT NULL COMMENT '楼栋名称',
  `community_id` bigint(20) NOT NULL COMMENT 'communityid外键',
  `max_floor` bigint(3) NOT NULL COMMENT '楼层',
  PRIMARY KEY (`id`),
  FOREIGN KEY (community_id) REFERENCES community(id)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8
COMMENT '楼栋数据表';




/*Table structure for table  `house_business_type` 业态大类*/
DROP TABLE IF EXISTS `house_business_sub_type`;
DROP TABLE IF EXISTS `house_business_type`;

CREATE TABLE `house_business_type` (
  `id` bigint(2) NOT NULL ,
  `name` varchar(20) NOT NULL COMMENT '房源业态，商业类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;



/*Table structure for table 业态细类 `house_business_sub_type` */
DROP TABLE IF EXISTS `house_business_sub_type`;

CREATE TABLE `house_business_sub_type` (
  `id` bigint(2) NOT NULL ,
  `name` varchar(20) NOT NULL COMMENT '房源业态，商业类型 名字',
  `parent_id` bigint(2) NOT NULL ,
  PRIMARY KEY (`id`),
  FOREIGN KEY (parent_id) REFERENCES house_business_type(id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;



/*Table structure for table 房源主数据表`house` */
DROP TABLE IF EXISTS `house`;

CREATE TABLE `house` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` bigint(20) NOT NULL COMMENT '房产编码',
  `name` varchar(25) NOT NULL COMMENT '名称',
  `building_id` bigint(20) NOT NULL COMMENT '楼栋id外键',
  `floor` bigint(3) NOT NULL DEFAULT 1 COMMENT '楼层',
  
  `business_type_id` bigint(2) NOT NULL COMMENT '业态大类id',
  `business_sub_type_id` bigint(2) NOT NULL COMMENT '业态细类id',
  
  `total_size` DECIMAL(12,5) NOT NULL  DEFAULT 0 COMMENT '平方米', 
  `remark` varchar(250) DEFAULT NULL  COMMENT '备注',
  `bigint1` bigint(20) NOT NULL COMMENT '扩展字段',
  `bigint2` bigint(20) NOT NULL COMMENT '扩展字段',
  `varchar1` varchar(25) NOT NULL COMMENT '扩展字段',
  `varchar2` varchar(25) NOT NULL COMMENT '扩展字段',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  FOREIGN KEY (building_id) REFERENCES building(id),
  FOREIGN KEY (business_type_id) REFERENCES house_business_type(id),
  FOREIGN KEY (business_sub_type_id) REFERENCES house_business_sub_type(id)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 
COMMENT '房产信息';


/*Table structure for table 车位 `parking_space` */
DROP TABLE IF EXISTS `owner_parking_space_rel`;
DROP TABLE IF EXISTS `parking_space`;

CREATE TABLE `parking_space` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `community_id` bigint(20) NOT NULL COMMENT 'communityid外键',
  `code` bigint(20) NOT NULL COMMENT '车位编号',
  `name` varchar(25) NOT NULL COMMENT '名称',
  `size` DECIMAL(12,5) NOT NULL  DEFAULT 0 COMMENT '平方米', 
  `remark` varchar(250) DEFAULT NULL  COMMENT '备注',
  `bigint1` bigint(20) NOT NULL COMMENT '扩展字段',
  `bigint2` bigint(20) NOT NULL COMMENT '扩展字段',
  `varchar1` varchar(25) NOT NULL COMMENT '扩展字段',
  `varchar2` varchar(25) NOT NULL COMMENT '扩展字段',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  FOREIGN KEY (community_id) REFERENCES community(id)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 
COMMENT '停车位信息';


/*Table structure for table `owner_basic_info` 业主信息表 , 来自CRM*/
DROP TABLE IF EXISTS `owner_basic_info`;

CREATE TABLE owner_basic_info ( 
     `id` bigint(20) NOT NULL AUTO_INCREMENT,
     `crm_cus_id` varchar(20) NOT NULL unique COMMENT '业主CRM编号',
     `real_name` varchar(25) NOT NULL COMMENT '名字',
     `gender` varchar(1) DEFAULT NULL COMMENT '性别',
     `mobile` varchar(20) NOT NULL COMMENT '手机号',

     PRIMARY KEY(ID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `identity_type` 住户身份类型*/
DROP TABLE IF EXISTS `identity_type`;

CREATE TABLE `identity_type` (
  `id` bigint(1) NOT NULL,
  `name` varchar(20) NOT NULL COMMENT '业主、租客',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;


/*Table structure for table `owner_house_rel` 业主与房子关系*/
DROP TABLE IF EXISTS `owner_house_rel`;

CREATE TABLE `owner_house_rel` (
  `owner_id` bigint(20) NOT NULL COMMENT '用户id',
  `house_id` bigint(20) NOT NULL COMMENT '房产Id',
  `identity_type_id` bigint(1) NOT NULL default 1 COMMENT 'identity 身份：租客2、业主1',
    
  `livin_time` datetime DEFAULT NULL COMMENT '入住时间',
  `in_time` datetime DEFAULT NULL COMMENT '迁入时间',
  `out_time` datetime DEFAULT NULL COMMENT '迁出时间',
  
  `status` bigint(1) DEFAULT '1' COMMENT '1:有效，0:无效',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  FOREIGN KEY (owner_id) REFERENCES owner_basic_info(id) ON DELETE CASCADE,
  FOREIGN KEY (house_id) REFERENCES house(id) ON DELETE CASCADE,
  FOREIGN KEY (identity_type_id) REFERENCES identity_type(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `owner_parking_space_rel` 业主与停车位的关系*/
DROP TABLE IF EXISTS `owner_parking_space_rel`;

CREATE TABLE `owner_parking_space_rel` (
  `owner_id` bigint(20) NOT NULL COMMENT '用户id',
  `parking_space_id` bigint(20) NOT NULL COMMENT '停车位Id',
  
  `start_date` date DEFAULT NULL COMMENT '起始时间',
  `end_date` date DEFAULT NULL COMMENT '结束时间',
  `is_own` bigint(1) DEFAULT '0' COMMENT '是否自有产权。1:是，0:不是',
  
  `status` bigint(1) DEFAULT '1' COMMENT '1:有效，0:无效',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  FOREIGN KEY (owner_id) REFERENCES owner_basic_info(id) ON DELETE CASCADE,
  FOREIGN KEY (parking_space_id) REFERENCES parking_space(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;





/*Table structure for table `owner_parking_space_rel` 业主与停车位的关系*/
DROP TABLE IF EXISTS `owner_parking_space_rel`;

CREATE TABLE `owner_parking_space_rel` (
  `owner_id` bigint(20) NOT NULL COMMENT '用户id',
  `parking_space_id` bigint(20) NOT NULL COMMENT '停车位Id',
  
  `start_date` date DEFAULT NULL COMMENT '起始时间',
  `end_date` date DEFAULT NULL COMMENT '结束时间',
  `is_own` bigint(1) DEFAULT '0' COMMENT '是否自有产权。1:是，0:不是',
  
  `status` bigint(1) DEFAULT '1' COMMENT '1:有效，0:无效',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  FOREIGN KEY (owner_id) REFERENCES owner_basic_info(id) ON DELETE CASCADE,
  FOREIGN KEY (parking_space_id) REFERENCES parking_space(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*Table structure for table `owner_callfix_form` 业主报修表单*/
DROP TABLE IF EXISTS `owner_callfix_form`;

CREATE TABLE `owner_callfix_form` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner_id` bigint(20) default NULL COMMENT '用户id',
  `community_id` bigint(20) NOT NULL COMMENT '小区外键',
  `organization`  varchar(50) DEFAULT NULL COMMENT '报修单位',
  `object`   varchar(50) DEFAULT NULL COMMENT '报修物品',
  `name`   varchar(20) DEFAULT NULL COMMENT '报修人姓名',
  `mobile`   varchar(50) DEFAULT NULL COMMENT '联系电话',
  `callfix_desc`   varchar(50) DEFAULT NULL COMMENT '报修内容',
  
  `status` bigint(1) DEFAULT '0' COMMENT '0:未处理，1:正在处理，2：处理完成',
  `responsible_person` varchar(20) DEFAULT NULL COMMENT '负责人',
  `responsible_person_mobile` varchar(20) DEFAULT NULL COMMENT '负责人电话',
  
  `process_user` bigint(20) DEFAULT NULL COMMENT '处理人',
  `remark`   varchar(100) DEFAULT NULL COMMENT '处理意见',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY(ID),
  FOREIGN KEY (owner_id) REFERENCES owner_basic_info(id) ON DELETE CASCADE,
  FOREIGN KEY (community_id) REFERENCES community(id),
  FOREIGN KEY (process_user) REFERENCES u_user(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `public_information` 公告信息表单*/
DROP TABLE IF EXISTS `public_information`;

CREATE TABLE `public_information` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `community_id` bigint(20) NOT NULL COMMENT '小区外键',
  `label`   varchar(50)  NOT NULL COMMENT '标签',
  `label_color`    bigint(1)  DEFAULT '1' COMMENT '标签颜色. 0:红，1:绿，3:黄，4:青',
  `organization`   varchar(50) DEFAULT NULL COMMENT '公告发布单位',
  `title`   varchar(50)  NOT NULL COMMENT '主题',
  `content`   varchar(500) DEFAULT NULL COMMENT '内容',
  
  `status` bigint(1) DEFAULT '1' COMMENT '0:无效，1:有效',
  `process_user` bigint(20) DEFAULT NULL COMMENT '发布人',
  
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
   PRIMARY KEY(ID),
  FOREIGN KEY (community_id) REFERENCES community(id),
  FOREIGN KEY (process_user) REFERENCES u_user(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



/*Table structure for table `lost_info_form` 失物详情单*/
DROP TABLE IF EXISTS `lost_info_form`;

CREATE TABLE `lost_info_form` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `community_id` bigint(20) NOT NULL COMMENT '小区外键',
  `object_name`   varchar(50) DEFAULT NULL COMMENT '物品名称',
  `mobile`   varchar(50) DEFAULT NULL COMMENT '联系电话',
  `pickup_location`   varchar(50) DEFAULT NULL COMMENT '拾获地点',
  `pickup_user`   bigint(20) DEFAULT NULL COMMENT '拾获人',
  `pickup_user_name`   varchar(50) DEFAULT NULL COMMENT '拾获人名字',
  `object_desc`   varchar(50) DEFAULT NULL COMMENT '描述',
  `time` datetime DEFAULT NULL COMMENT '拾获时间',
  `claim_location`   varchar(50) DEFAULT NULL COMMENT '索取地点',
  
  `status` bigint(1) DEFAULT '0' COMMENT '0:未认领，1:已认领',
  `lost_user_name` varchar(20) DEFAULT NULL COMMENT '认领人',
  `lost_user_mobile` varchar(20) DEFAULT NULL COMMENT '认领人手机号',
  `lost_user_id` varchar(20) DEFAULT NULL COMMENT '认领人身份证号',
    
  `process_user` bigint(20) DEFAULT NULL COMMENT '处理人',
  `remark`   varchar(100) DEFAULT NULL COMMENT '处理意见',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
   PRIMARY KEY(ID),
  FOREIGN KEY (community_id) REFERENCES community(id),
  FOREIGN KEY (process_user) REFERENCES u_user(id) ON DELETE CASCADE,
  FOREIGN KEY (pickup_user) REFERENCES owner_basic_info(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


