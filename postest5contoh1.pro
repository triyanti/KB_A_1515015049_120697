DOMAINS
orang = orang(nama,alamat)				%orang memiliki nama dan alamat
nama = nama(pertama,kedua)				%ada nama pertama dan nama kedua
alamat = alamat(jalan,kota_kab,propinsi)		%alamat terdiri dari jalan,kota,dan provinsi
jalan = jalan(nama_jalan,nomor)				%jalan memiliki nama jalan dan nomor
kota_kab,propinsi,nama_jalan = string			%kota, provinsi, dan nama jalan bertipe data string
pertama,kedua = symbol					%nama pertama dan kedua bertipe data symbol
nomor = integer						%nomor bertipe data integer

GOAL
P1 = orang(nama(diena,fatihah),				%P1 adalah dua nama orang yang memiliki alamat yg sama
alamat(jalan("Wijaya Kusuma", 12), "Berbah", "DIY")),
P1 = orang(nama(_,fatihah),Alamat),			%siapa yang beralamat sama dengan fatihah dan dimana alamatnya
P2 = orang(nama(nur,fatihah),Alamat),			%dimana alamat nur yang beralamat sama seperti fatihah
write("P1=",P1),nl,					%tulis P1 siapa (baris baru)
write("P2=",P2),nl.					%tulis P2 siapa (baris baru)