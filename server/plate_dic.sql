/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 80012
Source Host           : 127.0.0.1:3306
Source Database       : my_test

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2018-10-14 15:10:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for plate_dic
-- ----------------------------
DROP TABLE IF EXISTS `plate_dic`;
CREATE TABLE `plate_dic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate_name` varchar(255) DEFAULT NULL,
  `plate_level` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=604 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plate_dic
-- ----------------------------
INSERT INTO `plate_dic` VALUES ('496', 'A 农林牧渔', '1', null);
INSERT INTO `plate_dic` VALUES ('497', '林业', '2', '496');
INSERT INTO `plate_dic` VALUES ('498', '农业', '2', '496');
INSERT INTO `plate_dic` VALUES ('499', '粮食及饲料加工', '2', '496');
INSERT INTO `plate_dic` VALUES ('500', '渔业、牧业', '2', '496');
INSERT INTO `plate_dic` VALUES ('501', 'B 采掘业', '1', null);
INSERT INTO `plate_dic` VALUES ('502', '煤炭开采_h', '2', '501');
INSERT INTO `plate_dic` VALUES ('503', '石油_h', '2', '501');
INSERT INTO `plate_dic` VALUES ('504', 'C0 食品饮料', '1', null);
INSERT INTO `plate_dic` VALUES ('505', '酒类_h', '2', '504');
INSERT INTO `plate_dic` VALUES ('506', '食品', '2', '504');
INSERT INTO `plate_dic` VALUES ('507', '饮料', '2', '504');
INSERT INTO `plate_dic` VALUES ('508', 'C1 纺织服装', '1', null);
INSERT INTO `plate_dic` VALUES ('509', '纺织业', '2', '508');
INSERT INTO `plate_dic` VALUES ('510', '服装', '2', '508');
INSERT INTO `plate_dic` VALUES ('511', 'C2 木材家具', '1', null);
INSERT INTO `plate_dic` VALUES ('512', '木材、家具', '2', '511');
INSERT INTO `plate_dic` VALUES ('513', 'C3 造纸印刷', '1', null);
INSERT INTO `plate_dic` VALUES ('514', '造纸、印刷', '2', '513');
INSERT INTO `plate_dic` VALUES ('515', 'C4 石化塑胶', '1', null);
INSERT INTO `plate_dic` VALUES ('516', '化学纤维制造_h', '2', '515');
INSERT INTO `plate_dic` VALUES ('517', '石油加工及炼焦_h', '2', '515');
INSERT INTO `plate_dic` VALUES ('518', '化学肥料', '2', '515');
INSERT INTO `plate_dic` VALUES ('519', '化学农药', '2', '515');
INSERT INTO `plate_dic` VALUES ('520', '化学原料及化学制品', '2', '515');
INSERT INTO `plate_dic` VALUES ('521', '橡胶制造', '2', '515');
INSERT INTO `plate_dic` VALUES ('522', '塑料制造', '2', '515');
INSERT INTO `plate_dic` VALUES ('523', 'C5 电子', '1', null);
INSERT INTO `plate_dic` VALUES ('524', '电子元器件制造', '2', '523');
INSERT INTO `plate_dic` VALUES ('525', '电器机械及器材制造_h', '2', '523');
INSERT INTO `plate_dic` VALUES ('526', '家电_h', '2', '523');
INSERT INTO `plate_dic` VALUES ('527', 'C6 金属非金属', '1', null);
INSERT INTO `plate_dic` VALUES ('528', '钢铁_h', '2', '527');
INSERT INTO `plate_dic` VALUES ('529', '水泥制造_h', '2', '527');
INSERT INTO `plate_dic` VALUES ('530', '有色金属_h', '2', '527');
INSERT INTO `plate_dic` VALUES ('531', '非金属矿物制品_h', '2', '527');
INSERT INTO `plate_dic` VALUES ('532', '金属制品', '2', '527');
INSERT INTO `plate_dic` VALUES ('533', 'C7 机械设备', '1', null);
INSERT INTO `plate_dic` VALUES ('534', '专用设备制造_h', '2', '533');
INSERT INTO `plate_dic` VALUES ('535', '航空航天器制造', '2', '533');
INSERT INTO `plate_dic` VALUES ('536', '汽车制造', '2', '533');
INSERT INTO `plate_dic` VALUES ('537', '普通机械制造', '2', '533');
INSERT INTO `plate_dic` VALUES ('538', '交通运输设备制造_h', '2', '533');
INSERT INTO `plate_dic` VALUES ('539', 'C8 医药生物', '1', null);
INSERT INTO `plate_dic` VALUES ('540', '生物制品', '2', '539');
INSERT INTO `plate_dic` VALUES ('541', '医药制造业_h', '2', '539');
INSERT INTO `plate_dic` VALUES ('542', '中药材及中成药加工_h', '2', '539');
INSERT INTO `plate_dic` VALUES ('543', 'C9 其他制造业', '1', null);
INSERT INTO `plate_dic` VALUES ('544', '其他制造业', '2', '543');
INSERT INTO `plate_dic` VALUES ('545', 'D 水电煤气', '1', null);
INSERT INTO `plate_dic` VALUES ('546', '水力发电', '2', '545');
INSERT INTO `plate_dic` VALUES ('547', '电力设备', '2', '545');
INSERT INTO `plate_dic` VALUES ('548', '煤气供水', '2', '545');
INSERT INTO `plate_dic` VALUES ('549', '煤电_h', '2', '545');
INSERT INTO `plate_dic` VALUES ('550', 'E 建筑业', '1', null);
INSERT INTO `plate_dic` VALUES ('551', '建筑材料', '2', '550');
INSERT INTO `plate_dic` VALUES ('552', '建筑施工', '2', '550');
INSERT INTO `plate_dic` VALUES ('553', '建筑业', '2', '550');
INSERT INTO `plate_dic` VALUES ('554', 'F 运输仓储', '1', null);
INSERT INTO `plate_dic` VALUES ('555', '运输物流', '2', '554');
INSERT INTO `plate_dic` VALUES ('556', '公路运输_h', '2', '554');
INSERT INTO `plate_dic` VALUES ('557', '港口', '2', '554');
INSERT INTO `plate_dic` VALUES ('558', '铁路_h', '2', '554');
INSERT INTO `plate_dic` VALUES ('559', '机场', '2', '554');
INSERT INTO `plate_dic` VALUES ('560', '空运_h', '2', '554');
INSERT INTO `plate_dic` VALUES ('561', '航运_h', '2', '554');
INSERT INTO `plate_dic` VALUES ('562', 'G 信息技术', '1', null);
INSERT INTO `plate_dic` VALUES ('563', '计算机应用服务', '2', '562');
INSERT INTO `plate_dic` VALUES ('564', '计算机硬件', '2', '562');
INSERT INTO `plate_dic` VALUES ('565', '通讯设备_h', '2', '562');
INSERT INTO `plate_dic` VALUES ('566', '计算机软件', '2', '562');
INSERT INTO `plate_dic` VALUES ('567', 'H 批发零售', '1', null);
INSERT INTO `plate_dic` VALUES ('568', '零售业', '2', '567');
INSERT INTO `plate_dic` VALUES ('569', '批发和贸易', '2', '567');
INSERT INTO `plate_dic` VALUES ('570', 'I 金融保险', '1', null);
INSERT INTO `plate_dic` VALUES ('571', '银行_h', '2', '570');
INSERT INTO `plate_dic` VALUES ('572', '证券', '2', '570');
INSERT INTO `plate_dic` VALUES ('573', '信托', '2', '570');
INSERT INTO `plate_dic` VALUES ('574', '保险_h', '2', '570');
INSERT INTO `plate_dic` VALUES ('575', 'J 房地产业', '1', null);
INSERT INTO `plate_dic` VALUES ('576', '房地产_h', '2', '575');
INSERT INTO `plate_dic` VALUES ('577', 'K 社会服务', '1', null);
INSERT INTO `plate_dic` VALUES ('578', '旅馆', '2', '577');
INSERT INTO `plate_dic` VALUES ('579', '公共设施服务_h', '2', '577');
INSERT INTO `plate_dic` VALUES ('580', '旅游', '2', '577');
INSERT INTO `plate_dic` VALUES ('581', 'L 传播文化', '1', null);
INSERT INTO `plate_dic` VALUES ('582', '传播与文化产业', '2', '581');
INSERT INTO `plate_dic` VALUES ('583', 'M 综合类', '1', null);
INSERT INTO `plate_dic` VALUES ('584', '综合类', '2', '583');
INSERT INTO `plate_dic` VALUES ('585', '其他板块', '1', null);
INSERT INTO `plate_dic` VALUES ('586', '下月解禁', '2', '585');
INSERT INTO `plate_dic` VALUES ('587', '本月解禁', '2', '585');
INSERT INTO `plate_dic` VALUES ('588', '中航工业', '2', '585');
INSERT INTO `plate_dic` VALUES ('589', '停牌', '2', '585');
INSERT INTO `plate_dic` VALUES ('590', '次新股', '2', '585');
INSERT INTO `plate_dic` VALUES ('591', '2月后解禁', '2', '585');
INSERT INTO `plate_dic` VALUES ('592', '资产重组', '2', '585');
INSERT INTO `plate_dic` VALUES ('593', '能源', '1', null);
INSERT INTO `plate_dic` VALUES ('594', '太阳能', '2', '593');
INSERT INTO `plate_dic` VALUES ('595', '概念板块', '1', null);
INSERT INTO `plate_dic` VALUES ('596', '火炬计划', '2', '595');
INSERT INTO `plate_dic` VALUES ('597', '国家队救市概念', '2', '595');
INSERT INTO `plate_dic` VALUES ('598', '上证180', '2', '595');
INSERT INTO `plate_dic` VALUES ('599', '上证50', '2', '595');
INSERT INTO `plate_dic` VALUES ('600', '安邦概念', '2', '595');
INSERT INTO `plate_dic` VALUES ('601', '创新创投', '2', '595');
INSERT INTO `plate_dic` VALUES ('602', '高校科技', '2', '595');
INSERT INTO `plate_dic` VALUES ('603', '令家反腐概念', '2', '595');
