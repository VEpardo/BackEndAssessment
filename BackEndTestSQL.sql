--1 . Create 2 data table in SQLExpress (SQL senteces)
--A- Countries  (ID int identity,Name varchar,Capital varchar,Population int,LanguageID int)
--B- Languages(ID int identity,Name varchar) foreing key

CREATE TABLE Languages (
  LanguageID   integer not null primary key,
  LanguageName  varchar(30) not null unique
);

CREATE TABLE Countries (
  CountryID    integer not null  primary key,
  CountryName  varchar(30) unique not null,
  CountryCapital  varchar(30) unique not null,
  CountryPopulation numeric(10) not null, 
  LanguageID integer references Languages(LanguageID)
);

--2. Insert 2 records in each table (SQL senteces)
insert into Languages values(1, 'Spanish');
insert into Languages values(2, 'English');

insert into Countries values(1, 'Mexico', 'Ciudad de Mexico', 9210000,1);
insert into Countries values(2, 'United States of America', 'Washington, D.C.', 328240000,2);

