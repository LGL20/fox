* ��� �������� ������ ����� ��������� ��� EXE
* �������� �� ������ ������ ���������
	cProg=JUSTFNAME(sys(16))
	if Findprocess(cProg)>1
		messagebox('������� ����� ���������')
	endif
