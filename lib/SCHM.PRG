*	靈컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*	�	�췅쳍（嶺o 歲飡�Лo� Schem(color, number)		�
*	�	줼㎖�좈젰� 歟βo㏂� 캙說 �� ��誓Д�춐� m.color	�
*	�													�
*	�	n-춐Д� 歟βo줼� 캙贍 							�
*	聃컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
Para color, n
Priv p,r
if Type('m.n')='L'
	n=1
	p=0
else
	if m.n=1
		p=0
	else
		p=At(',',m.color, m.n-1)
		if m.p=0
			Retu m.color
		endi
	endi
endi
r=At(',',m.color, m.n)-1
if m.r=-1
	r=Len(m.color)
endi
Retu Subs(m.color, m.p+1, m.r-m.p)
