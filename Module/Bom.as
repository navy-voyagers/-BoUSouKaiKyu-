//Player Bom Module
#module
#deffunc BomInit
	BOM_TOTAL=32
	ddim BomX,BOM_TOTAL
	ddim BomY,BOM_TOTAL
	ddim BomXChange,BOM_TOTAL
	ddim BomYChange,BOM_TOTAL
	dim BomHp,BOM_TOTAL
	dim BomExist,BOM_TOTAL
	return

#deffunc BomCalc
	cnt_t=0
	repeat BOM_TOTAL
	if BomExist(cnt)=1 {
		BomX(cnt)+=BomXChange(cnt)
		BomY(cnt)+=BomYChange(cnt)
		if BomX(cnt)<-30 or BomX(cnt)>670 {
			BomExist(cnt)=0
		}
		if BomY(cnt)<-30 or BomY(cnt)>510 {
			BomExist(cnt)=0
		}
		repeat BulletInfo(5,0)
		if BulletInfo(4,cnt)=1 {
			if LengthCheck(BulletInfo(0,cnt),BulletInfo(1,cnt),BomX(cnt_t),BomY(cnt_t))<900 {
				BulletDel cnt
				BomHp(cnt_t)--
			}
		}
		if Bullet2Info(4,cnt)=1 {
			if LengthCheck(Bullet2Info(0,cnt),Bullet2Info(1,cnt),BomX(cnt_t),BomY(cnt_t))<900 {
				Bullet2Del cnt
				BomHp(cnt_t)--
			}
		}
		loop
	}
	if BomHp(cnt)<=0 {
		BomExist(cnt)=0
	}
	cnt_t++
	loop
	return

#deffunc BomDraw
	repeat BOM_TOTAL
	if BomExist(cnt)=1 {
		color 200,200,255
		circle BomX(cnt)-30,BomY(cnt)-30,BomX(cnt)+30,BomY(cnt)+30
	}
	loop
	return

#deffunc BomSet double BomSetPrm1 , double BomSetPrm2 , double BomSetPrm3 , double BomSetPrm4
	//ƒxƒNƒgƒ‹•ÏŠ·
	repeat BOM_TOTAL
	if BomExist(cnt)=0 {
		BomX(cnt)=BomSetPrm1
		BomY(cnt)=BomSetPrm2
		BomXChange(cnt)=cos(deg2rad(BomSetPrm3))*BomSetPrm4
		BomYChange(cnt)=sin(deg2rad(BomSetPrm3))*BomSetPrm4
		BomHp(cnt)=30
		BomExist(cnt)=1
		break
	}
	loop
	return

#deffunc BomAutoSet
	repeat 5
	BomSet PlayerInfo(0)+15,PlayerInfo(1),cnt*30-60,30
	loop
	return

#global