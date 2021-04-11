/* 
    [DB2 project] HOSPITAL DATABASE 
    designed by 박준현, 성소연 
    
*/
/***********************************************
            CREATE TABLE STATEMENT 
***********************************************/

create table PATIENT(
P_ID int not null, 
lname varchar2(10) not null, 
fName varchar2(10) not null,
sex varchar2(5) not null,
age number(3) not null,
address varchar2(20),
phone# varchar2(15),
constraint patient_pk primary key(P_ID)
);

create table outpatient(
p_id int not null,
visit# varchar2 (8) not null unique,
visitdate date not null,
visittime varchar2 (6) not null,
visitreason varchar2(15),
constraint outpatient_pk primary key (p_id),
constraint outpatient_fk foreign key (p_id) references patient (p_id)
);

create table inpatient(
p_id int not null,
admit# varchar2 (8) not null unique,
dateadmitted date not null,
datedischarged date not null,
constraint inpatient_pk primary key (p_id),
constraint inpatient_fo foreign key (p_id) references patient (p_id));

create table department(
dept# int not null,
deptname varchar2 (20) not null,
location varchar2 (10),
deptphone# varchar2(15),
number_of_people number(4),
constraint department_pk primary key (dept#)
);

create table treatment(
tdept# int not null,
primary key (tdept#),
foreign key (tdept#) references department (dept#)
);

create table nursing(
ndept# int not null,
primary key (ndept#),
foreign key (ndept#) references department (dept#)
);

create table administration(
adept# int not null,
primary key (adept#),
foreign key (adept#) references department (dept#)
);

create table nurse (
n_id int not null,
lname varchar2(10) not null, 
fName varchar2(10) not null,
address varchar2 (20),
wcaretime varchar2 (20),
ndept# int not null,
primary key (n_id),
foreign key (ndept#) references nursing(ndept#)
);

create table tool (
t_id int not null,
tname varchar2 (20) not null,
price number (10,2) not null,
purchasedate date not null,
adept# int not null,
primary key (t_id),
foreign key (adept#) references administration(adept#)
);

create table employee (
e_id int not null,
lname varchar2(10) not null, 
fName varchar2(10) not null,
address varchar2 (20),
phone# varchar2 (15),
job varchar2 (20) not null,
hiredate date not null,
adept# int not null,
primary key (e_id),
foreign key (adept#) references administration(adept#)
);

create table doctor (
dr_id int not null,
lname varchar2(10) not null, 
fName varchar2(10) not null,
address varchar2 (20),
clinictime varchar2(20) not null,
specialty varchar2 (20) not null,
tdept# int not null,
primary key (dr_id),
foreign key (tdept#) references treatment(tdept#)
);

create table prescription (
pre# int not null,
pdate date not null,
drug varchar2(50) not null,
charge number (6),
p_id int not null,
dr_id int not null,
primary key (p_id, dr_id),
foreign key (p_id) references patient(p_id),
foreign key (dr_id) references doctor (dr_id)
);

create table surgery(
s_id int not null,
sname varchar2(50) not null,
sdate date not null,
stime varchar(20) not null,
room# varchar (4),
charge number (8) not null,
dr_id int not null,
primary key (s_id),
foreign key (dr_id) references doctor(dr_id)
);

create table psurgery(
p_id int not null,
s_id int not null,
primary key (p_id, s_id),
foreign key (p_id) references inpatient (p_id),
foreign key (s_id) references surgery (s_id)
);

create table ward (
ward# int not null,
type varchar2 (8),
floor varchar2 (8),
primary key (ward#)
);

create table wcare (
ward# int not null,
n_id int not null,
primary key (ward#, n_id),
foreign key (ward#) references ward(ward#),
foreign key (n_id) references nurse(n_id)
);

create table bed(
bed# int not null,
condition varchar2(8) not null,
ward# int not null,
p_id int not null,
primary key (bed#),
foreign key (ward#) references ward(ward#),
foreign key (p_id) references inpatient(p_id)
);


/***********************************************
            INSERT VALUES STATEMENT 
***********************************************/
insert into patient values (1, '홍', '길동', '남', 23, '서울시', '010-1234-3331');
insert into patient values (2, '성', '소연', '여', 22, '부천시', '010-0308-1101');
insert into patient values (3, '박', '준현', '남', 23, '서울시', '010-0308-0809');
insert into patient values (4, '이', '우동', '여', 25, '대구시', '010-1515-8989');
insert into patient values (5, '김', '정수', '남', 26, '광주시', '010-7713-7734');
insert into patient values (6, '최', '정상', '남', 21, '서울시', '010-7612-7021');
insert into patient values (7, '오', '겹살', '남', 20, '서울시', '010-7611-7019');
insert into patient values (8, '강', '호동', '남', 35, '서울시', '010-0271-0270');
insert into patient values (9, '유', '재석', '남', 34, '광주시', '010-1101-0809');
insert into patient values (10, '아', '융이', '여', 12, '성남시', '010-2918-1707');
insert into patient values (11, '김', '일주', '남', 32, '서울시', '010-1202-1303');
insert into patient values (12, '최', '성운', '남', 43, '서울시', '010-5420-3515');
insert into patient values (13, '전', '종훈', '남', 36, '성남시', '010-7856-9981');
insert into patient values (14, '이', '경미', '여', 34, '인천시', '010-2408-3618');
insert into patient values (15, '김', '상균', '남', 29, '서울시', '010-4416-5210');
insert into patient values (16, '권', '영일', '남', 42, '대구시', '010-5525-6636');
insert into patient values (17, '김', '정호', '남', 38, '서울시', '010-7749-8864');
insert into patient values (18, '이', '강선', '여', 33, '인천시', '010-2204-4416');
insert into patient values (19, '신', '지수', '여', 22, '남양주시', '010-5678-1234');
insert into patient values (20, '한', '민', '남', 22, '광주시', '010-7070-8080');
insert into patient values (21, '홍', '영석', '남', 23, '하남시', '010-3512-2244');
insert into patient values (22, '김', '민태', '남', 21, '서울시', '010-3833-5212');
insert into patient values (23, '김', '규원', '남', 22, '부산시', '010-4805-4021');
insert into patient values (24, '서', '유림', '여', 12, '안산시', '010-2088-5078');
insert into patient values (25, '박', '건희', '여', 21, '서울시', '010-3405-0070');
insert into patient values (26, '김', '슬기', '여', 22, '성남시', '010-5077-2030');
insert into patient values (27, '황', '지영', '여', 24, '용인시', '010-2243-3333');
insert into patient values (28, '김', '동민', '남', 23, '의정부시', '010-0012-2778');
insert into patient values (29, '김', '혜수', '여', 22, '부천시', '010-6383-6637');
insert into patient values (30, '박', '해진', '여', 22, '안산시', '010-3166-2099');

insert into inpatient values (1, 0001, '2017-03-02', '2017-04-23');
insert into inpatient values (3, 0002, '2017-04-02', '2018-05-27');
insert into inpatient values (5, 0003, '2018-02-02', '2018-02-05');
insert into inpatient values (7, 0004, '2018-03-02', '2018-04-01');
insert into inpatient values (9, 0005, '2018-05-12', '2018-05-17');
insert into inpatient values (11, 0006, '2018-05-18', '2018-05-27');
insert into inpatient values (13, 0007, '2018-05-28', '2018-06-02');
insert into inpatient values (15, 0008, '2018-06-10', '2018-06-11');
insert into inpatient values (17, 0009, '2018-06-11', '2018-06-14');
insert into inpatient values (19, 0010, '2018-06-11', '2018-06-23');
insert into inpatient values (21, 0011, '2018-06-12', '2018-06-24');
insert into inpatient values (23, 0012, '2018-06-12', '2018-06-14');
insert into inpatient values (25, 0013, '2018-06-14', '2018-06-15');
insert into inpatient values (27, 0014, '2018-06-14', '2018-07-14');
insert into inpatient values (29, 0015, '2018-06-15', '2018-06-18');

insert into outpatient values (2, 101, '2017-4-12', '10:45', '기침');
insert into outpatient values (4, 102, '2017-10-7', '14:22', '발열');
insert into outpatient values (6, 103, '2017-12-20', '13:09', '기침');
insert into outpatient values (8, 104, '2018-02-03', '11:35', '두통');
insert into outpatient values (10, 105, '2018-03-08', '17:21', '복통');
insert into outpatient values (12, 106, '2018-04-22', '16:07', '요통');
insert into outpatient values (14, 107, '2018-05-18', '14:30', '몸살');
insert into outpatient values (16, 108, '2018-05-19', '15:44', '몸살');
insert into outpatient values (18, 109, '2018-06-10', '12:13', '발열');
insert into outpatient values (20, 110, '2018-06-10', '13:36', '요통');
insert into outpatient values (22, 111, '2018-06-11', '12:15', '치통');
insert into outpatient values (24, 112, '2018-06-12', '15:11', '독감');
insert into outpatient values (26, 113, '2018-06-13', '10:20', '재활운동');
insert into outpatient values (28, 114, '2018-06-14', '16:04', '혈액검사');
insert into outpatient values (30, 115, '2018-06-14', '14:24', '신경통');

insert into department values (1, 'treatment', '3F-A', '02-300-0641', '15');
insert into department values (2, 'nursing', '3F-B', '02-300-0643', '15');
insert into department values (3, 'administration', '2F-A', '02-300-0645', '15');
insert into treatment values (1);
insert into nursing values (2);
insert into administration values (3);

insert into nurse values (182, '홍', '진영', '광주시', '24:00-08:00', 2);
insert into nurse values (183, '공', '승연', '남양주시', '24:00-08:00', 2);
insert into nurse values (184, '박', '서준', '서울시', '24:00-08:00', 2);
insert into nurse values (185, '박', '민영', '대구시', '08:00-16:00', 2);
insert into nurse values (186, '서', '강준', '서울시', '08:00-16:00', 2);
insert into nurse values (187, '송', '지효', '하남시', '08:00-16:00', 2);
insert into nurse values (188, '이', '준기', '광주시', '16:00-24:00', 2);
insert into nurse values (189, '송', '혜교', '대구시', '16:00-24:00', 2);
insert into nurse values (190, '배', '수지', '남양주시', '16:00-24:00', 2);
insert into nurse values (191, '김', '태연', '하남시', '16:00-24:00', 2);
insert into nurse values (192, '김', '연우', '부산시', '24:00-08:00', 2);
insert into nurse values (193, '박', '보검', '서울시', '08:00-16:00', 2);
insert into nurse values (194, '김', '준호', '하남시', '02:00-16:00', 2);
insert into nurse values (195, '김', '종민', '서울시', '16:00-24:00', 2);
insert into nurse values (196, '이', '승기', '대구시', '24:00-08:00', 2);

insert into tool values (38, '매스', 3000, '2016-10-10', 3);
insert into tool values (1422, '가위', 2800, '2016-10-10', 3);
insert into tool values (1399, '거즈', 50, '2016-10-30', 3);
insert into tool values (1380, '거즈', 50, '2016-10-30', 3);
insert into tool values (1381, '거즈', 50, '2016-10-30', 3);
insert into tool values (1382, '거즈', 50, '2016-10-30', 3);
insert into tool values (1383, '거즈', 50, '2016-10-30', 3);
insert into tool values (1384, '거즈', 50, '2016-10-30', 3);
insert into tool values (1385, '거즈', 50, '2016-10-30', 3);
insert into tool values (1386, '거즈', 50, '2016-10-30', 3);
insert into tool values (2012, '석션', 200000, '2016-12-05', 3);
insert into tool values (553, '내시경', 900000, '2017-01-02', 3);
insert into tool values (199, '레이저기', 750000, '2017-01-02', 3);
insert into tool values (3342, '수액', 3500, '2016-10-09', 3);
insert into tool values (1642, '수술용장갑', 700, '2016-10-09', 3);
insert into tool values (1334, '주사기', 500, '2016-10-10', 3);
insert into tool values (2001, '수술대', 500000, '2016-10-10', 3);
insert into tool values (427, '수술모니터', 1500000, '2017-06-13', 3);
insert into tool values (501, '로봇팔', 5000000, '2018-04-20', 3);
insert into tool values (273, '카메라', 1300000, '2018-04-20', 3);
insert into tool values (533, '청진기', 25000, '2016-10-10', 3);
insert into tool values (613, '마스크', 500, '2016-10-10', 3);
insert into tool values (39, '매스', 3000, '2016-10-10', 3);
insert into tool values (40, '매스', 3000, '2016-10-10', 3);
insert into tool values (41, '매스', 3000, '2016-10-11', 3);
insert into tool values (42, '매스', 3000, '2016-10-11', 3);
insert into tool values (43, '매스', 3000, '2016-10-12', 3);
insert into tool values (1423, '가위', 2800, '2016-10-15', 3);
insert into tool values (1424, '가위', 2800, '2016-10-15', 3);
insert into tool values (1425, '가위', 2800, '2016-10-20', 3);
insert into tool values (3343, '수액', 3500, '2016-10-15', 3);
insert into tool values (1643, '수술용장갑', 700, '2016-10-12', 3);
insert into tool values (1335, '주사기', 500, '2016-10-13', 3);
insert into tool values (534, '청진기', 25000, '2016-10-10', 3);
insert into tool values (614, '마스크', 500, '2016-10-10', 3);
insert into tool values (615, '마스크', 500, '2016-10-11', 3);
insert into tool values (777, '수술스탠드', 350000, '2016-12-1', 3);
insert into tool values (778, '수술스탠드', 350000, '2016-12-1', 3);
insert into tool values (22, '호흡기', 200500, '2016-10-11', 3);
insert into tool values (23, '주사기', 500, '2016-10-10', 3);
insert into tool values (24, '호흡기', 200500, '2016-10-12', 3);
insert into tool values (111, '발덮개', 50, '2016-10-10', 3);
insert into tool values (112, '발덮개', 50, '2016-10-10', 3);
insert into tool values (113, '발덮개', 50, '2016-10-10', 3);
insert into tool values (114, '발덮개', 50, '2016-10-10', 3);
insert into tool values (115, '발덮개', 50, '2016-10-10', 3);
insert into tool values (116, '발덮개', 50, '2016-10-10', 3);

insert into employee values (500, '김', '일꾼', '과천시', '010-8484-1515', '사무관리', '2016-10-05', 3);
insert into employee values (501, '박', '일꾼', '서울시', '010-5422-4312', '계약관리', '2016-10-05', 3);
insert into employee values (502, '이', '일꾼', '과천시', '010-1556-4385', '계약관리', '2016-12-17', 3);
insert into employee values (503, '최', '일꾼', '서울시', '010-3165-1022', '사무관리', '2017-02-07', 3);
insert into employee values (504, '강', '일꾼', '서울시', '010-7844-7050', '건물관리', '2016-10-05', 3);
insert into employee values (505, '한', '일꾼', '서울시', '010-9533-1377', '건물관리', '2018-02-11', 3);
insert into employee values (506, '홍', '일꾼', '부산시', '010-3301-1383', '시설관리', '2016-10-05', 3);
insert into employee values (507, '신', '일꾼', '제주시', '010-0054-1275', '시설관리', '2018-03-02', 3);
insert into employee values (508, '성', '일꾼', '부산시', '010-8962-1040', '회계관리', '2017-10-05', 3);
insert into employee values (509, '나', '일꾼', '일산시', '010-8403-0007', '사무관리', '2018-06-11', 3);
insert into employee values (510, '고', '일꾼', '부산시', '010-1212-2383', '회계관리', '2017-04-27', 3);
insert into employee values (511, '정', '일꾼', '대구시', '010-0270-3340', '회계관리', '2018-05-08', 3);
insert into employee values (512, '조', '일꾼', '대구시', '010-3205-3078', '시설관리', '2017-02-03', 3);
insert into employee values (513, '문', '일꾼', '대구시', '010-3780-3208', '사무관리', '2016-11-22', 3);
insert into employee values (514, '권', '일꾼', '일산시', '010-9995-2248', '건물관리', '2018-06-12', 3);
insert into employee values (515, '황', '일꾼', '남양주시', '010-1127-2044', '회계관리', '2018-06-12', 3);

insert into doctor values (81, '김', '태윤', '서울시', '10:00-18:00', '정형외과', 1);
insert into doctor values (82, '김', '재현', '대구시', '10:00-18:00', '내과', 1);
insert into doctor values (83, '김', '범수', '대구시', '12:00-20:00', '이비인후과', 1);
insert into doctor values (84, '한', '동훈', '대전시', '20:00-24:00', '외과', 1);
insert into doctor values (85, '이', '준엽', '서울시', '24:00-10:00', '영상의학과', 1);
insert into doctor values (86, '의', '느님', '대구시', '10:00-24:00', '성형외과', 1);
insert into doctor values (87, '방', '사선', '서울시', '10:00-24:00', '방사선과', 1);
insert into doctor values (88, '나', '재활', '부산시', '10:00-24:00', '재활치료과', 1);
insert into doctor values (89, '김', '아기', '과천시', '10:00-18:00', '산부인과', 1);
insert into doctor values (90, '최', '유아', '광주시', '10:00-18:00', '소아과', 1);
insert into doctor values (91, '장', '리톨', '서울시', '10:00-18:00', '치과', 1);
insert into doctor values (92, '임', '병리', '대구시', '12:00-20:00', '임상병리과', 1);
insert into doctor values (93, '신', '경질', '과천시', '12:00-20:00', '신경과', 1);
insert into doctor values (94, '이', '상해', '서울시', '12:00-20:00', '정신과', 1);
insert into doctor values (95, '마', '취해', '광주시', '10:00-24:00', '마취과', 1);

-- outpatient prescription
insert into prescription values (501, '17-04-12', '진해거담제', 5200, 2, 83);
insert into prescription values (502, '17-10-07', '아스피린1', 4800, 4, 82);
insert into prescription values (503, '17-12-20', '진해거담제', 5200, 6, 83);
insert into prescription values (504, '18-02-03', '진통제', 4400, 8, 83);
insert into prescription values (505, '18-03-08', '제산제', 4500, 10, 82);
insert into prescription values (506, '18-04-22', '항염증스테로이드', 6300, 12, 81);
insert into prescription values (507, '18-05-18', '아스피린2', 4900, 14, 82);
insert into prescription values (508, '18-05-19', '아스피린2', 4900, 16, 82);
insert into prescription values (509, '18-06-10', '아스피린1', 4800, 18, 82);
insert into prescription values (519, '18-06-10', '항염증스테로이드', 6300, 20, 81);
insert into prescription values (520, '18-06-11', '클로닉신', 5300, 22, 91);
insert into prescription values (521, '18-06-12', '아세트아미노펜', 5700, 24, 90);
insert into prescription values (522, '18-06-13', '재활치료제', 6000, 26, 88);
insert into prescription values (523, '18-06-14', '알막틴', 5900, 28, 92);
insert into prescription values (524, '18-06-14', '진통제', 4400, 30, 83);

-- inpatient prescription
insert into prescription values (510, '17-03-02', '항염증스테로이드', 6300, 1, 81);
insert into prescription values (511, '17-04-02', '항생제', 4100, 3, 82);
insert into prescription values (531, '17-05-05', '항생제', 4100, 3, 82);
insert into prescription values (512, '18-02-02', '진통제', 4400, 5, 83);
insert into prescription values (513, '18-03-02', '항생제', 4100, 7, 82);
insert into prescription values (514, '18-05-12', '진통제', 4400, 9, 83);
insert into prescription values (515, '18-05-18', '클로로프로마진', 23000, 11, 85);
insert into prescription values (516, '18-05-28', '플루타미드', 25000, 13, 85);
insert into prescription values (517, '18-06-10', '아스피린1', 4800, 15, 82);
insert into prescription values (518, '18-06-12', '우르소데옥시콜', 4200, 17, 84);
insert into prescription values (525, '18-06-11', '피나스테라이드', 16000, 19, 86);
insert into prescription values (526, '18-06-12', '디에타민', 9200, 21, 94);
insert into prescription values (527, '18-06-12', '항방사선제', 6600, 23, 87);
insert into prescription values (528, '18-06-14', '검사보조제', 8000, 25, 89);
insert into prescription values (529, '18-06-14', '소염제', 4100, 27, 81);
insert into prescription values (530, '18-06-15', '신경안정제', 21000, 29, 93);

insert into surgery values (221, '축농증수술', '17-04-29', '13:00-15:00', 10, '750000', 83);
insert into surgery values (222, '축농증수술', '17-05-10', '13:00-15:00', 10, '750000', 83);
insert into surgery values (281, '척추측만증수술', '17-08-21', '10:00-13:00', 15, '1800000', 81);
insert into surgery values (264, '장기이식수술', '18-06-12', '20:00-24:00', 10, '8000000', 84);
insert into surgery values (172, '콧대수술', '18-06-13', '11:00-14:00', 10, '1300000', 86);
insert into surgery values (123, '뇌수술', '18-06-14', '13:00-18:00', 10, '5500000', 94);
insert into surgery values (438, '신경수술', '18-06-15', '14:00-19:00', 10, '3466000', 93);

insert into psurgery values (3,221);
insert into psurgery values (3,222);
insert into psurgery values (1,281);
insert into psurgery values (17,264);
insert into psurgery values (19,172);
insert into psurgery values (21,123);
insert into psurgery values (29,438);

insert into ward values (501, '2인실', '5F');
insert into ward values (502, '4인실', '6F');
insert into ward values (503, '4인실', '6F');
insert into ward values (504, '2인실', '5F');
insert into ward values (505, '2인실', '5F');
insert into ward values (506, '2인실', '5F');
insert into ward values (507, '2인실', '5F');
insert into ward values (508, '4인실', '6F');
insert into ward values (509, '4인실', '6F');
insert into ward values (510, '4인실', '6F');
insert into ward values (511, '4인실', '6F');
insert into ward values (512, '6인실', '7F');
insert into ward values (513, '6인실', '7F');
insert into ward values (514, '6인실', '7F');
insert into ward values (515, '6인실', '7F');

insert into wcare values (501, 185);
insert into wcare values (501, 183);
insert into wcare values (501, 188);
insert into wcare values (502, 184);
insert into wcare values (502, 186);
insert into wcare values (502, 189);
insert into wcare values (503, 182);
insert into wcare values (503, 187);
insert into wcare values (503, 190);
insert into wcare values (504, 191);
insert into wcare values (504, 192);
insert into wcare values (504, 193);
insert into wcare values (513, 194);
insert into wcare values (513, 195);
insert into wcare values (513, 196);

insert into bed values (5011, '좋음', 501, 1);
insert into bed values (5012, '좋음', 501, 3);
insert into bed values (5021, '보통', 502, 5);
insert into bed values (5022, '보통', 502, 7);
insert into bed values (5023, '좋음', 502, 9);
insert into bed values (5031, '보통', 503, 13);
insert into bed values (5032, '좋음', 503, 15);
insert into bed values (5033, '좋음', 503, 17);
insert into bed values (5034, '좋음', 504, 19);
insert into bed values (5035, '보통', 504, 21);
insert into bed values (5036, '좋음', 513, 23);
insert into bed values (5037, '보통', 513, 25);
insert into bed values (5038, '보통', 513, 27);
insert into bed values (5039, '좋음', 513, 29);

/***********************************************
            SELECT QUERY STATEMENT 
***********************************************/
/***********************************************
                QUERY DESIGN (DML)
***********************************************/

/* 1번 : 20대 환자들의 환자번호와 이름, 나이를 표시하여라 
? 20대 환자들의 이용률을 알아보기 위해 */
select p_id, lname, fname, age from patient where age between 20 and 29;

/* 2번 : 내과에서 진료받은 여성 환자들의 이름과 진료날짜를 모두 표시하여라 
? 내과 진료팀에서 여성 환자의 이력을 보기 위해서 */
select patient.lname, patient.fname, prescription.pdate
from patient, prescription, doctor
where patient.p_id = prescription.p_id 
and prescription.dr_id = doctor.dr_id
and specialty='내과' and sex = '여';

/* 3번 :  성이 김씨인 환자가 받은 수술이름과 날짜, 환자의 이름,나이를 조회하여라 
? 성만 알고 이름을 모를 때 수술내역을 조회하기 위해서 */
select  sname, lname, fname, sdate, age from patient natural join inpatient natural join psurgery natural join surgery
where lname = '김';

/* 4번 : 도구 중 1회 구매하지 않은 도구의 이름과 구매회수를 구하고 회수별 오름차순으로 정렬하여라
? 도구 구매 중 여러 번 구매하는 도구의 빈번도를 알아보기 위해서 */
select tname, count(tname) as purchase_count from tool group by tname having count(tname) <> 1
order by purchase_count;

/* 5번 : 도구 중 평균 가격 보다 높은 도구의 이름과 가격을 구하여라
  ? 도구 재구매를 할 때 평균보다 높은 가격의 도구들의 가격을 업체와 재협상하기 위해서 */
select tname, price from tool where price > (select avg(price) from tool) group by tname, price;

/* 6번 : 침대의 상태별로 개수를 구하여라
  ? 총 침대의 상태가 어떤 상태인지 한 눈에 보기 위해서 */
select condition, count(*) as bed_condition from bed group by condition;

/* 7번 :  first name에 '정'이 들어가는 사람 중 18-06-01 이후에 방문한 사람의 이름과 진료날짜, 처방약이름을 구하여라
  ? 이름 중 한 글자만 알고 다른 정보를 알고 있을 때 검색해보기 위해서 */
select lname, fname, pdate, drug from patient, inpatient, prescription
where patient.p_id = inpatient.p_id and patient.p_id = prescription.p_id
and patient.fname like '%정%'
and pdate > '18-06-01';

/* 8번 : 외래환자들의 진료과목, 방문이유, 방문목적별 회수를 구하여라
  ? 새로운 의사를 뽑을 때 어떤 분야가 많이 필요한지 알기 위해서 */
select specialty, visitreason, count(patient.p_id) as num_of_visit from outpatient, patient, prescription, doctor
where outpatient.p_id = patient.p_id and patient.p_id = prescription.p_id and prescription.dr_id = doctor.dr_id
group by specialty, visitreason order by num_of_visit desc;

/* 9번 : 입원환자들의 진료과목, 수술이름, 수술별 회수를 구하여라 
? 새로운 의사를 뽑을 때 어떤 분야가 많이 필요한지 알기 위해서 */
select specialty, sname, count(psurgery.s_id) as num_of_surgery from patient, inpatient, psurgery, surgery, doctor
where patient.p_id = inpatient.p_id and inpatient.p_id = psurgery.p_id and psurgery.s_id = surgery.s_id
and surgery.dr_id = doctor.dr_id group by specialty, sname order by num_of_surgery desc;

/* 10번 : 503호를 간호하는 간호사의 정보를 나타내라
? 병동을 간호하고 있는 간호사들이 누가 있는지 알아보기 위해서 */
select * from nurse where n_id in (select n_id from wcare where ward# = 503);

/* 11번 : 의사번호, 이름, 진료과목, 담당했던 수술이름을 의사ID별로 출력하기
? 의사가 어떤 수술을 집도했는지 의사의 경력에 넣기 위해서 */
select doctor.dr_id, lname, fname, specialty, sname from psurgery, surgery, doctor 
where psurgery.s_id = surgery.s_id and surgery.dr_id = doctor.dr_id
group by doctor.dr_id, lname, fname, specialty, sname order by dr_id;

/* 12번 : 2018년 2분기의 처방된 약의 비용은 총 얼마인가
  ? 분기별 처방 비용에 대한 매출을 계산하기 위해서 */
select sum(charge) as drug_sales from prescription where pdate between '18-04-01' and '18-06-30';

/* 13번 : A동 2층에서 근무하는 사람 중 2017/06/18 이후 부터 근무한 사람의 이름과 역할, 고용날짜를 구하여라
  ? 1년 이상 근무한 직원들의 승진평가항목에 기입하기 위해서 */
select lname, fname, job, hiredate from department, administration, employee
where department.dept# = administration.adept# and administration.adept# = employee.adept#
and hiredate > '17-06-18';
