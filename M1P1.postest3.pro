/*****************************************************************************

		Copyright (c) 1984 - 2000 Prolog Development Center A/S

 Nama  : Triyanti Wafda Malini
 Nim   : 1515015049
 Kelas : A'2015
******************************************************************************/


PREDICATES
putra(STRING,STRING)			%putra memiliki 2 parameter dengan tipe data string
saudara_perempuan(STRING,STRING)	%saudara perempuan memiliki 2 parameter dengan tipe data string
saudara_laki(STRING,STRING)		%saudara laki juga memiliki 2 parameter dengan tipe data string
menikah(STRING,STRING)			%menikah memiliki 2 parameter dengan tipe data string
ayah(STRING ayah,STRING putra)		%ayah memiliki 2 parameter bertipe data string dimana satu untuk parameter ayah dan satu untuk parameter putra
kakek(STRING kakek,STRING cucu)		%kakek memiliki 2 parameter bertipe data string dimana satu untuk parameter kakek dan satu untuk parameter cucu
nondeterm ipar_perempuan(STRING,STRING)	%ipar perempuan memiliki 2 parameter dengan tipe data string
CLAUSES					%fakta dan aturan terdapat dibawah ini dimana :
putra("Ikhsan","Bentang").		%ikhsan adalah putra dari bentang
saudara_perempuan("Dini","Dina").	%Dini adalah saudara perempuan Dina
saudara_laki("Adi","Lintang").		%Adi adalah saudara laki lintang
menikah("Ikhsan","Dini").		%Ikhsan menikah dengan dini
menikah("Lintang","Surga").		%Lintang menikah dengan surga
ayah(A,B):-putra(B,A).			%dimana A adalah ayah dari B jika B putra dari A
kakek(A,B):-ayah(A,C), ayah(C,B).	%A adalah kakek B jika A adalah ayah C dan C adalah ayah B
ipar_perempuan(A,B):-menikah(A,C), saudara_perempuan(C,B).	%A ipar perempuan B jika A menikah dengan C dan C saudara perempuan B
ipar_perempuan(A,B):-saudara_laki(A,C), menikah(C,B).		%A ipar perempuan B jika A saudara laki C dan C menikah dengan B
GOAL
ipar_perempuan("Ikhsan",X).		%ipar perempuan ikhsan adalah ....
					%jawabannya adalah Dina karena ikhsan menikah dengan dini dan dini saudara perempuan dina