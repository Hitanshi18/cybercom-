USE Student_db;


create table people(
    Id int primary key auto_increment,
    Email varchar(255)
);

insert into people (Email) values ('john@example.com'),
('bob@example.com'),
('john@example.com');

select distinct Email from people