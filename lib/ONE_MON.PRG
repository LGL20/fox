Parameter recalc, new_year, mail
Private i, rec, vs, m, NowYear, s, first, j,;
	podn_old, pens_old, kred_old, socs_old, prof_old,;
	vs_old, vspens_old, vsprof_old, EndMon, last_year, DateU, sele, done
Store 0 to n, u, nx, help_p, dolg, last_year, ChernV, podn_real,;
	podn_old, pens_old, kred_old, socs_old, prof_old,;
	vs_old, vspens_old, vsprof_old, pitsum, perc_sum, vd_
if !Used('wages')
	Use wages Order wages in (iif(m.win, 0, 6))
endif
Set Relation off into wages
Set Relation to m.tabn+m.mon into wages Additive
done=.f.
if !m.recalc
	if wages.tabn=m.tabn and wages.mon=m.mon
		vd=wages.sum
		vd_=wages.vd_
		vacation = wages.vacation
		done = .t.
	endif
endif
if !m.done
	Declare w[1]
	lgpic=''
	NowYear=moreyear(m.CurYear)
	if Used('zarp')
		Select zarp
		Set Order to tbn
	else
		Select (iif(m.win, 0, 1))
		Use zarp Order tbn
	endif
	rec=RecNo()
	Seek m.tabn
	mon_old=mon
	first=!m.new_year
	CurY=moreyear(m.CurYear)
	DateU=yearmon(m.DateUvol)
	last_mon='  '
	Do emptvar
	*Declare x[1,14]
	*Store 0 to x, n
	*nx=1
	*x[1,1]=m.mon
	*x[1,2]='  '
	*x[1,6]=''
	*Do While m.n<m.nx
	*	i=m.n
	*	n=aLen(x,1)
	*	for i=m.i+1 to m.n
	*		m=x[i,2]
	*		if m.m#'  '
	*			*Seek m.tabn
	*			*Scan While tabn=m.tabn For mon=m.m or for_mon=m.m
	*			Seek m.tabn+m.m
	*			Scan While tabn=m.tabn and mon=m.m
	*				nx=nx+1
	*				Declare x[m.nx, 14]
	*				x[m.nx, 1]=mon
	*				x[m.nx, 2]=for_mon			
	*			EndScan
	*		endif
	*	endfor
	*EndDo
	*nnn=m.nx
	*for nx=m.nx to 1 step -1
	*	Seek m.tabn+x[m.nx, 1]+x[m.nx, 2]
	Scan While tabn=m.tabn and mon<=m.mon
		if mon#m.mon_old
			i=m.dolg
			Do emptvar
			dolgud=m.i
		endi
		if m.first and mon=m.CurY
			first=.f.
			if !Used('corpodoh')
				Use corpodoh Index corpodoh in (iif(m.win, 0, 18))
			endif
			Set Relation off into corpodoh
			Set Relation to tabn into corpodoh Additive
			Store -corpodoh.sum to podn_old, last_year
		endif
		own=for_mon='  '
		with_kop=.f.
		for i=1 to m.nx
		*for i=m.nx+1 to m.nnn
			if iif(m.own, x[i,2]=mon,	x[i,1]=for_mon or x[i,2]=for_mon)
				s=x[i,3]+iif(x[i,2]>mon, 0, x[i,5])
				wk=x[i,1]<'e' or x[i,2]<'e'
				with_kop=m.with_kop or m.wk
				vs_old=m.vs_old+m.s-iif(m.wk, 0, x[i,12])
				vspens_old=m.vspens_old+iif(x[i,1]<'e', 0, m.s)
				vsprof_old=m.vsprof_old+iif(x[i,1]<'e', 0, x[i,7]+x[i,9])
				podn_old=m.podn_old+x[i,4]
				pens_old=m.pens_old+x[i,11]
				kred_old=m.kred_old+x[i,12]
				socs_old=m.socs_old+x[i,13]
				prof_old=m.prof_old+x[i,14]
			endif
		endfor
		tim=m.tim+tim
		sdel=m.sdel+sdel
		vrem=m.vrem+vrem
		premy=m.premy+premy
		boln=m.boln+boln
		help=m.help+help
		vyd=m.vyd+vyd
		ispoln=m.ispoln+ispoln
		pr=proch(mon, for_mon)
		proch=m.proch+m.pr
		pitanie=m.pitanie+m.PitSum
		otptek=m.otptek+otptek
		tek=m.tek+tek
		otp=m.otp+otp
		sled=m.sled+sled
		uvech=m.uvech+uvech
		compens=m.compens+compens
		vyxpos=m.vyxpos+vyxpos
		gift=m.gift+gift
		ChernVaca=m.ChernVaca+ChernVaca
		ChernV = m.ChernV + iif(mon<'e', ChernVaca, 0)
		vs=sdel+vrem+premy+boln+tek+otptek+m.pr+iif(vacation<chr(15), 0, otp+sled)
		help_podn=iif(mon>'e', 0,;
			iif(mon<'c' or mon>'d' or (m.sovm>0 and mon<='c'),;
			help, Max(0, help-m.zarphelp)))
		help_p=m.help_p+m.help_podn
		vs_podn=m.vs+m.help_podn-vyxpos-m.PitSum-uvech-gift;
			-iif(mon<'e', ChernVaca, 0)
		vs=m.vs+help
		Store 0 to pens_now, kred_now, socs_now, prof_now
		if mon<'e'
			pension=m.pension+pension
			kredit=m.kredit+kredit
			profsouz=m.profsouz+profsouz
			socstrah=0
		else
			s=Max(0, m.vs-vyxpos-m.PitSum-uvech-gift-iif(mon>'e', help, 0);
				+m.vspens_old)
			Do o0 with m.s, pens, m.pens_now, m.pens_old, m.pension
			s_bln=m.s-iif(mon<'e', 0, boln)
			if !(m.DateWP<mon;
			or (m.DateWP=mon and Right(m.DateWP, 1) < ''))
				Do o0 with m.s_bln, kred, m.kred_now, m.kred_old, m.kredit
			endif
			Do o0 with m.s_bln, cocs, m.socs_now, m.socs_old, m.socstrah
			if !m.sovm=4;
			and (Empty(m.DateUvol) or moreyear(Year(m.DateUvol));
			+chr(Month(m.DateUvol))>=mon)
				s=Max(0, m.s-boln+m.vsprof_old)
				Do o0 with m.s, prof, m.prof_now, m.prof_old, m.profsouz
			endif
		endif
		s=m.vs_podn+m.vs_old
		postanov = mon>'e' and mon<'e'
		if m.postanov
			s=m.s-m.kred_now
			if !m.with_kop
				s=Int(m.s)
			endif
		endif
		podn_now=podnalog(m.s)-m.podn_old;
			+iif(m.tabn='m' and mon='e', 1.87, 0)
		if m.postanov
			podn_real = m.podn_real;
				+ podnalog(m.vs_podn+m.vs_old)-m.podn_old - m.podn_now
		endif
		if mon='e' and m.podnalog+m.podn_now#0
			podn_now = m.podn_now + m.podn_real
		endif
		podnalog=m.podnalog+m.podn_now
		ud_pr=m.ud_pr+flat+tourist+reject+ud_pr+iif(for_mon='  ', m.dolgud, 0)
		n=m.sdel+m.vrem+m.premy+m.boln+m.tek+m.otptek+m.otp+m.sled+m.proch+m.help
		if !Used('alimony')
			Use alimony in (iif(m.win, 0, 16))
		endif
		Set Order to alimony in alimony
		Set Relation off into alimony
		Set Relation to tabn into alimony Additive
		if alimony.tabn#' '
			EndMon='.'+Str(asc(Right(mon,1)))+'.'+Str(asc(mon)+1900)
			EndMon=date83(CtoD(Str(days(CtoD('1'+m.EndMon)))+m.EndMon))
			*s = m.n-vyxpos-m.pitanie-m.uvech-m.gift-m.ChernV-m.podnalog-m.last_year
			s = m.vs_podn - m.last_year
			Select alimony
			Scan While tabn=m.tabn
				spouse=spouse
				r=0
				Scan While tabn=m.tabn and spouse=m.spouse;
				and (date='   ' or date<=m.EndMon)
					r=RecNo()
				EndScan
				if m.r>0
					Go m.r
					if !m.mail or !mail
						al=iif(part=0, m.s*percent*0.01, m.s/alimony.part)
						if mail
							=con_our(m.EndMon, .t.)
							*Select percent from postal Where date<m.EndMon;
							*	Order by date Descending into Cursor postal_
							Select (iif(m.win, 0, 4))
							Use postal Order 1
							Locate For date<m.EndMon
							al = m.al + m.al * percent*0.01 * (1 + asc(our.nalog)*0.01)
							Use
						endif
						alimony = m.alimony + m.al
						p=aScan(w, m.spouse)
						if m.p=0
							p=aLen(w)/2+1
							Declare w[p,2]
							w[p,1]=m.spouse
							w[p,2]=m.al
						else
							p=aSub(w, m.p, 1)
							w[p,2]=w[p,2]+m.al
						endif
					endif
				endif
			EndScan
			alimony = Round(m.alimony, 2)
			last_year=0
			Select zarp
		endif
		u=m.vyd+m.podnalog+m.kredit+m.profsouz+m.ud_pr+m.pension+m.ispoln+m.alimony+m.socstrah
		vd_ = Max(0, m.n-m.u+m.vyd)
		dolg=Max(m.u-m.n, 0)
		nx=nx+1
		Declare x[nx, 14]
		x[nx,1]=mon
		x[nx,2]=for_mon
		x[nx,3]=m.vs_podn
		x[nx,4]=m.podn_now
		x[nx,5]=iif(vacation>=chr(15), 0, otp+sled)
		x[nx,6]=m.lgpic
		x[nx,7]=help+compens
		x[nx,8]=pension
		x[nx,9]=boln
		x[nx,10]=ChernVaca-m.help_podn-compens
		x[nx,11]=m.pens_now
		x[nx,12]=m.kred_now
		x[nx,13]=m.socs_now
		x[nx,14]=m.prof_now
		mon_old=mon
		Store 0 to podn_old, pens_old, kred_old, socs_old, prof_old,;
			vs_old, vspens_old, vsprof_old
		last_mon = mon
	EndScan
	*endfor
	=GoRec(m.rec)
	if m.last_mon#m.mon
		i=m.dolg
		Do emptvar
		dolgud=m.i
	endif
	vd=Max(0, Roun(m.n-m.u, m.rnd))
	vacation = m.otptek + m.otp + m.tek + m.sled + m.boln
	if !(wages.tabn=m.tabn and wages.mon=m.mon)
		sele=Select()
		Select wages
		Append Blank
		Gath Memv
		Select (m.sele)
	endif
	Replace wages.sum with m.vd, wages.vd_ with m.vd_
endif
Set Relation off into wages
Return .t.

Proc o0
Parameter s, a, now, old, sbor
Private k, j, n, min
	n=aLen(a)/3
	if Type('a')="N" and m.n>0
		k=1
		min=-1
		for j=2 to m.n
			if a[j,2]=0
				min=a[j,1]
			else
				if a[j,1]<m.s and a[j,3]<=m.mon
					k=m.j
				endif
			endif
		endfor
		now=Round(iif(m.min<0, m.s, Min(m.s, m.min))*a[m.k, 2], 2)-m.old
		sbor=m.sbor+m.now
		perc_sum = m.perc_sum + a[m.k, 2]
	endif
Return