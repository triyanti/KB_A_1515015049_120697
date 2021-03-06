/*****************************************************************************

		Copyright (c) 1984 - 2000 Prolog Development Center A/S

 Nama  : Triyanti Wafda Malini
 Nim   : 1515015049
 Kelas : A'2015
******************************************************************************/



DOMAINS
nama,jender,pekerjaan,benda,alasan,zat = symbol		%nama,jender,pekerjaan,benda,alasan dan zat bertipe data symbol
umur=integer						%umur bertipe data integer

PREDICATES
nondeterm orang(nama, umur, jender, pekerjaan)		%orang memiliki 4 parameter yaitu nama, umur, jender, dan pekerjaan
nondeterm selingkuh(nama, nama)				%selingkuh memiliki 2 parameter yaitu nama
terbunuh_dengan(nama, benda)				%terbunuh_dengan memiliki 2 parameter yaitu nama dan benda
terbunuh(nama)						%terbunuh memiliki 1 parameter nama
nondeterm pembunuh(nama)				%pembunuh juga memiliki 1 parameter nama
motif(alasan)						%motif memiliki 1 parameter alasan
ternodai(nama, zat)					%ternodai memiliki 2 paraneter yaitu nama dan zat
milik(nama, benda)					%milik memiliki 2 parameter yaitu nama dan benda
nondeterm cara_kerja_mirip(benda, benda)		%cara_kerja_mirip memiliki 2 parameter yaitu benda
nondeterm kemungkinan_milik(nama, benda)		%kemungkinan_milik memiliki 2 parameter yaitu nama dan benda
nondeterm dicurigai(nama)				%dicurigai memiliki parameter nama

/* * * Fakta-fakta tentang pembunuhan * * */
CLAUSES
orang(budi,55,m,tukang_kayu).				%budi adalah seorang laki-laki berumur 55 tahun memiliki pekerjaaan tukang kayu
orang(aldi,25,m,pemain_sepak_bola).			%aldi adalah seorang laki-laki berumur 25 tahun memiliki pekerjaan sebagai pemain sepak bola
orang(aldi,25,m,tukang_jagal).				%aldi adalah seorang laki-laki berumur 25 tahun memiliki pekerjaan sebagai tukang jagal
orang(joni,25,m,pencopet).				%joni adalah seorang laki-laki berumur 25 tahun memiliki pekerjaan sebagai pencopet

selingkuh(ina,joni).					%ina selingkuh dengan joni
selingkuh(ina,budi).					%ina selingkuh dengan budi
selingkuh(siti,joni).					%siti selingkuh dengan joni

terbunuh_dengan(siti,pentungan).			%siti terbunuh dengan pentungan
terbunuh(siti).						%siti terbunuh

motif(uang).						%uang adalah motif pembunuhan
motif(cemburu).						%cemburu adalah motif pembunuhan
motif(dendam).						%dendam adalah motif pembunuhan

ternodai(budi, darah).					%budi ternodai dengan darah
ternodai(siti, darah).					%siti ternodai dengan darah
ternodai(aldi, lumpur).					%aldi ternodai dengan lumpur
ternodai(joni, coklat).					%joni ternodai dengan coklat
ternodai(ina, coklat).

milik(budi,kaki_palsu).					%kaki palsu milik budi
milik(joni,pistol).					%pistol milik joni

/* * * Basis Pengetahuan * * */
cara_kerja_mirip(kaki_palsu, pentungan).		%cara kerja kaki palsu mirip dengan pentungan
cara_kerja_mirip(balok, pentungan).			%cara kerja balok mirip dengan pentungan
cara_kerja_mirip(gunting, pisau).			%cara kerja gunting mirip dengan pisau
cara_kerja_mirip(sepatu_bola, pentungan).		%cara kerja sepatu bola mirip dengan pentungan

kemungkinan_milik(X,sepatu_bola):-			%sepatu bola kemungkinan milik x jika x adalah orang yang bekerja sebagai pemain bola
orang(X,_,_,pemain_sepak_bola).

kemungkinan_milik(X,gunting):-				%kemungkinan gunting milik x jika x orang yang bekerja disalon
orang(X,_,_,pekerja_salon).

kemungkinan_milik(X,Benda):-				%kemungkinan benda milik x jika benda milik x
milik(X,Benda).

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* dicurigai semua orang yang memiliki senjata yang *
* kerjanya mirip dengan senjata penyebab siti terbunuh. *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * */
dicurigai(X):-						
terbunuh_dengan(siti,Senjata) ,				%x dapat dicurigai jika siti terbunuh dengan senjata dan benda memiliki cara kerja seperti senjata dan benda kemungkinan milik x
cara_kerja_mirip(Benda,Senjata) ,
kemungkinan_milik(X,Benda).
/* * * * * * * * * * * * * * * * * * * * * * * * * *
* dicurigai laki-laki yang selingkuh dengan siti. *
* * * * * * * * * * * * * * * * * * * * * * * * * */
dicurigai(X):-
motif(cemburu),						%x dicurigai jika cemburu merupakan motif pembunuhan dan x adalah seorang laki-laki dan siti selingkuh dengan x
orang(X,_,m,_),
selingkuh(siti,X).
/* * * * * * * * * * * * * * * * * * * * * * *
* dicurigai perempuan yang selingkuh dengan *
* laki-laki yang juga selingkuh dengan siti *
* * * * * * * * * * * * * * * * * * * * * * */
dicurigai(X):-
motif(cemburu),
orang(X,_,f,_),						%x dicurigai jika cemburu merupakan motif pembunuhan dan x adalah perempuan dan x selingkuh dengan laki-laki dan siti selingkuh dengan laki-laki
selingkuh(X,Lakilaki),
selingkuh(siti,Lakilaki).
/* * * * * * * * * * * * * * * * * * * * * * * * * * *
* dicurigai pencopet yang mempunyai motif uang. *
* * * * * * * * * * * * * * * * * * * * * * * * * * */
dicurigai(X):-
motif(uang),						%x dicurigai jika motifnya adalah uang dan x adalah seorang pencopet
orang(X,_,_,pencopet).

pembunuh(Pembunuh):-
orang(Pembunuh,_,_,_),
terbunuh(Terbunuh),
Terbunuh <> Pembunuh, /* Bukan bunuh diri */		%pembunuh adalah pembunuh jika pembunuh adalah orang dan terbunuh adalah terbunuh dan terbunuh bukan pembunuh 
dicurigai(Pembunuh),					%dan pembunuh dicurigai dan pembunuh ternodai zat dan terbunuh ternodai zat
ternodai(Pembunuh,Zat),
ternodai(Terbunuh,Zat).

GOAL
pembunuh(X).						%x adalah pembunuh


%budi adalah pembunuh karena dari fakta dan aturan yang ada menunjukkan jelas kalau budi membunuh siti dengan kaki palsu yang cara kerjanya mirip pentungan di karenakan motif cemburu 
%dan juga budi dan siti ternodai oleh zat yang sama yaitu darah