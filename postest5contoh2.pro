DOMAINS
benda = buku(judul, pengarang) ;				%benda terdapat buku kuda kapal dan buku bank
kuda(nama) ; kapal ;
bukubank(saldo)
judul, pengarang, nama = symbol					%judul, pengarang, nama bertipe data symbol
saldo = real							%saldo bertipe data real

PREDICATES
nondeterm milik(nama,benda)					%nama memiliki benda

CLAUSES
milik(erwin, buku("Markesot Bertutur", "Emha Ainun Najib")).	%erwin memiliki buku
milik(erwin, kuda(buraq)).					%erwin juga memiliki kuda
milik(erwin, kapal).						%erwin pun memiliki kapal
milik(erwin, bukubank(1000)).					%dan erwin juga memiliki buku bank

GOAL
milik(erwin, Benda).						%erwin memiliki benda apa
								%erwin memiliki semua yang disebutkan diatas