#module PlayerShotModule
#deffunc PlayerShotInit
	TOTAL=128
	dim PlayerShotX,TOTAL
	dim PlayerShotY,TOTAL
	dim PlayerShotExist,TOTAL
	return

#deffunc PlayerShotSet
	repeat TOTAL
	if PlayerShotExist(cnt)=0 {
		PlayerShotX(cnt)=PlayerInfo(0)+20
		PlayerShotY(cnt)=PlayerInfo(1)
		PlayerShotExist(cnt)=1
		break
	}
	loop
	return

#deffunc PlayerShotMove
	repeat TOTAL
	if PlayerShotExist(cnt)=1 {
		PlayerShotX(cnt)+8
		if PlayerShotX(cnt)>640 {
			PlayerShotExist(cnt)=0
		}
	}
	loop
	return

#deffunc PlayerShotDraw
	repeat TOTAL
	if PlayerShotExist(cnt)=1 {
		color 200,0,0
		boxf PlayerShotX(cnt)-4,PlayerShotY(cnt)-3,PlayerShotX(cnt)+4,PlayerShotY(cnt)+3
		color 255,200,200
		boxf PlayerShotX(cnt)-3,PlayerShotY(cnt)-2,PlayerShotX(cnt)+3,PlayerShotY(cnt)+2
	}
	loop
	return

#defcfunc PlayerShotInfo int PlayerShotInfoPrm1 , int PlayerShotInfoPrm2
	switch PlayerShotInfoPrm1
	case 0		//exist
	return PlayerShotExist(PlayerShotPrm2)

	case 1		//X
	return PlayerShotX(PlayerShotPrm2)
	
	case 2		//Y
	return PlayerShotY(PlayerShotPrm2)
	swend
	return "error"

#defcfunc PlayerShotHit int PlayerShotHitPrm1 , int PlayerShotHitPrm2 , int PlayerShotHitPrm3
	Hit=0
	repeat TOTAL
	if (PlayerShotX(cnt)-PlayerShotHitPrm1)*(PlayerShotX(cnt)-PlayerShotHitPrm1)+(PlayerShotY(cnt)-PlayerShotHitPrm2)*(PlayerShotY(cnt)-PlayerShotHitPrm2)<(PlayerShotHitPrm3*PlayerShotHitPrm3) and PlayerShotExist(cnt)=1 {
		Hit=1
		PlayerShotExist(cnt)=0
	}
	loop
	return Hit	//Hit‚µ‚Ä‚é‚È‚ç1A‚µ‚Ä‚È‚¢‚È‚ç0‚ª‹A‚è‚Ü‚·B

#global