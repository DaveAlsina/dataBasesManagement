create table department
(
 dept_name varchar(20) not null, 
 building varchar(20),  
 budget int,
 primary key (dept_name)
);

create table instructor
(
 ID int not null, 
 name varchar(20), 
 dept_name varchar(20), 
 salary int,
 primary key (ID),
 foreign key (dept_name) 
    references department(dept_name)
); 

create table student
(
  ID integer not null,
  name varchar(50) not null,
  dept_name  varchar(20),
  tot_cred integer,
  primary key (ID),
  foreign key (dept_name)
    references department(dept_name)
);

create table advisor
(
  s_id integer not null,
  i_id integer,
  primary key (s_id),
  foreign key (s_id )
    references student(id),
  foreign key (i_id )
    references instructor(id)
);

create table course
(
  course_id varchar(7) not null,
  title varchar(40) not null,
  dept_name  varchar(20),
  credits integer,
  primary key (course_id),
  foreign key (dept_name)
    references department(dept_name)
);

create table prereq
(
  course_id varchar(7) not null,
  prereq_id varchar(7) not null,
  primary key (course_id, prereq_id),
  foreign key (course_id)
    references course(course_id),
  foreign key (prereq_id)
    references course(course_id)
);

create table classroom
(
 building varchar(20) not null,
 room_no integer not null, 
 capacity integer,
 primary key (building,room_no)
);

create table time_slot
(
  time_slot_id char(1) not null, 
  day char(1) not null,
  start_time time not null,
  end_time time,
  primary key(time_slot_id, day,start_time)
);

create table section
(
  course_id varchar(7) not null,
  sec_id integer not null,
  semester varchar(10), 
  year integer,
  building varchar(20), 
  room_no integer,
  time_slot_id char(1), 
  day char(1),
  start_time time,
  primary key (course_id, sec_id, semester, year),
  foreign key (course_id)
    references course(course_id),
  foreign key (building,room_no)
    references classroom(building,room_no),
  foreign key (time_slot_id,day,start_time)
    references time_slot(time_slot_id,day,start_time)
);

create table teaches
(
 ID integer not null,
 course_id varchar(7) not null,
 sec_id integer not null,
 semester varchar(10), 
 year integer,
 primary key(ID,course_id,sec_id,semester,year),
 foreign key (course_id, sec_id, semester, year)
    references section(course_id, sec_id, semester, year),
 foreign key (ID)
    references instructor(id)
);

create table takes
(
  ID integer not null,
  course_id varchar(7) not null,
  sec_id integer not null,
  semester varchar(10), 
  year integer,
  grade varchar(2),
   primary key(ID,course_id,sec_id,semester,year),
  foreign key (course_id, sec_id, semester, year)
    references section(course_id, sec_id, semester, year),
  foreign key (ID)
    references student(id)
);

