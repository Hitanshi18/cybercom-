USE Student_db;

CREATE TABLE world(
name varchar(256) PRIMARY KEY,
continent varchar(256),
area int,
population int,
gdp int(10)
);

insert into world
values('Afghanistan', 'Asia', '652230', '25500100', '2034300000');

insert into world
values('Albania', 'Europe', '28748', '2831741', '1296000000');

insert into world
values('Algeria', 'Africa', '2381741', '37100000', '188681000');

insert into world
values('Andorra', 'Europe', '468', '78115', ' 371200000');

insert into world
values('Angola', 'Africa', '1246700', '20609294', '100990000');

SELECT
    name, population, area
FROM
    world
WHERE
    area >= 3000000 OR population >= 25000000
;