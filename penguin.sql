create table korisnik(
korisnickoime varchar(20) not null,
sifra varchar(64) not null,
email varchar(30) not null,
ime nvarchar(30) not null,
prezime nvarchar(30) not null,
datumprijave date not null,
slika text,
constraint korisnik_pk primary key(korisnickoime)
);
create table profesor(
korisnickoime varchar(20) not null,
sifra varchar(64) not null,
email varchar(30) not null,
ime nvarchar(30) not null,
prezime nvarchar(30) not null,
zna int not null,
ocena decimal not null,
broj_ocena int not null,
constraint profesor_pk primary key(korisnickoime),
);
create table oblast(
id int not null,
imeoblasti_en varchar(15) not null,
imeoblasti_sr nvarchar(15) not null,
constraint oblast_pk primary key(id)
);
create table jezik(
id int not null,
jezik_en varchar(15),
jezik_sr nvarchar(15),
constraint jezik_pk primary key(id)
);
create table tezina(
tezina varchar(5),
constraint tezina_pk primary key(tezina)
);
create table kurs(
id int not null,
imekursa_en varchar(30) not null,
imekursa_sr nvarchar(30) not null,
oblast int not null,
tezina varchar(5),
jezik int,
constraint kurs_pk primary key(id),
constraint kurs_oblast_fk foreign key(oblast) references oblast(id),
constraint kurs_jezik_fk foreign key(jezik) references jezik(tezina)
);
create table imatezinu(
id int not null,
kurs int not null,
tezina varchar(5) not null,
constraint imatezinu_pk PRIMARY KEY(id),
constraint imatezinu_kurs_fk foreign key(kurs) references kurs(id),
constraint imatezinu_tezina_fk foreign key(tezina) references tezina(tezina)
);
create table ucionica(
id int not null,
ime_ucionice varchar(30) not null,
broj_mesta int not null,
kod_pristupa varchar(5) not null,
constraint ucionica_pk primary key(id)
);
create table pohadja(
id int not null,
profesor varchar(20) not null,
korisnik varchar(20) not null,
kurs int not null,
ucionica int not null,
datum_pocetka date not null,
datum_zavrsetka date not null,
CONSTRAINT pohadja_pk PRIMARY key(id),
constraint pohadja_profesor_fk foreign key(profesor) references profesor(korisnickoime),
constraint pohadja_korisnik_fk foreign key(korisnik) references korisnik(korisnickoime),
constraint pohadja_kurs_fk foreign key(kurs) references kurs(id),
constraint pohadja_ucionica_fk foreign key(ucionica) references ucionica(id)
);
create table zna(
id int not null,
profesor varchar(20) not null,
kurs int not null,
constraint zna_pk primary key(zna),
constraint zna_profesor_fk foreign key(profesor) references profesor(korisnickoime),
constraint zna_kurs_fk foreign key(kurs) references kurs(id),
);
create table kalendar(
id int not null,
vreme time not null,
datum date not null,
korisnik VARCHAR(20) not null,
profesor VARCHAR(20) not null,
kurs int not null,
constraint kalendar_pk primary key(id),
constraint kalendar_korisnik_fk foreign key(korisnik) REFERENCES korisnik(korisnickoime),
constraint kalendar_profesor_fk foreign key(profesor) REFERENCES profesor(korisnickoime)
);