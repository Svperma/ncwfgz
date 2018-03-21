
create database if exists `ncwfgz` default character set utf8;

use `ncwfgz`;


-- 危房表
drop table if exists `GGBUILDINGMST`;

create table `GGBUILDINGMST`(
`ID` varchar(30) not null primary key comment '危房id',
`HOUSEHOLDER` varchar(30) not null comment '户主姓名',
`UDEBTUTYID` varchar(30) not null unique comment '身份证号',
`PEOPLENUMBER` int comment '人口数',
`TYPE` varchar(30) not null comment '贫困类型	存值范围如下：一级危房，二级危房，三级危房',
`GRADE` varchar(30) not null comment '危房等级	"存值范围如下：一级危房，二级危房，三级危房',
`STARTYEAR` varchar(30) not null comment '纳入改造时间	存值范围如下：2014,2015,2016,2017',
`SUNAMOUNT` int not null comment '补助金额	根据危房等级自动生成：一级危房：35000,二级危房：15000,三级危房：10000',
`BANK` varchar(30) comment '一卡通开户行	"存值范围如下：农信社，邮政储蓄银行，工商银行，农业银行，交通银行，建设银行，其他',
`ACCOUNT` varchar(30) comment '一卡通帐号',
`PROVINCE` varchar(30) not null comment '省名称',
`CITY` varchar(30) not null comment '市名称',
`COUNTY` varchar(30) not null comment '区县名称',
`TOWN` varchar(50) comment '乡镇',
`VILLAGE` varchar(50) comment '村组',
`ADDRESS` varchar(100) comment '地址',
`PROGRESS` varchar(1) not null comment '工程进度	0:未开始,1:开工,2:主基础工程完工,3:竣工已验收,一级危房有2，其他无2状态',
`FINISHAMOUNT` int comment '已兑付金额',
`FINISHSTATUS` varchar(1) not null comment '是否销户	0：未销户 1：已销户',
`INPUTCODE` varchar(30) comment '录入人',
`INPUTTIME` datetime comment '录入时间',
`UPDATECODE` varchar(30) comment '更新人',
`UPDATETIME` datetime comment '更新时间',
`CONFIRMCODE` varchar(30) comment '审核人',
`CONFIRMTIME` datetime comment '审核时间'
)engine=innodb character set utf8 comment '危房表';



-- 危房修改记录表
drop table if exists `GGBUILDINGMST_his`;

create table `GGBUILDINGMST_his`(
`BUSINESSNO` varchar(30) not null primary key comment '主键',
`ID` varchar(30) comment '危房id',
`HOUSEHOLDER` varchar(30) comment '屋主姓名',
`IDENTITYID` varchar(18) comment '身份证号',
`PEOPLENUMBER` int comment '人口数',
`TYPE` varchar(30) comment '贫困类型	存值范围如下：一级危房，二级危房，三级危房',
`GRADE` varchar(30) comment '危房等级	"存值范围如下：一级危房，二级危房，三级危房',
`STARTYEAR` varchar(30) comment '纳入改造时间	存值范围如下：2014,2015,2016,2017',
`SUNAMOUNT` int comment '补助金额	根据危房等级自动生成：一级危房：35000,二级危房：15000,三级危房：10000',
`BANK` varchar(30) comment '一卡通开户行	"存值范围如下：农信社，邮政储蓄银行，工商银行，农业银行，交通银行，建设银行，其他',
`ACCOUNT` varchar(30) comment '一卡通帐号',
`PROVINCE` varchar(6) comment '省',
`CITY` varchar(6) comment '市',
`COUNTY` varchar(6) comment '区县',
`TOWN` varchar(12) comment '乡镇',
`VILLAGE` varchar(12) comment '村组',
`ADDRESS` varchar(100) comment '地址',
`FINISHSTATUS` varchar(1) comment '是否销户	0：未销户 1：已销户',
`STATUS` varchar(1) not null comment '1：待审核 2：不通过 3：通过 -> 修改危房数据时，修改提交后，直接进入该表，不修改GGBUILDINGMST表，待审核和审核不通过的数据从此表读取，审核通过后，更新状态，同时更新GGBUILDINGMST表。',
`INPUTCODE` varchar(30) not null comment '录入人',
`INPUTTIME` datetime not null comment '录入时间'
)engine=innodb character set utf8 comment '危房修改记录表';


drop table if exists `GUPAYMENTORDER`;

create table `GUPAYMENTORDER`(
`ORDERNO` varchar(30) not null primary key comment '兑付单号	系统自动生成，格式操作日期的YYYYMMDDHHMMSS',
`ORDERDATE` datetime not null comment '兑付日期',
`SUMQUANTITY` int(30) comment '兑付危房数量',
`SUMAMOUNT` int(30) comment '兑换金额',
`ATTACHMENTPATH` varchar(100) comment '附件存放路径',
`STATUS` varchar(1) not null comment '状态 0：未确认 1：已确认',
`INPUTCODE` varchar(30) comment '录入人',
`INPUTTIME` datetime comment '录入时间',
`UPDATECODE` varchar(30) comment '更新人',
`UPDATETIME` datetime comment '更新时间',
`CONFIRMCODE` varchar(30) comment '审核人',
`CONFIRMTIME` datetime comment '审核时间'
)engine=innodb character set utf8 comment '兑付单';

-- 兑付表

drop table if exists `GUPAYMENT`;

create table `GUPAYMENT`(
	`ORDERNO` varchar(30) not null comment '兑付单号',
	`ID` varchar(30) not null comment '危房id',
	`BANK` varchar(30) comment '一卡通开户行	"存值范围如下：农信社，邮政储蓄银行，工商银行，农业银行，交通银行，建设银行，其他',
	`ACCOUNT` varchar(30) comment '一卡通帐号',
	`PROGRESS` varchar(1) not null comment '工程进度	0:未开始,1:开工,2:主基础工程完工,3:竣工已验收,一级危房有2，其他无2状态',
	`PAYMENTAMOUNT` int comment '兑付金额',
	`OPERATETDATE` datetime comment '兑付日期',
	`PAYMENTDATE` datetime comment '资金发放日期',
	`INPUTCODE` varchar(30) comment '录入人',
	`INPUTTIME` datetime comment '录入时间',
	`UPDATECODE` varchar(30) comment '更新人',
	`UPDATETIME` datetime comment '更新时间',
	`CONFIRMCODE` varchar(30) comment '审核人',
	`CONFIRMTIME` datetime comment '审核时间',
	primary key (`ORDERNO`,`ID`)
)engine=innodb character set utf8 comment '兑付表';

-- 兑付临时表

drop table if exists `GUPAYMENT_temp`;

create table `GUPAYMENT_temp`(
	`ORDERNO` varchar(30) not null comment '兑付单号',
	`ID` varchar(30) not null comment '危房id',
	`BANK` varchar(30) comment '一卡通开户行	"存值范围如下：农信社，邮政储蓄银行，工商银行，农业银行，交通银行，建设银行，其他',
	`ACCOUNT` varchar(30) comment '一卡通帐号',
	`PROGRESS` varchar(1) not null comment '工程进度	0:未开始,1:开工,2:主基础工程完工,3:竣工已验收,一级危房有2，其他无2状态',
	`PAYMENTAMOUNT` int comment '兑付金额',
	`OPERATETDATE` datetime comment '兑付日期',
	`PAYMENTDATE` datetime comment '资金发放日期',
	`INPUTCODE` varchar(30) comment '录入人',
	`INPUTTIME` datetime comment '录入时间',
	primary key (`ORDERNO`,`ID`)
)engine=innodb character set utf8 comment '兑付临时表';


-- 兑付记录表
drop table if exists `GUPAYMENT_his`;

create table `GUPAYMENT_his`(
	`ORDERNO` varchar(30) not null comment '兑付单号',
	`ID` varchar(30) not null comment '危房id',
	`BANK` varchar(30) comment '一卡通开户行	"存值范围如下：农信社，邮政储蓄银行，工商银行，农业银行，交通银行，建设银行，其他',
	`ACCOUNT` varchar(30) comment '一卡通帐号',
	`PROGRESS` varchar(1) not null comment '工程进度	0:未开始,1:开工,2:主基础工程完工,3:竣工已验收,一级危房有2，其他无2状态',
	`PAYMENTAMOUNT` int comment '兑付金额',
	`OPERATETDATE` datetime comment '兑付日期',
	`PAYMENTDATE` datetime comment '资金发放日期',
	`INPUTCODE` varchar(30) comment '录入人',
	`INPUTTIME` datetime comment '录入时间',
	primary key (`ORDERNO`,`ID`)
)engine=innodb character set utf8 comment '兑付记录表';


drop table if exists `GGCODE`;

create table `GGCODE`(
`CODETYPE` varchar(250),
`CODECODE` varchar(250),
`CODECNAME` varchar(250),
`CODETNAME` varchar(250),
`CODEENAME` varchar(1000),
`CREATORCODE` varchar(10),
`CREATETIME` datetime,
`UPDATERCODE` varchar(10),
`UPDATETIME` datetime,
`CALIDDATE` datetime,
`INVALIDDATE` datetime,
`CALIDIND` varchar(1) not null,
`REMARK` varchar(2000),
`FLAG` varchar(2),
`DISPLAYNO` int(7),
primary key(`CODETYPE`,`CODECODE`)
)engine=innodb default character set utf8 comment '数据字典';

insert into `ggcode`(`codetype`,`codecode`,`codecname`,`codetname`,`VALIDIND`) values
('povertyType','889', '建档立卡贫困户','建档立卡贫困户','1'),
('povertyType','888', '低保户','低保户' ,'1'),
('povertyType','887', '分散供养特困人员','分散供养特困人员','1'),
('povertyType','886', '贫困残疾人家庭','贫困残疾人家庭','1'),
('buildingLevel','777','一级危房','一级危房','1'),
('buildingLevel','776','二级危房','二级危房','1'),
('buildingLevel','775','三级危房','三级危房','1'),
('buildingAmount','851','35000','35000','1'),
('buildingAmount','852','15000','15000','1'),
('buildingAmount','853','10000','10000','1'),
('bankType','613354','农信社','农信社','1'),
('bankType','315548','邮政储蓄银行','邮政储蓄银行','1'),
('bankType','601398','工商银行','工商银行','1'),
('bankType','601288','农业银行','农业银行','1'),
('bankType','601328','交通银行','交通银行','1'),
('bankType','601939','建设银行','建设银行','1');

INSERT INTO `ggbuildingmst` VALUES
('1234567890', '韩信', '511423198101058505', '5', '889', '35000', '2016', '35000', '613354', '6210985200023057882', '520000', '520100', '520102', null, null, null, '0', '15000', '0', '88888', '2017-08-04 16:38:26', '88888', '2017-08-04 16:38:26', '88888', '2017-08-04 16:38:26');
('1234567891', '赵云', '511423198101058506', '4', '887', '15000', '2017', '15000', '315548', '6210985200023057775', '520000', '520200', '520201', null, null, null, '0', '10000', '0', '88888', '2017-08-04 16:38:26', '88888', '2017-08-04 16:38:26', '88888', '2017-08-04 16:38:26');
('1234567892', '鲁班', '511423198101058515', '3', '886', '10000', '2015', '10000', '601288', '6210985200023057772', '520000', '520200', '520201', null, null, null, '0', '25000', '0', '88888', '2017-08-04 16:38:26', '88888', '2017-08-04 16:38:26', '88888', '2017-08-04 16:38:26');
('1234567893', '李白', '511423198101058525', '6', '889', '35000', '2016', '35000', '601328', '6210985200023057862', '520000', '520100', '520103', null, null, null, '0', '0', '0', '88888', '2017-08-04 16:38:26', '88888', '2017-08-04 16:38:26', '88888', '2017-08-04 16:38:26');
('1234567894', '刘备', '511423198101058501', '2', '888', '10000', '2016', '10000', '601288', '6210985200023057852', '520000', '520300', '520301', null, null, null, '0', '7500', '0', '88888', '2017-08-04 16:38:26', '88888', '2017-08-04 16:38:26', '88888', '2017-08-04 16:38:26');
('1234567895', '孙尚香', '511423198101058500', '3', '886', '35000', '2017', '35000', '315548', '6210985200023059882', '520000', '520100', '520111', null, null, null, '0', '15000', '0', '88888', '2017-08-04 16:38:26', '88888', '2017-08-04 16:38:26', '88888', '2017-08-04 16:38:26');
('1234567896', '孙悟空', '511423198101058511', '5', '889', '10000', '2016', '10000', '613354', '6210985200023057882', '520000', '520300', '520302', null, null, null, '0', '6000', '0', '88888', '2017-08-04 16:38:26', '88888', '2017-08-04 16:38:26', '88888', '2017-08-04 16:38:26');
('1234567897', '狄仁杰', '511423198101058524', '4', '887', '35000', '2015', '35000', '601939', '6210985200023078882', '520000', '520300', '520303', null, null, null, '0', '13000', '0', '88888', '2017-08-04 16:38:26', '88888', '2017-08-04 16:38:26', '88888', '2017-08-04 16:38:26');
('1234567898', '花木兰', '511423198101058514', '6', '888', '15000', '2016', '15000', '601939', '6210985200023023882', '520000', '520200', '520203', null, null, null, '0', '11000', '0', '88888', '2017-08-04 16:38:26', '88888', '2017-08-04 16:38:26', '88888', '2017-08-04 16:38:26');
('1234567899', '张飞', '511423198101058556', '5', '887', '15000', '2015', '15000', '601328', '6210985200023051232', '520000', '520100', '520101', null, null, null, '0', '8000', '0', '88888', '2017-08-04 16:38:26', '88888', '2017-08-04 16:38:26', '88888', '2017-08-04 16:38:26');

INSERT INTO `gupaymentorder` VALUES
('123456', now(), '12', '75000', '/path', '0','789456', now(), '789456', now(), '789456', now()),
('123457', now(), '5', '75000', '/path', '1','789456', now(), '789456', now(), '789456', now()),
('123458', now(), '7', '75000', '/path', '0','789456', now(), '789456', now(), '789456', now()),
('123459', now(), '5', '75000', '/path', '1','789456', now(), '789456', now(), '789456', now());

