/*****************************************************************************

		Copyright (c) 1984 - 2000 Prolog Development Center A/S

 Project:  
 FileName: CH07E03.PRO
 Purpose: 
 Written by: PDC
 Modifyed by: Eugene Akimov
 Comments: 
******************************************************************************/

domains
  list = integer* /* or whatever type you want to use */		%list bertipe data integer

predicates
  length_of(list,integer,integer) - procedure (i,o,i)			%length of berisi list dan dua integer

clauses
  length_of([], Result, Result).					%length of berisi list kosong dan dua variable result
  length_of([_|T],Result,Counter):-					%length of berisi list kosong serta T , variable result dan counter jika
	NewCounter = Counter + 1,					%new counter sama dengan counter di tambah 1 dan
	length_of(T, Result, NewCounter).				%length of berisi variable T ,  result, newcounter

goal
  length_of([1,2,3],L,0). /* start with Counter = 0 */			%dan memiliki goal length of memiliki parameter list 1 sampai 3 , L dan 0 dan hasilnya adalah 3