/*
SQLyog 企业版 - MySQL GUI v7.14 
MySQL - 5.6.16-log : Database - i_wenyiba_com
*********************************************************************
*/

/*所有的表数据插入*/

/*Data for the table `u_permission` */

insert  into `u_permission`(`id`,`url`,`name`) values (4,'/permission/index.shtml','权限列表'),(6,'/permission/addPermission.shtml','权限添加'),(7,'/permission/deletePermissionById.shtml','权限删除'),
(8,'/member/list.shtml','用户列表'),(9,'/member/online.shtml','在线用户'),(10,'/member/changeSessionStatus.shtml','用户Session踢出'),
(11,'/member/forbidUserById.shtml','用户激活&禁止'),(12,'/member/deleteUserById.shtml','用户删除'),(13,'/permission/addPermission2Role.shtml','权限分配'),
(14,'/role/clearRoleByUserIds.shtml','用户角色分配清空'),(15,'/role/addRole2User.shtml','角色分配保存'),(16,'/role/deleteRoleById.shtml','角色列表删除'),(17,'/role/addRole.shtml','角色列表添加')
,(18,'/role/index.shtml','角色列表'),(19,'/permission/allocation.shtml','权限分配'),(20,'/role/allocation.shtml','角色分配'),(21,'/community/addCommunity.shtml','创建小区'),
(22,'/community/addPublicInfo.shtml','创建公告'), (23,'/community/deletePublicInfoById.shtml','删除公告'), (24,'/community/deleteCommunityById.shtml','删除小区'),
(25,'/community/addlostInfo.shtml','创建失物信息'), (26,'/community/deleteLostInfo.shtml','删除失物信息'),
(27,'/community/addOwnerCallfix.shtml','创建报修'), (28,'/community/deleteOwnerCallfixById.shtml','删除报修');




/*Data for the table `u_role` */

insert  into `u_role`
(id, `name`, code)
 values 
 (1,'系统管理员','888888'), (3,'权限角色','100003'), (4,'用户中心','100002'),
 (5, '物业管理', '100004');

/*Data for the table `u_role_permission` */

insert  into `u_role_permission`(`rid`,`pid`) 
values (4,8),(4,9),(4,10),(4,11),(4,12),(3,4),(3,6),(3,7),(3,13),(3,14),(3,15),(3,16),(3,17),(3,18),(3,19),(3,20),
(1,4),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),
(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27);

/*Data for the table `u_user` */

insert  into `u_user`(`id`,`nickname`,`mobile`,`email`,`pswd`,`create_time`,`last_login_time`,`status`) values 
(1,'管理员','admin','admin','57dd03ed397eabaeaa395eb740b770fd','2016-06-16 11:15:33','2016-06-16 11:24:10',1),
(11,'1111','1111','8446@qq.com','d57ffbe486910dd5b26d0167d034f9ad','2016-05-26 20:50:54','2016-06-16 11:24:35',1),
(12,'2222','2222','2222','4afdc875a67a55528c224ce088be2ab8','2016-05-27 22:34:19','2016-06-15 17:03:16',1),
(21,'南京绿地之窗管理员','njldzc','njldzc','f44c757637357b28236ce33218194880','2016-06-16 11:15:33','2016-06-16 11:24:10',1),
(22,'南京国际花都管理员','njgjhd','njgjhd','2028c814d280429212f0d37e2430cc91','2016-06-16 11:15:33','2016-06-16 11:24:10',1),
(23,'徐州绿地之窗管理员','xzldzc','xzldzc','2559ce643506e91704615e2ee4d955be','2016-06-16 11:15:33','2016-06-16 11:24:10',1),
(24,'徐州商务城管理员','xzswc','xzswc','62478ee2effe99099029d351b6d5e9ee','2016-06-16 11:15:33','2016-06-16 11:24:10',1),
(25,'徐州和平壹号管理员','xzhpyh','xzhpyh','fe99d6d8cd6331b4e5e25eccf1c1e918','2016-06-16 11:15:33','2016-06-16 11:24:10',1),
(26,'徐州泊林公馆管理员','xzblgg','xzblgg','ff051ffc2486b06e301ddde26625ebe0','2016-06-16 11:15:33','2016-06-16 11:24:10',1);

/*Data for the table `u_user_role` */

insert  into `u_user_role`(`uid`,`rid`) values (12,4),(11,3),(11,4),(1,1),(21,5),(22,5),(23,5),(24,5),(25,5),(26,5);


insert  into `house_business_type`
(`id`,`name`) 
values 
(1,'办公'),(2,'车库/储藏'),(3,'商业'),(4,'住宅'),
(5,'未分配');


insert  into `house_business_sub_type`
(`id`,`name`,parent_id) 
values 
(1,'非人防车库',2),(2,'地上车库位',2),(3,'人防车库',2),(13,'储藏室',2),
(4,'配套商业',3),(5,'整体商业',3),(14,'商业街',3),
(7,'普通住宅',4),(15,'花园洋房',4),(6,'联排别墅',4),
(8,'甲级办公',1),(9,'普通办公',1),(10,'loft',1),(11,'酒店式公寓',1),(16,'准甲办公',1),
(12,'未分配',5);


insert into property_company (id, name  ,   code    )values(15, '南京绿地之窗物业','1')
insert into property_company (id, name  ,   code    )values(16,'南京国际花都物业','2')
insert into property_company (id, name  ,   code    )values(17,'徐州绿地之窗物业','3');
insert into property_company (id, name  ,   code    )values(18,'徐州商务城物业','4');
insert into property_company (id, name  ,   code    )values(19,'徐州和平壹号物业','5');
insert into property_company (id, name  ,   code    )values(20,'徐州泊林公馆物业','6');


insert into user_property_company_rel( user_id ,    property_company_id  ,   status) values (1,15,1);
insert into user_property_company_rel( user_id ,    property_company_id  ,   status) values (1,16,1);
insert into user_property_company_rel( user_id ,    property_company_id  ,   status) values (1,17,1);
insert into user_property_company_rel( user_id ,    property_company_id  ,   status) values (1,18,1);
insert into user_property_company_rel( user_id ,    property_company_id  ,   status) values (1,19,1);
insert into user_property_company_rel( user_id ,    property_company_id  ,   status) values (1,20,1);

insert into user_property_company_rel( user_id ,    property_company_id  ,   status) values (21,15,1);
insert into user_property_company_rel( user_id ,    property_company_id  ,   status) values (22,16,1);
insert into user_property_company_rel( user_id ,    property_company_id  ,   status) values (23,17,1);
insert into user_property_company_rel( user_id ,    property_company_id  ,   status) values (24,18,1);
insert into user_property_company_rel( user_id ,    property_company_id  ,   status) values (25,19,1);
insert into user_property_company_rel( user_id ,    property_company_id  ,   status) values (26,20,1);


	
	
	
	
	


