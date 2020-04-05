Return iif(Type('id')="U", iif(Type('code')="U",;
	Left(m.base,1)+'_no', 'code'), 'id')
