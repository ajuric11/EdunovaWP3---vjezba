use master;
go

drop database if exists lanachotela;
go

create database lanachotela collate Croatian_CI_AS;
go

--drop database lanachotela;
use lanachotela;

create table hotel(
sifra int not null primary key identity(1,1),
naziv varchar(50) not null,
mjesto varchar(50) not null,
gost int not null 
);

create table gost(
sifra int not null primary key identity(1,1),
ime varchar(50) not null,
prezime varchar(50) not null,
noæenje datetime,
soba int not null
);

create table djelatnik(
sifra int not null primary key identity(1,1),
ime varchar(50) not null,
prezime varchar(50) not null,
hotel int not null
);


create table soba(
sifra int not null primary key identity(1,1),
oznaka char(50) not null,
kapacitet varchar(50)
);


	Alter table djelatnik
	add foreign key (hotel) references hotel(sifra);

	Alter table gost
	add foreign key(soba) references soba(sifra);

	Alter table hotel
	add foreign key(soba) references soba(sifra);

