#module Boss
#deffunc BossInit
	BOSS_TOTAL=8

	dim BossX,BOSS_TOTAL
	dim BossY,BOSS_TOTAL
	dim BossXNow,BOSS_TOTAL
	dim BossYNow,BOSS_TOTAL
	dim BossXChange,BOSS_TOTAL
	dim BossYChange,BOSS_TOTAL
	dim BossSpeed,BOSS_TOTAL
	dim BossExist,BOSS_TOTAL
	dim BossHp,BOSS_TOTAL
	dim BossSize,BOSS_TOTAL
	dim BossMoveSw,BOSS_TOTAL

	sdim BossPic,1024,BOSS_TOTAL
	dim BossPicBuffer,BOSS_TOTAL

	dim BossColorR,BOSS_TOTAL
	dim BossColorG,BOSS_TOTAL
	dim BossColorB,BOSS_TOTAL

;	BossPicture—p‚ÌBuffer
;	repeat BOSS_TOTAL
;	buffer cnt+1
;	loop

	gsel 0,0

	return

#deffunc BossReset
	repeat BOSS_TOTAL
	BossExist(cnt)=0
	BossX(cnt)=0
	BossY(cnt)=0
	BossXNow(cnt)=0
	BossYNow(cnt)=0
	BossXChange(cnt)=0
	BossYChange(cnt)=0
	BossSpeed(cnt)=0
	BossMoveSw(cnt)=0
	BossHp(cnt)=0
	BossSize(cnt)=0

;	BossPic(cnt)=""
;	BossPicBuffer(cnt)=0

	BossColorR(cnt)=0
	BossColorG(cnt)=0
	BossColorB(cnt)=0

	loop
	return

;#deffunc BossPicSet str BossPicSetPrm1 , int BossPicSetPrm2
;	BossPic(BossPicSetPrm2)=BossPicSetPrm1
;	return

;#deffunc BossPicLoad
;	repeat BOSS_TOTAL
;	if BossPic(cnt)!"" {
;		gsel BossPicBuffer(cnt),0
;		picload BossPic(cnt)
;	}
;	loop
;	gsel 0,0
;	return

#deffunc BossColor int BossColorPrm1 , int BossColorPrm2 , int BossColorPrm3
	repeat BOSS_TOTAL
	if BossExist(cnt)=0 {
		BossColorR(cnt)=BossColorPrm1
		BossColorG(cnt)=BossColorPrm2
		BossColorB(cnt)=BossColorPrm3
		break
	}
	loop
	return

#deffunc BossSet int BossSetPrm1 , int BossSetPrm2 , int BossSetPrm3 , int BossSetPrm4 , int BossSetPrm5
	repeat BOSS_TOTAL
	if BossExist(cnt)=0 {
		BossX(cnt)=BossSetPrm1
		BossY(cnt)=BossSetPrm2
		BossXNow(cnt)=BossSetPrm1
		BossYNow(cnt)=BossSetPrm2
		BossHp(cnt)=BossSetPrm3
		BossSpeed(cnt)=BossSetPrm4
		BossSize(cnt)=BossSetPrm5
		BossExist(cnt)=1
		break
	}
	loop
	return

#deffunc BossReplace int BossReplacePrm1 , int BossReplacePrm2 , int BossReplacePrm3
	if BossExist(BossReplacePrm1)=1 {
		BossX(BossReplacePrm1)=BossReplacePrm2
		BossY(BossReplacePrm1)=BossReplacePrm3
	}else{
		logmes "No Object:BossReplace"+BossReplacePrm1
	}
	return

#deffunc BossMove
	repeat BOSS_TOTAL
	if BossExist(cnt)=1 {
		if abs(BossX(cnt)-BossXNow(cnt))>=BossSpeed(cnt) {
			if BossXNow(cnt)-BossX(cnt)>0 {
				BossXNow(cnt)-BossSpeed(cnt)
			}else{
				BossXNow(cnt)+BossSpeed(cnt)
			}
		}
		if abs(BossY(cnt)-BossYNow(cnt))>=BossSpeed(cnt) {
			if BossYNow(cnt)-BossY(cnt)>0 {
				BossYNow(cnt)-BossSpeed(cnt)
			}else{
				BossYNow(cnt)+BossSpeed(cnt)
			}
		}
		//ƒ{ƒX‚ÌHp‰‰ŽZ
		if PlayerShotHit(BossXNow(cnt),BossYNow(cnt),BossSize(cnt))=1 {
			BossHp(cnt)-
		}
		if BossHp(cnt)<=0 {
			BossExist(cnt)=0
		}
	}
	loop
	return

#deffunc BossDraw
	repeat BOSS_TOTAL
	if BossExist(cnt)=1 {
		color BossColorR(cnt),BossColorG(cnt),BossColorB(cnt)
		circle BossXNow(cnt)-BossSize(cnt),BossYNow(cnt)-BossSize(cnt),BossXNow(cnt)+BossSize(cnt),BossYNow(cnt)+BossSize(cnt)
		color BossColorR(cnt)/2,BossColorG(cnt)/2,BossColorB(cnt)/2
		circle BossXNow(cnt)-BossSize(cnt),BossYNow(cnt)-BossSize(cnt),BossXNow(cnt)+BossSize(cnt),BossYNow(cnt)+BossSize(cnt)
		color 64,0,0
		circle BossXNow(cnt)-BossSize(cnt)/3,BossYNow(cnt)-BossSize(cnt)/3,BossXNow(cnt)+BossSize(cnt)/3,BossYNow(cnt)+BossSize(cnt)/3
		color 255,0,0
		boxf 0,0,(BossInfo(0,cnt)/5),10
	}
	loop
	return

#defcfunc BossInfo int BossInfoPrm1 , int BossInfoPrm2
	if BossInfoPrm1>=0 or BossInfoPrm1<BOSS_TOTAL {
		switch BossInfoPrm2
		case 0		//BossHp
		return BossHp(BossInfoPrm1)

		case 1		//BossMoveSw
		return BossMoveSw(BossInfoPrm1)

		case 2		//BossSize
		return BossSize(BossInfoPrm1)

		case 3		//BossXNow
		return BossXNow(BossInfoPrm1)

		case 4		//BossYNow
		return BossYNow(BossInfoPrm1)

		swend
	}
	return "error"

#global