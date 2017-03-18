/*****************************************************************************

		Copyright (c) 1984 - 2000 Prolog Development Center A/S

 Nama  : Triyanti Wafda Malini
 Nim   : 1515015049
 Kelas : A'2015
******************************************************************************/


DOMAINS
kali,jumlah = integer			%kali dan jumlah bertipe data integer

PREDICATES
tambahkan(jumlah,jumlah,jumlah)		%tambahkan memiliki 3 parameter dengan nama jumlah
kalikan(kali,kali,kali)			%kalikan memiliki 3 parameter dengan nama kali

CLAUSES
tambahkan(X,Y,Jumlah):-Jumlah=X+Y.	%X dan Y di jumlah jika jumlah sama dengan X tambah Y
kalikan(X,Y,Kali):-Kali=X*Y.		%X dan Y dikali jika kali sama dengan X kali Y

GOAL
tambahkan(32,54,Jumlah).		%tambahkan 32 dan 54 dan hasil jumlahnya sama dengan 32+54=86