--1 . Create 2 data table in SQLExpress (SQL senteces)
--A- Countries  (ID int identity,Name varchar,Capital varchar,Population int,LanguageID int)
--B- Languages(ID int identity,Name varchar) 

CREATE TABLE Languages (
  LanguageID   int primary key,
  LanguageName  varchar(30) not null unique
);

CREATE TABLE Countries (
  CountryID    integer  primary key,
  CountryName  varchar(30) unique not null,
  CountryCapital  varchar(30) unique not null,
  CountryPopulation numeric(10) not null, 
  CountryLanguage integer not null,
  FOREIGN KEY (CountryLanguage) references Languages(LanguageID)
);

--2. Insert 2 records in each table (SQL senteces)
insert into Languages values(1, 'Spanish');
insert into Languages values(2, 'English');

insert into Countries values(1, 'Mexico', 'Ciudad de Mexico', 9210000,1);
insert into Countries values(2, 'United States of America', 'Washington, D.C.', 328240000,2);
insert into Countries values(3, 'Spain', 'Barcelona', 751000,2);

--3. update the first record the population field by 250000 (SQL senteces) reemplazar el numero
update Countries
set CountryPopulation = 250000
where CountryID = 1;

--4. Delete countries with populations greater than 100,000 (SQL senteces)
Delete from Countries 
where CountryPopulation > 100000;

--5. Create SQLSentence  joining the 2 tables.
Select Countries.CountryName, Languages.LanguageName
from Countries
full outer join Languages on Countries.COUNTRYID=Languages.LANGUAGEID;

--6. Create SQL Sentence  grouping  by Languages.
Select Languages.LanguageName, Count(Countries.CountryName) as NumberOfCountries
from Countries
join Languages on Countries.COUNTRYID=Languages.LANGUAGEID
group by LanguageName;

--7. Create Store Procedures (Insert,Update,Delete,Select all) 
ALTER PROCEDURE Masterinsertupdatedelete 
            (CountryID    integer,
            CountryName  varchar(30),
            CountryCapital  varchar(30),
            CountryPopulation numeric(10), 
            CountryLanguage integer,
            @StatementType NVARCHAR(20) = '')

AS
  BEGIN
      IF @StatementType = 'Insert'
        BEGIN
            INSERT INTO Countries
                        (CountryID,
                         CountryName,
                         CountryCapital,
                         CountryPopulation,
                         CountryLanguage)
            VALUES     ( @CountryID,
                         @CountryName,
                         @CountryCapital,
                         @CountryPopulation,
                         @CountryLanguage)
        END

      IF @StatementType = 'Select'
        BEGIN
            SELECT *
            FROM   Countries
        END

      IF @StatementType = 'Update'
        BEGIN
            UPDATE Countries
            SET    CountryName = @CountryName,
                   CountryCapital = @CountryCapital,
                   CountryPopulation = @CountryPopulation,
                   CountryLanguage = @CountryLanguage
            WHERE  CountryID = @CountryID
        END
      ELSE IF @StatementType = 'Delete'
        BEGIN
            DELETE FROM Countries
            WHERE  CountryID = @CountryID
        END
  END
