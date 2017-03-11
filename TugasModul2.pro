/*****************************************************************************

		Copyright (c) 1984 - 2000 Prolog Development Center A/S

 Nama  : Triyanti Wafda Malini
 Nim   : 1515015049
 Kelas : A'2015
 Kecerdasan Buatan
 
******************************************************************************/

predicates
  nondeterm anak(symbol,symbol)
  istri (symbol,symbol)
  pria(symbol)
  nondeterm wanita(symbol)
  usia(symbol,integer)
  nondeterm cucu(symbol,symbol)
  nondeterm ibu(symbol,symbol)
  nondeterm adik (symbol,symbol)
  nondeterm kakek (symbol,symbol)
  
clauses
  cucu (X,Z) :-
  anak (X,Y) ,
  anak (Y,Z) .
  
  cucu (X,Y) :-
  	anak (X,W) ,
  	istri (W,Z) ,
  	anak (Z,Y).
  	
  ibu (X,Y) :-
  anak (Y,Z) ,
  wanita(X) ,
  pria (Z) ,
  istri (X,Z) .
  
  ibu (X,Y) :-
  	anak (Y,X) ,
  	wanita (X) .
  	
  adik (X,Y) :-
  	usia (X,10) ,
  	usia (Y,13) .
  	
  kakek (F,G) :-
  	anak (H,F) ,
  	anak (G,H) .
  	
  kakek (F,G) :-
  	anak(G,I) ,
  	istri (I,H) ,
  	anak (H,F) .
  
  anak (jhon,james) .
  anak (james,peter) .
  anak (sue,ann) .
  
  istri (mary,peter) .
  istri (ann,james) .
  
  pria (jhon) .
  pria (james) .
  pria (peter) .
  
  wanita (mary) .
  wanita (sue) .
  wanita (ann) .
  
  usia (john,10) .
  usia (sue,13) .
  
goal
  cucu (X,Y) ,
  ibu (A,B) ,
  adik (C,D) ,
  kakek (E,F) .
  