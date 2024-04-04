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
gost int not null);

create table gost(
sifra int not null primary key identity(1,1),
ime varchar(50) not null,
prezime varchar(50) not null,
nocenje datetime,
soba int not null);

create table djelatnik(
sifra int not null primary key identity(1,1),
ime varchar(50) not null,
prezime varchar(50) not null,
hotel int not null);

create table soba(
sifra int not null primary key identity(1,1),
oznaka char(50) not null,
kapacitet varchar(50));

Alter table djelatnik
add foreign key (hotel) references hotel(sifra);

Alter table gost
add foreign key(soba) references soba(sifra);

Alter table hotel
add foreign key(soba) references soba(sifra);

insert into hotel (sifra, naziv, mjesto)
values (1,'Hotel1', 'Rijeka'), (2,'Hotel2', 'Osijek'), (3,'Hotel1', 'Zagreb');

insert into djelatnik (sifra, ime, prezime, hotel)
values (1,'pero','periæ', 1), (2,'ivo','iviæ', 2), (3,'marija','mariæ', 3);

insert into gost (sifra, ime, prezime, nocenje, soba)
values (1, 'Mate','Pernar', '2023-11-29 19:00:00', 1), (2,'Tomislav','Tomiæ', '2023-10-29 19:00:00', 5),
(3,'Mile','Miliæ', '2024-11-29 15:00:00', 4);

insert into soba (sifra, oznaka, kapacitet)
values (1,'1', 'jednokrevetna'), (2,'2', 'dvokrevetna'), (3,'3', 'jednokrevetna');