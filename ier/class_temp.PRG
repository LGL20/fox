if Used('classlib')
	Select classlib
else
	USE l:\lib\win\classlib.vcx IN 0 AGAIN ALIAS Classlib SHARED
endif
*Brow For Empty(parent) and !Empty(class) Fields;
	name = Left(ObjName,100):30

Brow Fiel;
	CLASS,;
	OBJNAME,;
	PARENT,;
	PROPERTIES,;
	PROTECTED,;
	METHODS,;
	OLE2,;
	RESERVED2,;
	RESERVED3,;
	RESERVED4,;
	RESERVED7;
	For PLATFORM#"COMMENT" and (ObjName='curyear' or parent='curyear')
Use
