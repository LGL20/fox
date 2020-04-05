Para tx
tx=iif(Empty(m.tx), "o¤o¦¤¨β¥, ―o¦ «γ©αβ ", Trim(m.tx))
tx=iif(m.win, win(m.tx), m.tx)+" ..."
Set Colo of Sche 5 to w+/rb
Wait Wind m.tx NoWa
Set Colo of Sche 5 to
Return .t.
