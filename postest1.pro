/*****************************************************************************

		Copyright (c) 1984 - 2000 Prolog Development Center A/S

 Nama  : Triyanti Wafda Malini
 Nim   : 1515015049
 Kelas : A'2015
******************************************************************************/

domains
  jenis,warna,nama 	= symbol
  harga,umur		= integer
predicates
  nondeterm kucing(jenis,warna,harga)
  nondeterm owner(nama,jenis,umur)
clauses
  kucing(persia,putih,15000).
  kucing(flatnose,kuning,20000).
  kucing(peaknose,abu,30000).
  
  owner(ifa,flatnose,16).
  owner(bayu,flatnose,20).
  owner(aden,peaknose,35).
  owner(asa,persia,17).
  owner(oni,Jenis,10):- owner(asa,Jenis,17).

goal
  
  kucing(Kucing,putih,15000),
  owner(Nama_Owner,Kucing,10).
  
