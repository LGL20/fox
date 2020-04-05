Priv c
Sele 17
Use dict Index dict
Loca for russ=m.dict
c=''
Defi Wind filt from 1,15 to 3,37;
	Titl ' Слoваpь ' Color ,w+/rb,w+/rb,w+/rb,,n/bg,gr+/rb
Defi Popu dict from 4,15 to 22,60 Marg Shad Prom Fiel;
	russ+'│ '+ukr Colo ,w+/rb,w+/rb,w+/rb,,n/bg,gr+/rb;
	Mess msg();
	Titl ' Рoссия ──────┬───── Укpаина '
On Sele Popu dict Do sl
On Key Labe F3 Do filt
Show Wind filt
Acti Popu dict Rest
Rele Wind filt
On Key Labe F3
Rele Popu dict
Use

Proc sl
	if realsl()
		dict=Rtri(russ)
		Deac Popu
	endi
Retu

Func filt
Priv ch
	Push Key Clea
	Acti Wind filt
	ch=m.c
	@ 0,0 Get c Size 1,20
	Read
	if Last()=27
		c=m.ch
	else
		c=Allt(c)
		if Empt(m.c)
			Set Filt to
		else
			Set Filt to m.c$russ
			if !m.c$russ
				Go Top
			endi
		endi
	endi
	Pop Key
Retu

Proc edi
	if Eof()
		Do add
	else
		Scat Memv
		Do edi1
		Gath Memv
	endi
Retu

Proc add
	Scat Memv Blan
	Do edi1
	if !Empt(m.russ+m.ukr)
		Appe Blan
		Gath Memv
	endi
Retu

Proc edi1
	Defi Wind red from 10,17 to 15,63 Shadow Foot aefoot();
		Titl ' Русский ─────────── Укpаинский ';
		Colo n/w,w+/b,b/w,b/w,b/w
	Acti Wind red NoShow
	@ 0, 1 Get m.russ
	@ 0,$+1 Say ':' Get m.ukr
	@ 2, 1 Say 'Род'
	@ 1, 5 Get m.gender Function '^ муж.;жен.;сред.'
	Acti Wind red
	Read
	Rele Wind red
	russ=Chrt(Ltri(m.russ), 'cpo', 'сро')
	ukr=Ltri(m.ukr)
Retu

Proc del
	if menu02(Rtri(russ)+' : '+Rtri(ukr),'Удалить')
		Dele
	endi
Retu
