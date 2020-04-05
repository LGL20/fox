Private p, y
p=Set('Path')
y=Str(m.CurYear, 4)
y=m.y+';m:\fox\'+m.MainProgram+'\'+m.y+';m:\fox\common\'+m.y+';m:\fox\common;'
Set Path to (Stuff(m.p, 1, sign(Val(m.p))*Len(m.y), m.y))
