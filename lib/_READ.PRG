Parameter single, object
Do pad_edi
Activate Window (m.pfp)
Do Case
Case (Type('m.noEdit')="L" and m.noEdit) or !CanSee("E")
	=inKey(0,'hm')
	Clear Gets
Case m.single
	Read
Otherwise
	do defa with m.object, 1
	object=Ltrim(Str(m.object))
	Read Cycle Object &object Activate _ac()
EndCase
Set Sysmenu off
Release Window (m.pfp)
Return .t.

Func _ac
	Set Sysmenu on
Return .t.
