DOMAINS
nama = orang(symbol,symbol) /* (Pertama , Kedua) */
hari_lahir = tanggal_lahir(integer,symbol,integer) /* (Hari, Bulan, Tahun) */
telepon = symbol /* Nomor telepon */

PREDICATES
nondeterm daftar_telepon(nama,symbol,hari_lahir)			%daftar telepon terdapat nama , symbol dan hari lahir
nondeterm yang_ulang_tahun_bulan_ini					%yang ulang tahun hari ini akan menjadi goal
konversi_bulan(symbol,integer)						%konversi bulan berisi parameter bertipe data symbol dan integer
cek_bulan_ulang_tahun(integer,hari_lahir)				%cek bulan ulang tahun yang berisi parameter integer dan hari lahir
cetak_orang(nama)							%cetak nama orang

CLAUSES
yang_ulang_tahun_bulan_ini:-						%yang ulang tahun hari ini jika
write("**** Daftar Orang Yang Ulang Tahun Bulan Ini ****"),nl,
write(" Nama Pertama\t\t Nama Kedua\n"),
write("******************************************************"),nl,
date(_, Bulan_ini, _), 							/* Ambil bulan pada sistem komputer */
daftar_telepon(Orang, _, Tanggal),					%daftar telpon terdapat nama orang dan tanggal
cek_bulan_ulang_tahun(Bulan_ini, Tanggal),				%cek bulan ulang tahun
cetak_orang(Orang),							%cetak nama orang
fail.									%memaksa backtracking
yang_ulang_tahun_bulan_ini:-						%yang ulang tahun bulan ini jika
write("\n\n Tekan sembarang tombol..."),nl,
readchar(_).
cetak_orang(orang(Pertama,Kedua)):-					%cetak orang pertama dan kedua jika
write(" ",Pertama,"\t\t\t ",Kedua),nl.
cek_bulan_ulang_tahun(Bul,tanggal_lahir(_,Bulan,_)):-			%cek bulan ulang tahun jika 
konversi_bulan(Bulan,Bulan1),						%konversi bulan menjadi bulan 1
Bul = Bulan1.
daftar_telepon(orang(erwin,effendy),"767-8463",tanggal_lahir(3,jan,1955)).		%daftar nama orang no telp dan tanggal lahir
daftar_telepon(orang(pramudya,kurniawan),"438-8400",tanggal_lahir(5,feb,1985)).
daftar_telepon(orang(kusdiar,prihatin),"555-5653",tanggal_lahir(3,mar, 1935)).
daftar_telepon(orang(ui,yansen),"767-2223",tanggal_lahir(29,apr,1951)).
daftar_telepon(orang(roland,hutagalung),"555-1212",tanggal_lahir(12,may,1962)).
daftar_telepon(orang(andi,nuruddin),"438-8400",tanggal_lahir(17,jun,1980)).
daftar_telepon(orang(syarif,musadek),"767-8463",tanggal_lahir(20,jun,1986)).
daftar_telepon(orang(lidya,widyawati),"555-5653",tanggal_lahir(16,jul,1981)).
daftar_telepon(orang(yusida,andriani),"767-2223",tanggal_lahir(10,aug,1981)).
daftar_telepon(orang(slamet,riyadi),"438-8400",tanggal_lahir(25,sep,1981)).
daftar_telepon(orang(nur,harjanto),"438-8400",tanggal_lahir(20,oct,1952)).
daftar_telepon(orang(dian,marlini),"555-1212",tanggal_lahir(9,nov,1984)).
daftar_telepon(orang(teguh,heni),"767-2223",tanggal_lahir(15,nov,1987)).
daftar_telepon(orang(eka,ardiyanti),"438-8400",tanggal_lahir(31,dec,1981)).
konversi_bulan(jan, 1).								%konversi bulan dari jan sampai des
konversi_bulan(feb, 2).
konversi_bulan(mar, 3).
konversi_bulan(apr, 4).
konversi_bulan(may, 5).
konversi_bulan(jun, 6).
konversi_bulan(jul, 7).
konversi_bulan(aug, 8).
konversi_bulan(sep, 9).
konversi_bulan(oct, 10).
konversi_bulan(nov, 11).
konversi_bulan(dec, 12).

GOAL
yang_ulang_tahun_bulan_ini.							%yang ulang tahun bulan ini adalah kusdiar dan prihatin karena mereka lahir di bulan maret