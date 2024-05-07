#module ItemModule
#deffunc ItemInit
	TOTAL=256
	dim ItemX,TOTAL
	dim ItemY,TOTAL
	dim ItemExist,TOTAL
	return

#deffunc ItemSet int ItemSetPrm1 , int ItemSetPrm2
	repeat TOTAL
	if ItemExist(cnt)=0 {
		ItemX(cnt)=ItemSetPrm1
		ItemY(cnt)=ItemSetPrm2
		ItemExist(cnt)=1
		break
	}
	loop
	return

#deffunc ItemMove
	repeat TOTAL
	if ItemExist(cnt)=1 {
		ItemX(cnt)--
		if ItemX(cnt)<-15 {
			ItemExist(cnt)=0
		}
	}
	loop
	return

#deffunc ItemDraw
	repeat TOTAL
	if ItemExist(cnt)=1 {
		pos ItemX(cnt)-3,ItemY(cnt)-3
		color 0,255,255
		boxf ItemX(cnt)-3,ItemY(cnt)-3,ItemX(cnt)+3,ItemY(cnt)+3
	}
	loop
	return

#defcfunc ItemHit
	Hit=0
	repeat TOTAL
	if ItemExist(cnt)=1 and (PlayerInfo(0)-ItemX(cnt))*(PlayerInfo(0)-ItemX(cnt))+(PlayerInfo(1)-ItemY(cnt))*(PlayerInfo(1)-ItemY(cnt))<9 {
		ItemExist(cnt)=0
		Hit+
	}
	loop
	return Hit

#global