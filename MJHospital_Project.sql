/* 
    [DB2 project] HOSPITAL DATABASE 
    designed by ������, ���ҿ� 
    
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
insert into patient values (1, 'ȫ', '�浿', '��', 23, '�����', '010-1234-3331');
insert into patient values (2, '��', '�ҿ�', '��', 22, '��õ��', '010-0308-1101');
insert into patient values (3, '��', '����', '��', 23, '�����', '010-0308-0809');
insert into patient values (4, '��', '�쵿', '��', 25, '�뱸��', '010-1515-8989');
insert into patient values (5, '��', '����', '��', 26, '���ֽ�', '010-7713-7734');
insert into patient values (6, '��', '����', '��', 21, '�����', '010-7612-7021');
insert into patient values (7, '��', '���', '��', 20, '�����', '010-7611-7019');
insert into patient values (8, '��', 'ȣ��', '��', 35, '�����', '010-0271-0270');
insert into patient values (9, '��', '�缮', '��', 34, '���ֽ�', '010-1101-0809');
insert into patient values (10, '��', '����', '��', 12, '������', '010-2918-1707');
insert into patient values (11, '��', '����', '��', 32, '�����', '010-1202-1303');
insert into patient values (12, '��', '����', '��', 43, '�����', '010-5420-3515');
insert into patient values (13, '��', '����', '��', 36, '������', '010-7856-9981');
insert into patient values (14, '��', '���', '��', 34, '��õ��', '010-2408-3618');
insert into patient values (15, '��', '���', '��', 29, '�����', '010-4416-5210');
insert into patient values (16, '��', '����', '��', 42, '�뱸��', '010-5525-6636');
insert into patient values (17, '��', '��ȣ', '��', 38, '�����', '010-7749-8864');
insert into patient values (18, '��', '����', '��', 33, '��õ��', '010-2204-4416');
insert into patient values (19, '��', '����', '��', 22, '�����ֽ�', '010-5678-1234');
insert into patient values (20, '��', '��', '��', 22, '���ֽ�', '010-7070-8080');
insert into patient values (21, 'ȫ', '����', '��', 23, '�ϳ���', '010-3512-2244');
insert into patient values (22, '��', '����', '��', 21, '�����', '010-3833-5212');
insert into patient values (23, '��', '�Կ�', '��', 22, '�λ��', '010-4805-4021');
insert into patient values (24, '��', '����', '��', 12, '�Ȼ��', '010-2088-5078');
insert into patient values (25, '��', '����', '��', 21, '�����', '010-3405-0070');
insert into patient values (26, '��', '����', '��', 22, '������', '010-5077-2030');
insert into patient values (27, 'Ȳ', '����', '��', 24, '���ν�', '010-2243-3333');
insert into patient values (28, '��', '����', '��', 23, '�����ν�', '010-0012-2778');
insert into patient values (29, '��', '����', '��', 22, '��õ��', '010-6383-6637');
insert into patient values (30, '��', '����', '��', 22, '�Ȼ��', '010-3166-2099');

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

insert into outpatient values (2, 101, '2017-4-12', '10:45', '��ħ');
insert into outpatient values (4, 102, '2017-10-7', '14:22', '�߿�');
insert into outpatient values (6, 103, '2017-12-20', '13:09', '��ħ');
insert into outpatient values (8, 104, '2018-02-03', '11:35', '����');
insert into outpatient values (10, 105, '2018-03-08', '17:21', '����');
insert into outpatient values (12, 106, '2018-04-22', '16:07', '����');
insert into outpatient values (14, 107, '2018-05-18', '14:30', '����');
insert into outpatient values (16, 108, '2018-05-19', '15:44', '����');
insert into outpatient values (18, 109, '2018-06-10', '12:13', '�߿�');
insert into outpatient values (20, 110, '2018-06-10', '13:36', '����');
insert into outpatient values (22, 111, '2018-06-11', '12:15', 'ġ��');
insert into outpatient values (24, 112, '2018-06-12', '15:11', '����');
insert into outpatient values (26, 113, '2018-06-13', '10:20', '��Ȱ�');
insert into outpatient values (28, 114, '2018-06-14', '16:04', '���װ˻�');
insert into outpatient values (30, 115, '2018-06-14', '14:24', '�Ű���');

insert into department values (1, 'treatment', '3F-A', '02-300-0641', '15');
insert into department values (2, 'nursing', '3F-B', '02-300-0643', '15');
insert into department values (3, 'administration', '2F-A', '02-300-0645', '15');
insert into treatment values (1);
insert into nursing values (2);
insert into administration values (3);

insert into nurse values (182, 'ȫ', '����', '���ֽ�', '24:00-08:00', 2);
insert into nurse values (183, '��', '�¿�', '�����ֽ�', '24:00-08:00', 2);
insert into nurse values (184, '��', '����', '�����', '24:00-08:00', 2);
insert into nurse values (185, '��', '�ο�', '�뱸��', '08:00-16:00', 2);
insert into nurse values (186, '��', '����', '�����', '08:00-16:00', 2);
insert into nurse values (187, '��', '��ȿ', '�ϳ���', '08:00-16:00', 2);
insert into nurse values (188, '��', '�ر�', '���ֽ�', '16:00-24:00', 2);
insert into nurse values (189, '��', '����', '�뱸��', '16:00-24:00', 2);
insert into nurse values (190, '��', '����', '�����ֽ�', '16:00-24:00', 2);
insert into nurse values (191, '��', '�¿�', '�ϳ���', '16:00-24:00', 2);
insert into nurse values (192, '��', '����', '�λ��', '24:00-08:00', 2);
insert into nurse values (193, '��', '����', '�����', '08:00-16:00', 2);
insert into nurse values (194, '��', '��ȣ', '�ϳ���', '02:00-16:00', 2);
insert into nurse values (195, '��', '����', '�����', '16:00-24:00', 2);
insert into nurse values (196, '��', '�±�', '�뱸��', '24:00-08:00', 2);

insert into tool values (38, '�Ž�', 3000, '2016-10-10', 3);
insert into tool values (1422, '����', 2800, '2016-10-10', 3);
insert into tool values (1399, '����', 50, '2016-10-30', 3);
insert into tool values (1380, '����', 50, '2016-10-30', 3);
insert into tool values (1381, '����', 50, '2016-10-30', 3);
insert into tool values (1382, '����', 50, '2016-10-30', 3);
insert into tool values (1383, '����', 50, '2016-10-30', 3);
insert into tool values (1384, '����', 50, '2016-10-30', 3);
insert into tool values (1385, '����', 50, '2016-10-30', 3);
insert into tool values (1386, '����', 50, '2016-10-30', 3);
insert into tool values (2012, '����', 200000, '2016-12-05', 3);
insert into tool values (553, '���ð�', 900000, '2017-01-02', 3);
insert into tool values (199, '��������', 750000, '2017-01-02', 3);
insert into tool values (3342, '����', 3500, '2016-10-09', 3);
insert into tool values (1642, '�������尩', 700, '2016-10-09', 3);
insert into tool values (1334, '�ֻ��', 500, '2016-10-10', 3);
insert into tool values (2001, '������', 500000, '2016-10-10', 3);
insert into tool values (427, '���������', 1500000, '2017-06-13', 3);
insert into tool values (501, '�κ���', 5000000, '2018-04-20', 3);
insert into tool values (273, 'ī�޶�', 1300000, '2018-04-20', 3);
insert into tool values (533, 'û����', 25000, '2016-10-10', 3);
insert into tool values (613, '����ũ', 500, '2016-10-10', 3);
insert into tool values (39, '�Ž�', 3000, '2016-10-10', 3);
insert into tool values (40, '�Ž�', 3000, '2016-10-10', 3);
insert into tool values (41, '�Ž�', 3000, '2016-10-11', 3);
insert into tool values (42, '�Ž�', 3000, '2016-10-11', 3);
insert into tool values (43, '�Ž�', 3000, '2016-10-12', 3);
insert into tool values (1423, '����', 2800, '2016-10-15', 3);
insert into tool values (1424, '����', 2800, '2016-10-15', 3);
insert into tool values (1425, '����', 2800, '2016-10-20', 3);
insert into tool values (3343, '����', 3500, '2016-10-15', 3);
insert into tool values (1643, '�������尩', 700, '2016-10-12', 3);
insert into tool values (1335, '�ֻ��', 500, '2016-10-13', 3);
insert into tool values (534, 'û����', 25000, '2016-10-10', 3);
insert into tool values (614, '����ũ', 500, '2016-10-10', 3);
insert into tool values (615, '����ũ', 500, '2016-10-11', 3);
insert into tool values (777, '�������ĵ�', 350000, '2016-12-1', 3);
insert into tool values (778, '�������ĵ�', 350000, '2016-12-1', 3);
insert into tool values (22, 'ȣ���', 200500, '2016-10-11', 3);
insert into tool values (23, '�ֻ��', 500, '2016-10-10', 3);
insert into tool values (24, 'ȣ���', 200500, '2016-10-12', 3);
insert into tool values (111, '�ߵ���', 50, '2016-10-10', 3);
insert into tool values (112, '�ߵ���', 50, '2016-10-10', 3);
insert into tool values (113, '�ߵ���', 50, '2016-10-10', 3);
insert into tool values (114, '�ߵ���', 50, '2016-10-10', 3);
insert into tool values (115, '�ߵ���', 50, '2016-10-10', 3);
insert into tool values (116, '�ߵ���', 50, '2016-10-10', 3);

insert into employee values (500, '��', '�ϲ�', '��õ��', '010-8484-1515', '�繫����', '2016-10-05', 3);
insert into employee values (501, '��', '�ϲ�', '�����', '010-5422-4312', '������', '2016-10-05', 3);
insert into employee values (502, '��', '�ϲ�', '��õ��', '010-1556-4385', '������', '2016-12-17', 3);
insert into employee values (503, '��', '�ϲ�', '�����', '010-3165-1022', '�繫����', '2017-02-07', 3);
insert into employee values (504, '��', '�ϲ�', '�����', '010-7844-7050', '�ǹ�����', '2016-10-05', 3);
insert into employee values (505, '��', '�ϲ�', '�����', '010-9533-1377', '�ǹ�����', '2018-02-11', 3);
insert into employee values (506, 'ȫ', '�ϲ�', '�λ��', '010-3301-1383', '�ü�����', '2016-10-05', 3);
insert into employee values (507, '��', '�ϲ�', '���ֽ�', '010-0054-1275', '�ü�����', '2018-03-02', 3);
insert into employee values (508, '��', '�ϲ�', '�λ��', '010-8962-1040', 'ȸ�����', '2017-10-05', 3);
insert into employee values (509, '��', '�ϲ�', '�ϻ��', '010-8403-0007', '�繫����', '2018-06-11', 3);
insert into employee values (510, '��', '�ϲ�', '�λ��', '010-1212-2383', 'ȸ�����', '2017-04-27', 3);
insert into employee values (511, '��', '�ϲ�', '�뱸��', '010-0270-3340', 'ȸ�����', '2018-05-08', 3);
insert into employee values (512, '��', '�ϲ�', '�뱸��', '010-3205-3078', '�ü�����', '2017-02-03', 3);
insert into employee values (513, '��', '�ϲ�', '�뱸��', '010-3780-3208', '�繫����', '2016-11-22', 3);
insert into employee values (514, '��', '�ϲ�', '�ϻ��', '010-9995-2248', '�ǹ�����', '2018-06-12', 3);
insert into employee values (515, 'Ȳ', '�ϲ�', '�����ֽ�', '010-1127-2044', 'ȸ�����', '2018-06-12', 3);

insert into doctor values (81, '��', '����', '�����', '10:00-18:00', '�����ܰ�', 1);
insert into doctor values (82, '��', '����', '�뱸��', '10:00-18:00', '����', 1);
insert into doctor values (83, '��', '����', '�뱸��', '12:00-20:00', '�̺����İ�', 1);
insert into doctor values (84, '��', '����', '������', '20:00-24:00', '�ܰ�', 1);
insert into doctor values (85, '��', '�ؿ�', '�����', '24:00-10:00', '�������а�', 1);
insert into doctor values (86, '��', '����', '�뱸��', '10:00-24:00', '�����ܰ�', 1);
insert into doctor values (87, '��', '�缱', '�����', '10:00-24:00', '��缱��', 1);
insert into doctor values (88, '��', '��Ȱ', '�λ��', '10:00-24:00', '��Ȱġ���', 1);
insert into doctor values (89, '��', '�Ʊ�', '��õ��', '10:00-18:00', '����ΰ�', 1);
insert into doctor values (90, '��', '����', '���ֽ�', '10:00-18:00', '�Ҿư�', 1);
insert into doctor values (91, '��', '����', '�����', '10:00-18:00', 'ġ��', 1);
insert into doctor values (92, '��', '����', '�뱸��', '12:00-20:00', '�ӻ󺴸���', 1);
insert into doctor values (93, '��', '����', '��õ��', '12:00-20:00', '�Ű��', 1);
insert into doctor values (94, '��', '����', '�����', '12:00-20:00', '���Ű�', 1);
insert into doctor values (95, '��', '����', '���ֽ�', '10:00-24:00', '�����', 1);

-- outpatient prescription
insert into prescription values (501, '17-04-12', '���ذŴ���', 5200, 2, 83);
insert into prescription values (502, '17-10-07', '�ƽ��Ǹ�1', 4800, 4, 82);
insert into prescription values (503, '17-12-20', '���ذŴ���', 5200, 6, 83);
insert into prescription values (504, '18-02-03', '������', 4400, 8, 83);
insert into prescription values (505, '18-03-08', '������', 4500, 10, 82);
insert into prescription values (506, '18-04-22', '�׿������׷��̵�', 6300, 12, 81);
insert into prescription values (507, '18-05-18', '�ƽ��Ǹ�2', 4900, 14, 82);
insert into prescription values (508, '18-05-19', '�ƽ��Ǹ�2', 4900, 16, 82);
insert into prescription values (509, '18-06-10', '�ƽ��Ǹ�1', 4800, 18, 82);
insert into prescription values (519, '18-06-10', '�׿������׷��̵�', 6300, 20, 81);
insert into prescription values (520, '18-06-11', 'Ŭ�δн�', 5300, 22, 91);
insert into prescription values (521, '18-06-12', '�Ƽ�Ʈ�ƹ̳���', 5700, 24, 90);
insert into prescription values (522, '18-06-13', '��Ȱġ����', 6000, 26, 88);
insert into prescription values (523, '18-06-14', '�˸�ƾ', 5900, 28, 92);
insert into prescription values (524, '18-06-14', '������', 4400, 30, 83);

-- inpatient prescription
insert into prescription values (510, '17-03-02', '�׿������׷��̵�', 6300, 1, 81);
insert into prescription values (511, '17-04-02', '�׻���', 4100, 3, 82);
insert into prescription values (531, '17-05-05', '�׻���', 4100, 3, 82);
insert into prescription values (512, '18-02-02', '������', 4400, 5, 83);
insert into prescription values (513, '18-03-02', '�׻���', 4100, 7, 82);
insert into prescription values (514, '18-05-12', '������', 4400, 9, 83);
insert into prescription values (515, '18-05-18', 'Ŭ�η����θ���', 23000, 11, 85);
insert into prescription values (516, '18-05-28', '�÷�Ÿ�̵�', 25000, 13, 85);
insert into prescription values (517, '18-06-10', '�ƽ��Ǹ�1', 4800, 15, 82);
insert into prescription values (518, '18-06-12', '�츣�ҵ�������', 4200, 17, 84);
insert into prescription values (525, '18-06-11', '�ǳ����׶��̵�', 16000, 19, 86);
insert into prescription values (526, '18-06-12', '��Ÿ��', 9200, 21, 94);
insert into prescription values (527, '18-06-12', '�׹�缱��', 6600, 23, 87);
insert into prescription values (528, '18-06-14', '�˻纸����', 8000, 25, 89);
insert into prescription values (529, '18-06-14', '�ҿ���', 4100, 27, 81);
insert into prescription values (530, '18-06-15', '�Ű������', 21000, 29, 93);

insert into surgery values (221, '���������', '17-04-29', '13:00-15:00', 10, '750000', 83);
insert into surgery values (222, '���������', '17-05-10', '13:00-15:00', 10, '750000', 83);
insert into surgery values (281, 'ô������������', '17-08-21', '10:00-13:00', 15, '1800000', 81);
insert into surgery values (264, '����̽ļ���', '18-06-12', '20:00-24:00', 10, '8000000', 84);
insert into surgery values (172, '������', '18-06-13', '11:00-14:00', 10, '1300000', 86);
insert into surgery values (123, '������', '18-06-14', '13:00-18:00', 10, '5500000', 94);
insert into surgery values (438, '�Ű����', '18-06-15', '14:00-19:00', 10, '3466000', 93);

insert into psurgery values (3,221);
insert into psurgery values (3,222);
insert into psurgery values (1,281);
insert into psurgery values (17,264);
insert into psurgery values (19,172);
insert into psurgery values (21,123);
insert into psurgery values (29,438);

insert into ward values (501, '2�ν�', '5F');
insert into ward values (502, '4�ν�', '6F');
insert into ward values (503, '4�ν�', '6F');
insert into ward values (504, '2�ν�', '5F');
insert into ward values (505, '2�ν�', '5F');
insert into ward values (506, '2�ν�', '5F');
insert into ward values (507, '2�ν�', '5F');
insert into ward values (508, '4�ν�', '6F');
insert into ward values (509, '4�ν�', '6F');
insert into ward values (510, '4�ν�', '6F');
insert into ward values (511, '4�ν�', '6F');
insert into ward values (512, '6�ν�', '7F');
insert into ward values (513, '6�ν�', '7F');
insert into ward values (514, '6�ν�', '7F');
insert into ward values (515, '6�ν�', '7F');

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

insert into bed values (5011, '����', 501, 1);
insert into bed values (5012, '����', 501, 3);
insert into bed values (5021, '����', 502, 5);
insert into bed values (5022, '����', 502, 7);
insert into bed values (5023, '����', 502, 9);
insert into bed values (5031, '����', 503, 13);
insert into bed values (5032, '����', 503, 15);
insert into bed values (5033, '����', 503, 17);
insert into bed values (5034, '����', 504, 19);
insert into bed values (5035, '����', 504, 21);
insert into bed values (5036, '����', 513, 23);
insert into bed values (5037, '����', 513, 25);
insert into bed values (5038, '����', 513, 27);
insert into bed values (5039, '����', 513, 29);

/***********************************************
            SELECT QUERY STATEMENT 
***********************************************/
/***********************************************
                QUERY DESIGN (DML)
***********************************************/

/* 1�� : 20�� ȯ�ڵ��� ȯ�ڹ�ȣ�� �̸�, ���̸� ǥ���Ͽ��� 
? 20�� ȯ�ڵ��� �̿���� �˾ƺ��� ���� */
select p_id, lname, fname, age from patient where age between 20 and 29;

/* 2�� : �������� ������� ���� ȯ�ڵ��� �̸��� ���ᳯ¥�� ��� ǥ���Ͽ��� 
? ���� ���������� ���� ȯ���� �̷��� ���� ���ؼ� */
select patient.lname, patient.fname, prescription.pdate
from patient, prescription, doctor
where patient.p_id = prescription.p_id 
and prescription.dr_id = doctor.dr_id
and specialty='����' and sex = '��';

/* 3�� :  ���� �达�� ȯ�ڰ� ���� �����̸��� ��¥, ȯ���� �̸�,���̸� ��ȸ�Ͽ��� 
? ���� �˰� �̸��� �� �� ���������� ��ȸ�ϱ� ���ؼ� */
select  sname, lname, fname, sdate, age from patient natural join inpatient natural join psurgery natural join surgery
where lname = '��';

/* 4�� : ���� �� 1ȸ �������� ���� ������ �̸��� ����ȸ���� ���ϰ� ȸ���� ������������ �����Ͽ���
? ���� ���� �� ���� �� �����ϴ� ������ ������� �˾ƺ��� ���ؼ� */
select tname, count(tname) as purchase_count from tool group by tname having count(tname) <> 1
order by purchase_count;

/* 5�� : ���� �� ��� ���� ���� ���� ������ �̸��� ������ ���Ͽ���
  ? ���� �籸�Ÿ� �� �� ��պ��� ���� ������ �������� ������ ��ü�� �������ϱ� ���ؼ� */
select tname, price from tool where price > (select avg(price) from tool) group by tname, price;

/* 6�� : ħ���� ���º��� ������ ���Ͽ���
  ? �� ħ���� ���°� � �������� �� ���� ���� ���ؼ� */
select condition, count(*) as bed_condition from bed group by condition;

/* 7�� :  first name�� '��'�� ���� ��� �� 18-06-01 ���Ŀ� �湮�� ����� �̸��� ���ᳯ¥, ó����̸��� ���Ͽ���
  ? �̸� �� �� ���ڸ� �˰� �ٸ� ������ �˰� ���� �� �˻��غ��� ���ؼ� */
select lname, fname, pdate, drug from patient, inpatient, prescription
where patient.p_id = inpatient.p_id and patient.p_id = prescription.p_id
and patient.fname like '%��%'
and pdate > '18-06-01';

/* 8�� : �ܷ�ȯ�ڵ��� �������, �湮����, �湮������ ȸ���� ���Ͽ���
  ? ���ο� �ǻ縦 ���� �� � �о߰� ���� �ʿ����� �˱� ���ؼ� */
select specialty, visitreason, count(patient.p_id) as num_of_visit from outpatient, patient, prescription, doctor
where outpatient.p_id = patient.p_id and patient.p_id = prescription.p_id and prescription.dr_id = doctor.dr_id
group by specialty, visitreason order by num_of_visit desc;

/* 9�� : �Կ�ȯ�ڵ��� �������, �����̸�, ������ ȸ���� ���Ͽ��� 
? ���ο� �ǻ縦 ���� �� � �о߰� ���� �ʿ����� �˱� ���ؼ� */
select specialty, sname, count(psurgery.s_id) as num_of_surgery from patient, inpatient, psurgery, surgery, doctor
where patient.p_id = inpatient.p_id and inpatient.p_id = psurgery.p_id and psurgery.s_id = surgery.s_id
and surgery.dr_id = doctor.dr_id group by specialty, sname order by num_of_surgery desc;

/* 10�� : 503ȣ�� ��ȣ�ϴ� ��ȣ���� ������ ��Ÿ����
? ������ ��ȣ�ϰ� �ִ� ��ȣ����� ���� �ִ��� �˾ƺ��� ���ؼ� */
select * from nurse where n_id in (select n_id from wcare where ward# = 503);

/* 11�� : �ǻ��ȣ, �̸�, �������, ����ߴ� �����̸��� �ǻ�ID���� ����ϱ�
? �ǻ簡 � ������ �����ߴ��� �ǻ��� ��¿� �ֱ� ���ؼ� */
select doctor.dr_id, lname, fname, specialty, sname from psurgery, surgery, doctor 
where psurgery.s_id = surgery.s_id and surgery.dr_id = doctor.dr_id
group by doctor.dr_id, lname, fname, specialty, sname order by dr_id;

/* 12�� : 2018�� 2�б��� ó��� ���� ����� �� ���ΰ�
  ? �б⺰ ó�� ��뿡 ���� ������ ����ϱ� ���ؼ� */
select sum(charge) as drug_sales from prescription where pdate between '18-04-01' and '18-06-30';

/* 13�� : A�� 2������ �ٹ��ϴ� ��� �� 2017/06/18 ���� ���� �ٹ��� ����� �̸��� ����, ��볯¥�� ���Ͽ���
  ? 1�� �̻� �ٹ��� �������� �������׸� �����ϱ� ���ؼ� */
select lname, fname, job, hiredate from department, administration, employee
where department.dept# = administration.adept# and administration.adept# = employee.adept#
and hiredate > '17-06-18';
