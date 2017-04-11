/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : uyiku

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2017-04-12 06:58:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cloth`
-- ----------------------------
DROP TABLE IF EXISTS `cloth`;
CREATE TABLE `cloth` (
  `id` varchar(255) NOT NULL,
  `name` varchar(50) default NULL,
  `style` varchar(30) default NULL,
  `color` varchar(40) default NULL,
  `season` varchar(40) default NULL,
  `category` varchar(40) default NULL,
  `remark` varchar(255) default NULL,
  `url` varchar(255) default NULL,
  `userId` varchar(255) default NULL,
  `createTime` date default NULL,
  `lastUpdateTime` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of cloth
-- ----------------------------
INSERT INTO `cloth` VALUES ('04d4a0bd-ec2e-4f0e-b169-8bebe51395ea', 'Thom Browne', '休闲', '红', '夏', '上衣', '可爱的鲸鱼衣服', '176.17.9.46:89/images/04d4a0bd-ec2e-4f0e-b169-8bebe51395ea.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('060613f5-c0a4-4a3d-9bda-57faf1970338', '打包', '休闲', '红', '夏', '包', '12', '176.17.9.46:89/images/060613f5-c0a4-4a3d-9bda-57faf1970338.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-07', '2017-03-07');
INSERT INTO `cloth` VALUES ('0739e48d-b19b-4874-a196-5694bae95afa', 'ere', '休闲', '红', '夏', '下衣', 'were', '176.17.9.46:89/images/0739e48d-b19b-4874-a196-5694bae95afa.jpg', '7be2e994-c3d2-44ba-be3b-3c27e542c04a', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('079a2348-cce4-45f0-aeae-54d339df14b7', '但是', '运动', '红', '冬', '包', '12', '176.17.9.46:89/images/079a2348-cce4-45f0-aeae-54d339df14b7.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-07', '2017-03-07');
INSERT INTO `cloth` VALUES ('0a765a59-76b5-484d-9748-b24a4b665629', 'Superme', '休闲', '红', '春秋', '上衣', '平时', '176.17.9.46:89/images/0a765a59-76b5-484d-9748-b24a4b665629.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('0ae9fd27-1107-477b-8a68-1f57a3f0d6ef', '包', '正式', '红', '冬', '包', '测试', '176.17.9.46:89/images/0ae9fd27-1107-477b-8a68-1f57a3f0d6ef.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-07', '2017-03-07');
INSERT INTO `cloth` VALUES ('0c54fbe8-eb6b-4cb7-a97d-0af40b5a3cf8', '运动服', '运动', '红', '冬', '上衣', '运动服', '176.17.9.46:89/images/0c54fbe8-eb6b-4cb7-a97d-0af40b5a3cf8.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('0de536a2-bca2-4d24-9030-de761efbd50d', '带帽子运动服', '运动', '红', '冬', '上衣', '全棉', '176.17.9.46:89/images/0de536a2-bca2-4d24-9030-de761efbd50d.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('0f3b2e82-5f83-4ef1-adc6-594fd67e9ff5', '打下', '正式', '红', '春秋', '上衣', '...', '176.17.9.46:89/images/0f3b2e82-5f83-4ef1-adc6-594fd67e9ff5.jpg', '8e4c3a0c-23bf-4eee-ba35-c4a1057cf037', '2017-03-05', '2017-03-05');
INSERT INTO `cloth` VALUES ('108d004f-03c9-47e5-8067-1a2571e9dfcd', '白色运动鞋', '运动', '红', '夏', '鞋', 'UYK好好版', '176.17.9.46:89/images/108d004f-03c9-47e5-8067-1a2571e9dfcd.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('163d19fb-165c-41a3-84a3-e9832ced50db', '牛仔裤', '运动', '红', '夏', '下衣', '', '176.17.9.46:89/images/163d19fb-165c-41a3-84a3-e9832ced50db.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('171db4ac-9d23-4e4c-bfe1-78ffc4f8adf1', '白色高跟鞋', '正式', '红', '夏', '鞋', '白色高跟鞋', '176.17.9.46:89/images/171db4ac-9d23-4e4c-bfe1-78ffc4f8adf1.jpg', '1a28947e-df2d-4591-b8f0-5fd401a43009', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('197f93e6-ef57-4951-b01f-ceeefffec614', '', '请选择', '红', '请选择', '请选择', '', '176.17.9.46:89/images/197f93e6-ef57-4951-b01f-ceeefffec614.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('1a6002ba-15e9-4f03-ba56-9b90b214b2c8', '的我', '休闲', '红', '春秋', '鞋', '32112', '176.17.9.46:89/images/1a6002ba-15e9-4f03-ba56-9b90b214b2c8.jpg', '7be2e994-c3d2-44ba-be3b-3c27e542c04a', '2017-03-05', '2017-03-05');
INSERT INTO `cloth` VALUES ('1d3e466b-018d-4c38-9878-5686a47a2fc6', 'Superme', '休闲', '红', '夏', '请选择', '随穿', '176.17.9.46:89/images/1d3e466b-018d-4c38-9878-5686a47a2fc6.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('1e6db28f-9f93-47ae-93e5-ca9d67349789', '上衣', '休闲', '红', '春秋', '上衣', 'aaa', '176.17.9.46:89/images/1e6db28f-9f93-47ae-93e5-ca9d67349789.jpg', 'c4012742-58a2-4aa6-b364-5e0372f5f494', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('209adf53-48f4-4390-977a-43ca1fa2d946', '衬衫', '休闲', '红', '夏', '上衣', '衬衫', '176.17.9.46:89/images/209adf53-48f4-4390-977a-43ca1fa2d946.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('22af3b47-7e39-4934-8cb8-b24d676f566a', 'Thom Browne', '正式', '红', '春秋', '上衣', '拜访老客户着装', '176.17.9.46:89/images/22af3b47-7e39-4934-8cb8-b24d676f566a.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('2628a2e9-aaee-4108-9326-4a8a77188595', 'Superme', '休闲', '红', '春秋', '请选择', '见男朋友着装', '176.17.9.46:89/images/2628a2e9-aaee-4108-9326-4a8a77188595.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('26ea7886-01c3-4fe7-a412-08d163d041b1', '黑色长裤', '正式', '红', '夏', '下衣', '', '176.17.9.46:89/images/26ea7886-01c3-4fe7-a412-08d163d041b1.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('284981bb-c27a-4efd-8fb0-b0016d1ecd54', '黑色高跟鞋', '运动', '红', '冬', '鞋', '买买买', '176.17.9.46:89/images/284981bb-c27a-4efd-8fb0-b0016d1ecd54.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('2da31e78-57dc-458d-9d93-686f0dfda5bc', '黑色的裤子', '休闲', '红', '春秋', '下衣', '美女休闲裤', '176.17.9.46:89/images/2da31e78-57dc-458d-9d93-686f0dfda5bc.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('30285c88-3000-41ca-9afd-cc7778fbdd6d', '女式牛仔裤', '休闲', '红', '请选择', '下衣', '', '176.17.9.46:89/images/30285c88-3000-41ca-9afd-cc7778fbdd6d.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('3103030e-7b76-4aaa-ae84-065e42811cd5', '撒大大', '休闲', '红', '夏', '包', '153', '176.17.9.46:89/images/3103030e-7b76-4aaa-ae84-065e42811cd5.jpg', '7be2e994-c3d2-44ba-be3b-3c27e542c04a', '2017-03-05', '2017-03-05');
INSERT INTO `cloth` VALUES ('33d21d49-586e-4998-88c5-228d79eb957f', '鞋', '正式', '红', '春秋', '鞋', '高贵鞋子', '176.17.9.46:89/images/33d21d49-586e-4998-88c5-228d79eb957f.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('367bbef1-2a02-44fd-825d-857dd05918f7', '黑色鞋子', '正式', '红', '春秋', '鞋', '黑色的鞋子', '176.17.9.46:89/images/367bbef1-2a02-44fd-825d-857dd05918f7.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('3803222b-36a7-4a38-ad07-c6270de6a058', 'Thom Browne', '休闲', '红', '春秋', '上衣', '最喜欢的卫衣', '176.17.9.46:89/images/3803222b-36a7-4a38-ad07-c6270de6a058.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('3a81011f-f676-45bf-84b8-685c7a960ddc', 'kk', '运动', '红', '夏', '上衣', '/652582', '176.17.9.46:89/images/3a81011f-f676-45bf-84b8-685c7a960ddc.jpg', '2e0e927b-c804-4b90-ad8a-1ef0bca44604', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('3b214b9f-6a8b-4de6-8c85-82f886dd0182', 'Superme', '休闲', '红', '春秋', '上衣', '平时', '176.17.9.46:89/images/3b214b9f-6a8b-4de6-8c85-82f886dd0182.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('3d0880c9-b19a-4f67-8693-3ca257082c8d', '', '休闲', '红', '夏', '鞋', '', '176.17.9.46:89/images/3d0880c9-b19a-4f67-8693-3ca257082c8d.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('3f46034b-f3eb-46a6-a744-1955af4349e2', '鞋子', '正式', '红', '春秋', '鞋', '鞋子', '176.17.9.46:89/images/3f46034b-f3eb-46a6-a744-1955af4349e2.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('41b40d34-ab1e-4f30-ba97-e83b09232ef3', '鞋子', '休闲', '红', '春秋', '鞋', '三双鞋子', '176.17.9.46:89/images/41b40d34-ab1e-4f30-ba97-e83b09232ef3.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('44684117-2558-4fd3-b955-2d5bc685b1b3', '好的', '运动', '红', '夏', '下衣', '撒的撒的撒', '176.17.9.46:89/images/44684117-2558-4fd3-b955-2d5bc685b1b3.jpg', '7be2e994-c3d2-44ba-be3b-3c27e542c04a', '2017-03-05', '2017-03-05');
INSERT INTO `cloth` VALUES ('45f94b87-2faa-4329-bc41-e54c769db536', '水晶鞋', '正式', '红', '春秋', '鞋', '美丽的水晶鞋', '176.17.9.46:89/images/45f94b87-2faa-4329-bc41-e54c769db536.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('4b9e9f38-f3c6-43cb-9666-03208cfdd9fc', '黑包', '休闲', '红', '夏', '包', '', '176.17.9.46:89/images/4b9e9f38-f3c6-43cb-9666-03208cfdd9fc.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-07', '2017-03-07');
INSERT INTO `cloth` VALUES ('4bf512a5-bfd4-4007-8b3c-af3cc36e4b83', '', '请选择', '红', '请选择', '请选择', '', '176.17.9.46:89/images/4bf512a5-bfd4-4007-8b3c-af3cc36e4b83.jpg', '7be2e994-c3d2-44ba-be3b-3c27e542c04a', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('4fb156c4-f95f-4dc7-8500-2d057406fbc7', '鞋子', '休闲', '红', '夏', '请选择', '鞋子', '176.17.9.46:89/images/4fb156c4-f95f-4dc7-8500-2d057406fbc7.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('50da7ce8-ca22-4e47-9df6-09ea82e3cfc3', '黑', '休闲', '红', '冬', '鞋', 'sad', '176.17.9.46:89/images/50da7ce8-ca22-4e47-9df6-09ea82e3cfc3.jpg', '7be2e994-c3d2-44ba-be3b-3c27e542c04a', '2017-03-05', '2017-03-05');
INSERT INTO `cloth` VALUES ('52d274ac-a1a1-4166-9de9-78f4f2d36eaa', '黑色休闲裤', '休闲', '红', '春秋', '下衣', '裤子', '176.17.9.46:89/images/52d274ac-a1a1-4166-9de9-78f4f2d36eaa.jpg', '1a28947e-df2d-4591-b8f0-5fd401a43009', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('59837c04-c524-488d-ae61-0b1cf2b19821', 'o', '正式', '红', '春秋', '上衣', '是是是', '176.17.9.46:89/images/59837c04-c524-488d-ae61-0b1cf2b19821.jpg', '8e4c3a0c-23bf-4eee-ba35-c4a1057cf037', '2017-03-05', '2017-03-05');
INSERT INTO `cloth` VALUES ('5afb5379-26a5-432e-8b95-446ebd2c2dec', '', '请选择', '红', '请选择', '请选择', '', '176.17.9.46:89/images/5afb5379-26a5-432e-8b95-446ebd2c2dec.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-09', '2017-03-09');
INSERT INTO `cloth` VALUES ('5b8c187b-96f3-4fa3-8df6-a9afba28fba7', '测试包', '正式', '红', '夏', '包', '测试', '176.17.9.46:89/images/5b8c187b-96f3-4fa3-8df6-a9afba28fba7.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-07', '2017-03-07');
INSERT INTO `cloth` VALUES ('5e235f62-c722-45c1-954d-ecbd3db242cc', '撒的', '休闲', '红', '夏', '鞋', '2e', '176.17.9.46:89/images/5e235f62-c722-45c1-954d-ecbd3db242cc.jpg', '7be2e994-c3d2-44ba-be3b-3c27e542c04a', '2017-03-05', '2017-03-05');
INSERT INTO `cloth` VALUES ('6078e344-e43a-463b-af0f-c958b1456360', '高领长袖', '运动', '红', '冬', '上衣', '长袖', '176.17.9.46:89/images/6078e344-e43a-463b-af0f-c958b1456360.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('6090095d-967a-4ddd-b864-03900cde54c6', 'rrr', '正式', '红', '春秋', '上衣', '...', '176.17.9.46:89/images/6090095d-967a-4ddd-b864-03900cde54c6.jpg', '7be2e994-c3d2-44ba-be3b-3c27e542c04a', '2017-03-05', '2017-03-05');
INSERT INTO `cloth` VALUES ('60f33214-5b75-4ec0-98ce-01874baa7955', '橘色短袖', '运动', '红', '夏', '上衣', '', '176.17.9.46:89/images/60f33214-5b75-4ec0-98ce-01874baa7955.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('615b6bf8-791c-44a2-a1b7-8ea7813db6c7', '黑包', '运动', '红', '夏', '包', '黑', '176.17.9.46:89/images/615b6bf8-791c-44a2-a1b7-8ea7813db6c7.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-07', '2017-03-07');
INSERT INTO `cloth` VALUES ('6722abb9-6490-4804-9dff-8e274c213b52', '裙子', '休闲', '红', '春秋', '下衣', '撒大大撒多撒多', '176.17.9.46:89/images/6722abb9-6490-4804-9dff-8e274c213b52.jpg', '7be2e994-c3d2-44ba-be3b-3c27e542c04a', '2017-03-05', '2017-03-05');
INSERT INTO `cloth` VALUES ('6a0b0226-4d97-43c1-b7f8-14fd56a6e7aa', '453', '正式', '红', '春秋', '鞋', '546', '176.17.9.46:89/images/6a0b0226-4d97-43c1-b7f8-14fd56a6e7aa.jpg', '7be2e994-c3d2-44ba-be3b-3c27e542c04a', '2017-03-05', '2017-03-05');
INSERT INTO `cloth` VALUES ('73bee2af-6d29-48d2-8d7c-c2bac293f138', 'Thom Browne', '正式', '红', '春秋', '上衣', '工作装', '176.17.9.46:89/images/73bee2af-6d29-48d2-8d7c-c2bac293f138.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('73fa9207-888d-4bb1-94a3-07593e0ed8e5', '撒的', '休闲', '红', '春秋', '鞋', 'aaa', '176.17.9.46:89/images/73fa9207-888d-4bb1-94a3-07593e0ed8e5.jpg', 'c4012742-58a2-4aa6-b364-5e0372f5f494', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('756940fc-bbb6-4857-918c-828ee491ea1c', '', '正式', '红', '春秋', '鞋', '', '176.17.9.46:89/images/756940fc-bbb6-4857-918c-828ee491ea1c.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('788775b4-0bd1-40b6-aa4b-83649a8f2b82', '', '请选择', '红', '请选择', '请选择', '', '176.17.9.46:89/images/788775b4-0bd1-40b6-aa4b-83649a8f2b82.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('7b6c2c01-7e9b-45ab-8741-4a045084d31c', '短袖', '运动', '红', '春秋', '上衣', '啊啊啊啊啊啊啊啊啊', '176.17.9.46:89/images/7b6c2c01-7e9b-45ab-8741-4a045084d31c.jpg', '7be2e994-c3d2-44ba-be3b-3c27e542c04a', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('7e7ab61a-6d32-4769-bc1d-ab22d3330809', '黑色休闲裤', '正式', '红', '请选择', '下衣', '', '176.17.9.46:89/images/7e7ab61a-6d32-4769-bc1d-ab22d3330809.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('80ce9ffc-c46a-44b0-ab4f-1e98b9c2a46f', 'Thom Browne', '正式', '红', '春秋', '上衣', '拜访客户使用着装', '176.17.9.46:89/images/80ce9ffc-c46a-44b0-ab4f-1e98b9c2a46f.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('8110e215-c24a-4f56-9dbd-2a4c30bbdce9', 'ttt', '正式', '红', '春秋', '上衣', '是是是', '176.17.9.46:89/images/8110e215-c24a-4f56-9dbd-2a4c30bbdce9.jpg', '7be2e994-c3d2-44ba-be3b-3c27e542c04a', '2017-03-05', '2017-03-05');
INSERT INTO `cloth` VALUES ('81e8a791-7fc1-4547-ba11-85d169655598', '加', '运动', '红', '夏', '饰品', '萨达', '176.17.9.46:89/images/81e8a791-7fc1-4547-ba11-85d169655598.jpg', '7be2e994-c3d2-44ba-be3b-3c27e542c04a', '2017-03-05', '2017-03-05');
INSERT INTO `cloth` VALUES ('823c4491-ded7-4d4c-8d0f-29bcb615ee8e', '礼服', '正式', '红', '冬', '上衣', '白色', '176.17.9.46:89/images/823c4491-ded7-4d4c-8d0f-29bcb615ee8e.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('83958937-f96c-46ba-9f7e-1671b45f3b4f', '打下', '正式', '红', '春秋', '上衣', '...', '176.17.9.46:89/images/clothImage/83958937-f96c-46ba-9f7e-1671b45f3b4f.jpg', '787f5672-ab97-4c86-9398-46931a063257', '2017-03-05', '2017-03-05');
INSERT INTO `cloth` VALUES ('84f535f5-6b5b-4c56-989a-01b038124c06', '12', '运动', '红', '春秋', '上衣', '', '176.17.9.46:89/images/84f535f5-6b5b-4c56-989a-01b038124c06.jpg', '7792cc52-547e-4c56-9679-16c9fd81d906', '2017-03-07', '2017-03-07');
INSERT INTO `cloth` VALUES ('86f40a0b-3c5d-4134-836a-b49e96259cc3', '鞋', '运动', '红', '春秋', '鞋', '123', '176.17.9.46:89/images/86f40a0b-3c5d-4134-836a-b49e96259cc3.jpg', '7be2e994-c3d2-44ba-be3b-3c27e542c04a', '2017-03-05', '2017-03-05');
INSERT INTO `cloth` VALUES ('8d0dfa03-51c4-499a-a2be-2698db5870c1', 'Thom Browne', '正式', '红', '春秋', '上衣', '公司例会装', '176.17.9.46:89/images/8d0dfa03-51c4-499a-a2be-2698db5870c1.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('91aaa357-bf40-439e-ba8b-84f65f25f755', '红鞋', '运动', '红', '春秋', '鞋子', '红', '176.17.9.46:89/images/91aaa357-bf40-439e-ba8b-84f65f25f755.jpg', '7be2e994-c3d2-44ba-be3b-3c27e542c04a', '2017-03-05', '2017-03-05');
INSERT INTO `cloth` VALUES ('91c0aae1-5ffe-4e69-9ae0-cf2e2c5e33d8', 'Thom Browne', '休闲', '红', '春秋', '上衣', '随穿', '176.17.9.46:89/images/91c0aae1-5ffe-4e69-9ae0-cf2e2c5e33d8.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('92481ca5-3417-4b22-8778-5628cbd74983', '萨达', '运动', '红', '春秋', '包', '213', '176.17.9.46:89/images/92481ca5-3417-4b22-8778-5628cbd74983.jpg', '7be2e994-c3d2-44ba-be3b-3c27e542c04a', '2017-03-05', '2017-03-05');
INSERT INTO `cloth` VALUES ('924a585d-1e97-41cf-ba11-5a0266f598c4', '高筒鞋', '正式', '红', '冬', '鞋', '高贵的奢侈', '176.17.9.46:89/images/924a585d-1e97-41cf-ba11-5a0266f598c4.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('95c74f79-b38b-419a-8182-e005d0918f8f', '运动鞋', '运动', '红', '春秋', '鞋', '运动鞋', '176.17.9.46:89/images/95c74f79-b38b-419a-8182-e005d0918f8f.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('95facc0a-9df5-44d8-9134-6f5b200fb712', '钻石', '运动', '红', '春秋', '饰品', '钻石', '176.17.9.46:89/images/95facc0a-9df5-44d8-9134-6f5b200fb712.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-07', '2017-03-07');
INSERT INTO `cloth` VALUES ('9c6aa839-154a-419b-bb25-73eb8fad75ba', 'vdc', '休闲', '红', '夏', '上衣', '先设置', '176.17.9.46:89/images/9c6aa839-154a-419b-bb25-73eb8fad75ba.jpg', '7be2e994-c3d2-44ba-be3b-3c27e542c04a', '2017-03-05', '2017-03-05');
INSERT INTO `cloth` VALUES ('9d86796d-23bb-413d-9bd2-d040e0347ab7', '', '请选择', '红', '请选择', '请选择', '', '176.17.9.46:89/images/9d86796d-23bb-413d-9bd2-d040e0347ab7.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('a068f00a-cce6-41ae-9329-eedbb29486a2', '撒打算打算', '运动', '红', '春秋', '上衣', '', '176.17.9.46:89/images/a068f00a-cce6-41ae-9329-eedbb29486a2.jpg', '8cf2776e-c376-40bb-be52-f2dbbfb29958', '2017-03-07', '2017-03-07');
INSERT INTO `cloth` VALUES ('a1330a1f-a5ac-45ff-b6c5-3e7e1b554ae2', '长衣服', '休闲', '红', '冬', '上衣', '长', '176.17.9.46:89/images/a1330a1f-a5ac-45ff-b6c5-3e7e1b554ae2.jpg', '7be2e994-c3d2-44ba-be3b-3c27e542c04a', '2017-03-05', '2017-03-05');
INSERT INTO `cloth` VALUES ('a9276584-7177-461e-a72f-aeddc44bd1c1', 'sdsad', '运动', '红', '春秋', '上衣', 'asdsad', '176.17.9.46:89/images/a9276584-7177-461e-a72f-aeddc44bd1c1.jpg', '73798dbd-9202-4b81-be17-5112d3ae60f5', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('ac79e027-d3d1-4a64-a385-6b105d432b1b', '孩子', '休闲', '红', '春秋', '鞋', '123', '176.17.9.46:89/images/ac79e027-d3d1-4a64-a385-6b105d432b1b.jpg', '7be2e994-c3d2-44ba-be3b-3c27e542c04a', '2017-03-05', '2017-03-05');
INSERT INTO `cloth` VALUES ('ac8008ee-88b1-4bb7-b3d6-3ca9a7972d05', '黑色皮裤', '休闲', '红', '夏', '下衣', '', '176.17.9.46:89/images/ac8008ee-88b1-4bb7-b3d6-3ca9a7972d05.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('af3a0807-8883-4aff-ad90-78d39ffdc698', '白鞋', '休闲', '红', '春秋', '鞋', 'good鞋子绝对超值', '176.17.9.46:89/images/af3a0807-8883-4aff-ad90-78d39ffdc698.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('afbeabea-c9ac-4501-b18b-b59adc7faf1a', '耳坠', '休闲', '红', '夏', '饰品', '蓝色', '176.17.9.46:89/images/afbeabea-c9ac-4501-b18b-b59adc7faf1a.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-07', '2017-03-07');
INSERT INTO `cloth` VALUES ('b16790e5-ae9f-4381-a7fa-2058c2184689', '蓝色衣服', '休闲', '红', '春秋', '上衣', '蓝色', '176.17.9.46:89/images/b16790e5-ae9f-4381-a7fa-2058c2184689.jpg', '522b4b0a-0b3b-4a95-abcb-0c564ae3ecca', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('ba5a3dae-1c07-46db-b3b4-636b625c9eec', '蓝色牛仔裤', '休闲', '红', '夏', '下衣', '', '176.17.9.46:89/images/ba5a3dae-1c07-46db-b3b4-636b625c9eec.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('bc5d29ae-c9d0-44ae-9c65-5015136b79eb', '撒娇地哦撒', '运动', '红', '春秋', '上衣', '', '176.17.9.46:89/images/bc5d29ae-c9d0-44ae-9c65-5015136b79eb.jpg', '9342f4ba-f1f1-45de-9600-6cd6df607b66', '2017-03-07', '2017-03-07');
INSERT INTO `cloth` VALUES ('bc990c6c-64cc-4cbf-a7e0-de6934f78ab2', 'rr', '正式', '红', '春秋', '下衣', '35', '176.17.9.46:89/images/bc990c6c-64cc-4cbf-a7e0-de6934f78ab2.jpg', '7be2e994-c3d2-44ba-be3b-3c27e542c04a', '2017-03-05', '2017-03-05');
INSERT INTO `cloth` VALUES ('c0ad9d31-7cda-4af3-9282-0cc121355f0e', 'supreme', '运动', '红', '夏', '上衣', '短袖', '176.17.9.46:89/images/c0ad9d31-7cda-4af3-9282-0cc121355f0e.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('ca1e3da5-b667-4784-b5c5-28aef2d480a4', 'TB', '正式', '红', '冬', '上衣', '回归穿着体验', '176.17.9.46:89/images/ca1e3da5-b667-4784-b5c5-28aef2d480a4.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-08', '2017-03-08');
INSERT INTO `cloth` VALUES ('cb5845a5-9483-4d29-bb58-68fc250fb5fe', '无袖长裙', '正式', '红', '春秋', '上衣', '中式', '176.17.9.46:89/images/cb5845a5-9483-4d29-bb58-68fc250fb5fe.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('cc01ed66-ddd5-4a02-b2ed-b257b665718a', '撒的', '正式', '红', '春秋', '下衣', '55', '176.17.9.46:89/images/cc01ed66-ddd5-4a02-b2ed-b257b665718a.jpg', '7be2e994-c3d2-44ba-be3b-3c27e542c04a', '2017-03-05', '2017-03-05');
INSERT INTO `cloth` VALUES ('cccc9d5d-4120-449e-9acd-8d89c2bf2995', '蓝包', '运动', '红', '春秋', '包', '蓝', '176.17.9.46:89/images/cccc9d5d-4120-449e-9acd-8d89c2bf2995.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-07', '2017-03-07');
INSERT INTO `cloth` VALUES ('cf9c9568-e42f-445d-8d37-bee686a099ce', '', '休闲', '红', '冬', '鞋', '', '176.17.9.46:89/images/cf9c9568-e42f-445d-8d37-bee686a099ce.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('d09b0abc-e42c-487b-8dda-c04e06316e91', '仨', '休闲', '红', '冬', '上衣', '萨达', '176.17.9.46:89/images/d09b0abc-e42c-487b-8dda-c04e06316e91.jpg', '7be2e994-c3d2-44ba-be3b-3c27e542c04a', '2017-03-05', '2017-03-05');
INSERT INTO `cloth` VALUES ('d0a20011-9966-4cfe-b08e-2ef1d662b42b', '包', '正式', '红', '春秋', '包', '测试', '176.17.9.46:89/images/d0a20011-9966-4cfe-b08e-2ef1d662b42b.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-07', '2017-03-07');
INSERT INTO `cloth` VALUES ('d3cb977b-a919-4d73-a280-ef54472655de', 'Superme', '休闲', '红', '春秋', '请选择', '见男朋友着装', '176.17.9.46:89/images/d3cb977b-a919-4d73-a280-ef54472655de.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('d8465f0c-9a3d-4e18-870d-c5a1166c84ed', 'kk', '运动', '红', '夏', '上衣', '/652582', '176.17.9.46:89/images/d8465f0c-9a3d-4e18-870d-c5a1166c84ed.jpg', '2e0e927b-c804-4b90-ad8a-1ef0bca44604', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('dcb28fc8-71c6-49c6-b2ec-596418f296af', '123', '运动', '红', '春秋', '上衣', '', '176.17.9.46:89/images/dcb28fc8-71c6-49c6-b2ec-596418f296af.jpg', '414f349f-5419-43f9-9cbc-cc00a73ddc3f', '2017-03-07', '2017-03-07');
INSERT INTO `cloth` VALUES ('e07b1208-e054-4c71-b19e-dae023d7c4f4', '', '休闲', '红', '春秋', '包', '', '176.17.9.46:89/images/e07b1208-e054-4c71-b19e-dae023d7c4f4.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-07', '2017-03-07');
INSERT INTO `cloth` VALUES ('e19d4dff-476f-4bfd-8d29-b1e65cd1909c', '破洞牛仔裤', '休闲', '红', '请选择', '下衣', '', '176.17.9.46:89/images/e19d4dff-476f-4bfd-8d29-b1e65cd1909c.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('e41b0bb7-6cf1-4e4c-ae0b-3ce98e8c1ba9', '黄包', '正式', '红', '冬', '包', '黄', '176.17.9.46:89/images/e41b0bb7-6cf1-4e4c-ae0b-3ce98e8c1ba9.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-07', '2017-03-07');
INSERT INTO `cloth` VALUES ('e5b0b1a6-3f9f-4748-a6da-0a8b1e81be7c', '黑色露脚长裤', '休闲', '红', '春秋', '下衣', '', '176.17.9.46:89/images/e5b0b1a6-3f9f-4748-a6da-0a8b1e81be7c.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('e85266d2-d2fb-4d43-a2da-9c60564e0921', '包', '运动', '红', '夏', '包', '测试', '176.17.9.46:89/images/e85266d2-d2fb-4d43-a2da-9c60564e0921.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-07', '2017-03-07');
INSERT INTO `cloth` VALUES ('eb8a60a7-c772-48fc-8639-4cd2ffbdeb12', '包', '休闲', '红', '夏', '包', '测试', '176.17.9.46:89/images/eb8a60a7-c772-48fc-8639-4cd2ffbdeb12.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-07', '2017-03-07');
INSERT INTO `cloth` VALUES ('f26ea85e-5317-47ab-8f30-a9dc840fc88d', '撒第六空间', '运动', '红', '春秋', '上衣', '...', '176.17.9.46:89/images/f26ea85e-5317-47ab-8f30-a9dc840fc88d.jpg', '7be2e994-c3d2-44ba-be3b-3c27e542c04a', '2017-03-05', '2017-03-05');
INSERT INTO `cloth` VALUES ('f39ea9d9-c68f-495f-b27f-0764a66e60c3', '红包', '休闲', '红', '春秋', '包', '红', '176.17.9.46:89/images/f39ea9d9-c68f-495f-b27f-0764a66e60c3.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-07', '2017-03-07');
INSERT INTO `cloth` VALUES ('f5fd03e6-4849-45fa-ac02-7fc1b0b6b966', '项链', '休闲', '红', '春秋', '饰品', '项链', '176.17.9.46:89/images/f5fd03e6-4849-45fa-ac02-7fc1b0b6b966.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-07', '2017-03-07');
INSERT INTO `cloth` VALUES ('f69ab521-2c34-48b9-9ce1-14da62d3980b', '这不是包', '运动', '红', '春秋', '上衣', '123', '176.17.9.46:89/images/f69ab521-2c34-48b9-9ce1-14da62d3980b.jpg', '1a93d74d-b6fd-41db-b010-b8d99bcb662c', '2017-03-07', '2017-03-07');
INSERT INTO `cloth` VALUES ('fc145d48-77af-4098-9eb3-f13074b0d71d', 'Superme', '休闲', '红', '夏', '请选择', '随穿', '176.17.9.46:89/images/fc145d48-77af-4098-9eb3-f13074b0d71d.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('fc1d091e-e251-45ee-b387-3d3e5c5abec7', '红色鞋子', '休闲', '红', '冬', '鞋', '红鞋', '176.17.9.46:89/images/fc1d091e-e251-45ee-b387-3d3e5c5abec7.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-06', '2017-03-06');
INSERT INTO `cloth` VALUES ('fee30e0a-c34d-4717-a75b-1b3e56645b86', '2132', '休闲', '红', '夏', '包', '213', '176.17.9.46:89/images/fee30e0a-c34d-4717-a75b-1b3e56645b86.jpg', '2746703e-fea7-48e7-8209-0bf051564e22', '2017-03-07', '2017-03-07');
