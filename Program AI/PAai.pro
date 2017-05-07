domains
kondisi=cond*
cond = string

facts
nondeterm pertanyaan(integer,symbol)
nondeterm jawab(integer,symbol)
anggota(kondisi)
false(cond)

predicates
nondeterm kuis(integer)
nondeterm main(integer,integer,integer,symbol,symbol,symbol)
nondeterm mulai
nondeterm credit
nondeterm kelompok(kondisi)
nondeterm db
nondeterm soal
nondeterm hasil(char)
nondeterm thanks
nondeterm setelahcredit
bb(char,char)

clauses
%=======CREDIT=======%
anggota(["Rado Gabriel F. L. 1515015051"]).
anggota(["Muhammad Budi Saputra 15150151072"]).
anggota(["Ressi Sartika 1515015092"]).

credit:-
	write("___________________________"),nl, anggota(Nama),
	kelompok(Nama),
	write("\n------------------------------------------------------"), nl,
	fail.

credit.

%=======PELENGKAP=======%
b-b(Y,Y):!.
bb(_,_):-fail.
hasil(B):-bb(B,'y'),mulai.
hasil(_):-thanks.
%=======LIST=======%
kelompok([H|T]):-
		not(false(H)),
		write(H),nl,
		kelompok(T).
kelompok([H|_]):-
		assertz(false(H)).
%=======MULAI=======%
mulai:-
	write("\n\t\t\t*************************************************************************************"),nl,
	write("\n\t\t\t+_+_+_+_SELAMAT  DATANG  DI  KUIS  CINTA  BANGSA  INDONESIA_+_+_+_+"),
	write("\n\t\t\t*************************************************************************************"),
	write("\n\nInformasi\n1. Credit"),
	write("\nMasuk Ke Kuis\n2. Kuis"),
	write("\nIngin Mengakhiri\n3. Keluar\n___________________________"),nl,
	write("Masukkan Pilihan Anda :"),
	readint(A),kuis(A).

kuis(A):-
A=1,
	credit,setelahcredit,
	write("Kembali Ke Menu Utama ?[y/n]"),nl,
	readchar(B), hasil(B);
A=2,
	db,
	soal;
A=3,
	write("Terima kasih :)\n"),!;
A<1,!;
A>3,!.
db:-
	consult("DB.mtr").

soal:-	
	Lifes=5,
	write("\n***********************************************************************"),nl,
	write("Anda Mendapatkan ",Lifes," Nyawa"),nl,
	write("Jawablah dengan menggunakan huruf kecil(inputan sensitif)\nAyo Coba Soal Yang Pertama!\n"),nl,	
	pertanyaan(No,Tanya),
	write(Tanya),nl,
	write("Masukkan Jawaban: "),
	readln(Jawaban),
	jawab(No,Kunci),
	main(Lifes,0,No,Tanya,Kunci,Jawaban).
soal.
main(_,Score,10,_,Kunci,Jawab):-
		Kunci=Jawab,Counts=Score+1,
		Scores=Counts*10,
		write("Selamat Anda Mendapatkan Nilai :",Scores),nl,
		write("Kembali Ke Menu Utama ?[y/n]"),nl,
		readchar(B), hasil(B).
		
main(1,Score,_,_,Kunci,Jawab):-Kunci<>Jawab,
		write("Maaf, Gagal Jawabannya Adalah ",Kunci),nl,
		Scores=Score*10,
		write("Anda Hanya Mendapatkan Nilai :",Scores),nl,
		write("\nKembali Ke Menu Utama ?[y/n]"),nl,
		readchar(B),hasil(B).
		
main(Life,Count,No,Tanya,Kunci,Jawab):-
	Kunci=Jawab,Counts=Count+1,
	Score=Counts*10,
	write("Jawaban Anda Benar"),nl,
	write("Nilai :",Score,"\n",Life," Nyawa Lagi\nBagus, Coba yang Satu Ini!\n"),nl,
	Nos=No+1,
	pertanyaan(Nos,Tanyas),
	write(Tanyas),nl,
	write("Masukkan Jawaban: "),
	readln(Jawaban),
	jawab(Nos,Kuncis),
	main(Life,Counts,Nos,Tanyas,Kuncis,Jawaban);
	
		Kunci<>Jawab,Lifes=Life-1,
		Score=Count*10,
		write("Jawaban Anda Salah, Yang Benar Adalah : ",Kunci),nl,
		write("Nilai :",Score,"\n",Lifes," Nyawa Lagi\nAyo, Coba Lagi!\n"),nl,
		Nos=No+1,
		pertanyaan(Nos,Tanyas),
		write(Tanyas),nl,
		write("Masukkan Jawaban: "),	
		readln(Jawabans),
		jawab(Nos,Kuncis),
		main(Lifes,Count,Nos,Tanyas,Kuncis,Jawabans).
		
thanks:-
   	write("\n**********************************************************************************************************"),
 	write("\n\t          TERIMA KASIH, ANDA TELAH MEMAINKAN KUIS CINTA BANGSA\n"),
	write("\t\t\t  KEEP SMART BOOOSSSQUUU\n"),
	write("\n**********************************************************************************************************\n"),
	write("Informasi\n1. Credit"),
	write("\nMasuk Ke Kuis\n2. Kuis"),
	write("\nIngin Mengakhiri\n3. Keluar\nMasukkan Pilihan Anda : "),
	readint(A),kuis(A).			
setelahcredit:-
	write("Informasi\n1. Credit"),
	write("\nMasuk Ke Kuis\n2. Kuis"),
	write("\nIngin Mengakhiri\n3. Keluar\nMasukkan Pilihan Anda : "),
	readint(A),kuis(A).	
goal 
mulai.