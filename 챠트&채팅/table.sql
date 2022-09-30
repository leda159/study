CREATE TABLE `customer` (
  `id` varchar(50) NOT NULL,
  `name` varchar(45) NOT NULL,
   PRIMARY KEY (`id`)
   );

CREATE TABLE `inbody` (
`id` varchar(50) NOT NULL,
`inbodydate` varchar(10) NOT NULL,
`weight` int NOT NULL,
`bone` int NOT NULL,
`bodyfat` int DEFAULT NULL,
`bodyper` int DEFAULT NULL,
PRIMARY KEY (`inbodydate`,`id`));

insert into customer values('hong','홍길동');
commit;

insert into inbody values ('hong','2022-04-06',82,50,60,70);
insert into inbody values ('hong','2022-04-14',100,80,90,100);
insert into inbody values ('hong','2022-05-10',60,30,20,90);
insert into inbody values ('hong','2022-07-10',30,70,50,60);
commit;