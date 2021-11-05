create table kamar (
    id_kamar int auto_increment not null,
    jenis_kamar varchar(50),
    no_kamar char(3),
    primary key(id_kamar)
);

insert into kamar(jenis_kamar,no_kamar) values ("President Suite","12A");
insert into kamar(jenis_kamar,no_kamar) values ("VVIP A","1BC");
insert into kamar(jenis_kamar,no_kamar) values ("VVIP B","2D");
insert into kamar(jenis_kamar,no_kamar) values ("VIP A","3E");
insert into kamar(jenis_kamar,no_kamar) values ("VIP B","1AB");

create table dokter (
    id_dokter int auto_increment not null,
    nama varchar(100),
    no_telp char(12),
    spesialis varchar(50),
    primary key(id_dokter)
);

insert into dokter(nama,no_telp,spesialis) values ("'Abdullah","081423572471","Gigi");
insert into dokter(nama,no_telp,spesialis) values ("'Abdurrahman","081542664247","Anak");
insert into dokter(nama,no_telp,spesialis) values ("'Abdul Aziz","081333264325","Penyakit Dalam");
insert into dokter(nama,no_telp,spesialis) values ("Muhammad","081666775438","Saraf");
insert into dokter(nama,no_telp,spesialis) values ("Shalih","081246552341","Bedah");

create table perawat (
    id_perawat int auto_increment not null,
    id_dokter int,
    nama varchar(100),
    no_telp char(12),
    primary key(id_perawat),
    foreign key (id_dokter) references dokter(id_dokter)
);

insert into perawat(id_dokter,nama,no_telp) values (
    (select id_dokter
    from dokter
    where dokter.nama = "'Abdullah"),
    "Maryam", "081453545333"
);

insert into perawat(id_dokter,nama,no_telp) values (
    (select id_dokter
    from dokter
    where dokter.nama = "'Abdurrahman"),
    "Maria", "081987654323"
);

insert into perawat(id_dokter,nama,no_telp) values (
    (select id_dokter
    from dokter
    where dokter.nama = "'Abdul Aziz"),
    "Rifka", "08195837693"
);

insert into perawat(id_dokter,nama,no_telp) values (
    (select id_dokter
    from dokter
    where dokter.nama = "Muhammad"),
    "Sarah", "081345532452"
);

insert into perawat(id_dokter,nama,no_telp) values (
    (select id_dokter
    from dokter
    where dokter.nama = "Shalih"),
    "Khadijah", "081999087489"
);

create table obat (
    id_obat int auto_increment not null,
    id_dokter int,
    nama_obat varchar(100),
    jenis_obat varchar(50),
    primary key(id_obat),
    foreign key (id_dokter) references dokter(id_dokter)
);

insert into obat (id_dokter,nama_obat,jenis_obat) values (
    (select id_dokter
    from dokter
    where dokter.nama = "Shalih"),
    "Acarbose","Obat resep"
);

insert into obat (id_dokter,nama_obat,jenis_obat) values (
    (select id_dokter
    from dokter
    where dokter.nama = "Muhammad"),
    "Acetazolamide","Diuretik"
);

insert into obat (id_dokter,nama_obat,jenis_obat) values (
    (select id_dokter
    from dokter
    where dokter.nama = "'Abdul Aziz"),
    "Actifed","Obat bebas"
);

insert into obat (id_dokter,nama_obat,jenis_obat) values (
    (select id_dokter
    from dokter
    where dokter.nama = "'Abdurrahman"),
    "Acyclovir Tablet","Obat resep"
);

insert into obat (id_dokter,nama_obat,jenis_obat) values (
    (select id_dokter
    from dokter
    where dokter.nama = "'Abdullah"),
    "Adapalene","Obat resep"
);

create table pasien (
    id_pasien int auto_increment not null,
    id_kamar int,
    id_dokter int,
    nama varchar(100),
    jenis_kelamin char(2),
    alamat varchar(255),
    no_telp char(12),
    tgl_lahir date,
    keluhan_sakit varchar(255),
    primary key(id_pasien),
    foreign key (id_kamar) references kamar(id_kamar),
    foreign key (id_dokter) references dokter(id_dokter)
);

insert into pasien (id_kamar,id_dokter,nama,jenis_kelamin,alamat,no_telp,tgl_lahir,keluhan_sakit) values (
    (select id_kamar
    from kamar
    where no_kamar = "12A"),
    (select id_dokter
    from dokter
    where dokter.nama = "'Abdullah"),
    "Adam","M","Jl Ketapang Utr I/21, Dki Jakarta","081987687667","1967-01-20","Gingivitis"
);

insert into pasien (id_kamar,id_dokter,nama,jenis_kelamin,alamat,no_telp,tgl_lahir,keluhan_sakit) values (
    (select id_kamar
    from kamar
    where no_kamar = "1BC"),
    (select id_dokter
    from dokter
    where dokter.nama = "'Abdurrahman"),
    "Idris","M","Jl P Diponegoro 48 65314","081222999334","1975-04-22","Anak terkena Febris "
);

insert into pasien (id_kamar,id_dokter,nama,jenis_kelamin,alamat,no_telp,tgl_lahir,keluhan_sakit) values (
    (select id_kamar
    from kamar
    where no_kamar = "2D"),
    (select id_dokter
    from dokter
    where dokter.nama = "'Abdul Aziz"),
    "Yahya","M","Jl Jend Urip Sumoharjo 37-A 90232","081676555632","1966-11-02","Chronic kidney disease"
);

insert into pasien (id_kamar,id_dokter,nama,jenis_kelamin,alamat,no_telp,tgl_lahir,keluhan_sakit) values (
    (select id_kamar
    from kamar
    where no_kamar = "3E"),
    (select id_dokter
    from dokter
    where dokter.nama = "Muhammad"),
    "Dawud","M","JL Caman Raya No. 15 RT 008/0117412","081222334766","1977-07-13","Meningitis"
);

insert into pasien (id_kamar,id_dokter,nama,jenis_kelamin,alamat,no_telp,tgl_lahir,keluhan_sakit) values (
    (select id_kamar
    from kamar
    where no_kamar = "1AB"),
    (select id_dokter
    from dokter
    where dokter.nama = "Shalih"),
    "Sofiyah","F","Jl Dr H Abdullah Ahmad 15","081666757648","1987-12-12","Peritonitis"
);


create table administrasi (
    id_administrasi int auto_increment not null,
    id_pasien int,
    tgl_masuk date,
    tgl_keluar date,
    jumlah_bayar int unsigned,
    primary key(id_administrasi),
    foreign key (id_pasien) references pasien(id_pasien)
);

insert into administrasi (id_pasien,tgl_masuk,tgl_keluar,jumlah_bayar) values (
    ( select id_pasien
      from pasien
     where pasien.nama = "Adam"),
     "2020-09-11","2020-09-12",2000000
);

insert into administrasi (id_pasien,tgl_masuk,tgl_keluar,jumlah_bayar) values (
    ( select id_pasien
      from pasien
     where pasien.nama = "Idris"),
     "2019-01-22","2019-01-22",500000
);

insert into administrasi (id_pasien,tgl_masuk,tgl_keluar,jumlah_bayar) values (
    ( select id_pasien
      from pasien
     where pasien.nama = "Yahya"),
     "2018-03-10","2018-05-23",55000000
);

insert into administrasi (id_pasien,tgl_masuk,tgl_keluar,jumlah_bayar) values (
    ( select id_pasien
      from pasien
     where pasien.nama = "Dawud"),
     "2020-02-12","2020-07-23",15000000
);

insert into administrasi (id_pasien,tgl_masuk,tgl_keluar,jumlah_bayar) values (
    ( select id_pasien
      from pasien
     where pasien.nama = "Sofiyah"),
     "2017-01-13","2017-06-01",45000000
);

create table detail_obat (
    id_detail_obat int auto_increment not null,
    id_pasien int,
    id_obat int,
    dosis_obat varchar(50),
    primary key(id_detail_obat),
    foreign key (id_pasien) references pasien(id_pasien),
    foreign key (id_obat) references obat(id_obat)
);

insert into detail_obat(id_pasien,id_obat,dosis_obat) values (
    ( select id_pasien
      from pasien
     where pasien.nama = "Adam"),
    ( select id_obat
    from obat
    where jenis_obat = "Adapalene"),
    "4 kali sehari sebelum atau setelah makan"
);

insert into detail_obat(id_pasien,id_obat,dosis_obat) values (
    ( select id_pasien
      from pasien
     where pasien.nama = "Idris"),
    ( select id_obat
    from obat
    where jenis_obat = "Acyclovir Tablet"),
    "3 kali sehari sebelum makan"
);

insert into detail_obat(id_pasien,id_obat,dosis_obat) values (
    ( select id_pasien
      from pasien
     where pasien.nama = "Yahya"),
    ( select id_obat
    from obat
    where jenis_obat = "Actifed"),
    "2 kali sehari setelah makan"
);

insert into detail_obat(id_pasien,id_obat,dosis_obat) values (
    ( select id_pasien
      from pasien
     where pasien.nama = "Dawud"),
    ( select id_obat
    from obat
    where jenis_obat = "Acetazolamide"),
    "5 kali sehari sebelum atau setelah makan"
);

insert into detail_obat(id_pasien,id_obat,dosis_obat) values (
    ( select id_pasien
      from pasien
     where pasien.nama = "Sofiyah"),
    ( select id_obat
    from obat
    where jenis_obat = "Acarbose"),
    "2 kali sehari setelah makan"
);

create table pengobatan (
    id_pengobatan int auto_increment not null,
    id_pasien int,
    id_perawat int,
    rekam_medis varchar(100),
    primary key(id_pengobatan),
    foreign key (id_pasien) references pasien(id_pasien),
    foreign key (id_perawat) references perawat(id_perawat)
);

insert into pengobatan (id_pasien,id_perawat,rekam_medis) values (
   ( select id_pasien
      from pasien
     where nama = "Sofiyah"),
    (select id_perawat
     from perawat
     where perawat.nama = "Khadijah"),
     "Sembuh"
);

insert into pengobatan (id_pasien,id_perawat,rekam_medis) values (
   ( select id_pasien
      from pasien
     where nama = "Dawud"),
    (select id_perawat
     from perawat
     where perawat.nama = "Sarah"),
     "Sembuh"
);

insert into pengobatan (id_pasien,id_perawat,rekam_medis) values (
   ( select id_pasien
      from pasien
     where nama = "Yahya"),
    (select id_perawat
     from perawat
     where perawat.nama = "Rifka"),
     "Membaik"
);

insert into pengobatan (id_pasien,id_perawat,rekam_medis) values (
   ( select id_pasien
      from pasien
     where nama = "Idris"),
    (select id_perawat
     from perawat
     where perawat.nama = "Maria"),
     "Belum sembuh"
);

insert into pengobatan (id_pasien,id_perawat,rekam_medis) values (
   ( select id_pasien
      from pasien
     where nama = "Adam"),
    (select id_perawat
     from perawat
     where perawat.nama = "Maryam"),
     "Memburuk"
);