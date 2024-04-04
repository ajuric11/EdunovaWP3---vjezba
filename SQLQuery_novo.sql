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
values (1,&#39;Hotel 1&#39;,&#39;Rijeka&#39;), (2,&#39;Hotel 2&#39;,&#39;Osijek&#39;), (3,&#39;Hotel 3&#39;, &#39;Zagreb&#39;);

insert into djelatnik (sifra, ime, prezime, hotel)
values (1,&#39;Pero&#39;,&#39;Periæ&#39;, 1), (2,&#39;Ivo&#39;,&#39;Iviæ&#39;, 2), (3,&#39;Marija&#39;, &#39;Mariæ&#39;, 3);

insert into gost (sifra, ime, prezime, nocenje, soba)
values (1,&#39;Mate,&#39;Pernar&#39;, &#39;2023-11-29 19:00:00&#39;, 1), (2,&#39;Tomislav&#39;,&#39;Tomiæ&#39;, &#39;2023-10-29 10:00:00&#39;, 5),
(3,&#39;Mile&#39;, &#39;Miliæ&#39;, &#39;2023-11-29 19:00:00&#39;, 4);

insert into soba (sifra, oznaka, kapacitet)
values (1,&#39;1&#39;,&#39;jednokrevetna&#39;), (2,&#39;2&#39;,&#39;dvokrevetna&#39;), (3,&#39;3&#39;,&#39;jednokrevetna&#39;);