#module Bullet
#deffunc BulletInit
	BULLET_TOTAL=1024

	ddim BulletX,BULLET_TOTAL
	ddim BulletY,BULLET_TOTAL
	ddim BulletXChange,BULLET_TOTAL
	ddim BulletYChange,BULLET_TOTAL
	dim BulletColorR,BULLET_TOTAL
	dim BulletColorG,BULLET_TOTAL
	dim BulletColorB,BULLET_TOTAL
	dim BulletExist,BULLET_TOTAL
	dim BulletSize,BULLET_TOTAL
	dmmload "res/se/shot.wav",10,0
	dmmvol 10,-2000
	return

#deffunc BulletReset
	repeat BULLET_TOTAL
	BulletX(cnt)=0.0
	BulletY(cnt)=0.0
	BulletXChange(cnt)=0.0
	BulletYChange(cnt)=0.0
	BulletExist(cnt)=0
	BulletColorR(cnt)=0
	BulletColorG(cnt)=127
	BulletColorB(cnt)=255
	BulletSize(cnt)=30
	loop
	return

#deffunc BulletColor int BulletColorPrm1 , int BulletColorPrm2 , int BulletColorPrm3
	repeat BULLET_TOTAL
	if BulletExist(cnt)=0 {
		BulletColorR(cnt)=BulletColorPrm1
		BulletColorG(cnt)=BulletColorPrm2
		BulletColorB(cnt)=BulletColorPrm3
	}
	loop
	return

#deffunc BulletSet double BulletSetPrm1 , double BulletSetPrm2 , double BulletSetPrm3 , double BulletSetPrm4 , int BulletSetPrm5
	BulletLog=0
	repeat BULLET_TOTAL
	if BulletExist(cnt)=0 {
		BulletX(cnt)=BulletSetPrm1
		BulletY(cnt)=BulletSetPrm2
		BulletXChange(cnt)=BulletSetPrm3
		BulletYChange(cnt)=BulletSetPrm4
		BulletSize(cnt)=BulletSetPrm5
		BulletExist(cnt)=1
		BulletLog=1
		dmmplay 10
		break
	}
	loop
	if BulletLog=0 {
		logmes "Too Many Bullet"
	}
	return

#deffunc BulletDel int BulletDelPrm1
	BulletExist(BulletDelPrm1)=0
	return

#deffunc BulletSpeedChange double BulletSpeedChangePrm1
	repeat BULLET_TOTAL
	if BulletExist(cnt)=1 {
		BulletXChange(cnt)=BulletXChange(cnt)*BulletSpeedChangePrm1
		BulletYChange(cnt)=BulletYChange(cnt)*BulletSpeedChangePrm1
	}
	loop
	return

#deffunc BulletMoveChange double BulletMoveChangePrm1 , double BulletMoveChangePrm2
	repeat BULLET_TOTAL
	if BulletExist(cnt)=1 {
		BulletXChange(cnt)=BulletMoveChangePrm1
		BulletYChange(cnt)=BulletMoveChangePrm2
	}
	loop
	return

#deffunc BulletMove
	player_x=PlayerInfo(0)
	player_y=PlayerInfo(1)

	repeat BULLET_TOTAL

	if BulletExist(cnt)=1 {
		BulletX(cnt)=double(BulletX(cnt)+BulletXChange(cnt))
		BulletY(cnt)=double(BulletY(cnt)+BulletYChange(cnt))
		if BulletY(cnt)>500 or BulletY(cnt)<-60 or BulletX(cnt)<-60 or BulletX(cnt)>700 {
			BulletExist(cnt)=0
		}
	}

	loop

	repeat BULLET_TOTAL
	if absf(player_x-BulletX(cnt))<BulletSize(cnt)/2 and absf(player_y-BulletY(cnt))<BulletSize(cnt)/2 and BulletExist(cnt)=1 {
		Miss_sw=1
		BulletExist(cnt)=0
	}
	loop
	return

#deffunc BulletReflect
	repeat BULLET_TOTAL
	if BulletExist(cnt)=1 {
		if BulletX(cnt)>640 {
			BulletXChange(cnt)=(-1.0)*BulletXChange(cnt)
		}
		if BulletY(cnt)<0 or BulletY(cnt)>480 {
			BulletYChange(cnt)=(-1.0)*BulletYChange(cnt)
		}
	}
	loop
	return

#deffunc BulletDraw
	repeat BULLET_TOTAL
	if BulletExist(cnt)=1 {
		if BulletY(cnt)>-30 and BulletY(cnt)<500 {
			color BulletColorR(cnt),BulletColorG(cnt),BulletColorB(cnt)
			circle BulletX(cnt)-(BulletSize(cnt)/2),BulletY(cnt)-(BulletSize(cnt)/2),BulletX(cnt)+(BulletSize(cnt)/2),BulletY(cnt)+(BulletSize(cnt)/2)
			color 127+(BulletColorR(cnt)/2),127+(BulletColorG(cnt)/2),127+(BulletColorB(cnt)/2)
			circle BulletX(cnt)-(BulletSize(cnt)/3),BulletY(cnt)-(BulletSize(cnt)/3),BulletX(cnt)+(BulletSize(cnt)/3),BulletY(cnt)+(BulletSize(cnt)/3)
			color 255,255,255
			circle BulletX(cnt)-(BulletSize(cnt)/4),BulletY(cnt)-(BulletSize(cnt)/4),BulletX(cnt)+(BulletSize(cnt)/4),BulletY(cnt)+(BulletSize(cnt)/4)
		}
	}
	loop
	return

#defcfunc BulletMiss		//ミスを知らせる関数
	if Miss_sw=1 {
		Miss_sw=0
		return 1
	}else{
		return 0
	}

#defcfunc BulletInfo int BulletInfoPrm1 , int BulletInfoPrm2
	if BulletInfoPrm2>BULLET_TOTAL {
		return "error"
	}
	switch BulletInfoPrm1
	case 0		//BulletX
	return BulletX(BulletInfoPrm2)

	case 1		//BulletY
	return BulletY(BulletInfoPrm2)

	case 2		//BulletXChange
	return BulletXChange(BulletInfoPrm2)

	case 3		//BulletYChange
	return BulletYChange(BulletInfoPrm2)

	case 4		//BulletExist
	return BulletExist(BulletInfoPrm2)

	case 5		//BULLET_TOTAL
	return BULLET_TOTAL

	swend

	return "error"

//BulletSetをベクトルで指定するプラグイン
#deffunc BulletSetVector double BulletSetVectorPrm1 , double BulletSetVectorPrm2 , double BulletSetVectorPrm3 , double BulletSetVectorPrm4 , double BulletSetVectorPrm5
	//BulletSetVector X,Y,スピード,角度,弾の大きさ
	BulletSet BulletSetVectorPrm1,BulletSetVectorPrm2,cos(deg2rad(BulletSetVectorPrm4))*BulletSetVectorPrm3,sin(deg2rad(BulletSetVectorPrm4))*BulletSetVectorPrm3,BulletSetVectorPrm5
	return

#global