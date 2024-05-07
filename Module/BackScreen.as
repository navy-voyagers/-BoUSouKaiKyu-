#module BackScreenModule
#deffunc BackScreenInit
	//‰Šú‰»‚ŸB‚±‚ê‚ð“ü‚ê–Y‚ê‚é‚Æ(‚à‚ê‚È‚­)ƒoƒO‚è‚Ü‚·()
	dim BackScreenX,16
	dim BackScreenY,16
	dim BackScreenXChange,16
	dim BackScreenYChange,16
	return

#deffunc BackScreenLoad str BackScreenLoadPrm1 , int BackScreenLoadPrm2
	//ˆê”Ô–Ú‚É”wŒi‰æ‘œ‚ÌƒpƒX–¼A“ñ”Ô–Ú‚Í•`‰ææƒoƒbƒtƒ@‚ÌÝ’è
	buffer BackScreenLoadPrm2
	picload BackScreenLoadPrm1
	gsel 0,0
	return

#deffunc BackScreenMoveSet int BackScreenMoveSetPrm1 , int BackScreenMoveSetPrm2 , int BackScreenMoveSetPrm3
	//ˆê”Ô–Ú‚ª”wŒi”Ô†A“ñ”Ô–Ú‚ÆŽO”Ô–Ú‚Ìƒpƒ‰ƒ[ƒ^‚ªX,YÀ•W’l
	BackScreenXChange(BackScreenMoveSetPrm1)=BackScreenMoveSetPrm2
	BackScreenYChange(BackScreenMoveSetPrm1)=BackScreenMoveSetPrm3
	return

#deffunc BackScreenMove int BackScreenMovePrm1
	//”wŒiˆÚ“®ŽÀs
	BackScreenX(BackScreenMovePrm1)=BackScreenX(BackScreenMovePrm1)+BackScreenXChange(BackScreenMovePrm1)
	BackScreenY(BackScreenMovePrm1)=BackScreenY(BackScreenMovePrm1)+BackScreenYChange(BackScreenMovePrm1)
	if abs(BackScreenX(BackScreenMovePrm1))>640 {
		BackScreenX(BackScreenMovePrm1)=0
	}
	if abs(BackScreenY(BackScreenMovePrm1))>480 {
		BackScreenY(BackScreenMovePrm1)=0
	}
	return

#deffunc BackScreenDraw int BackScreenDrawPrm1
	//Žw’è‚µ‚½”wŒi‚Ì‰æ‘œ‚ð‚Ñ‚å[‚ª‚µ‚Ü‚·B(”wŒi”Ô†‚ÅŽw’è‚µ‚ ‚ª‚êA‚±‚Ìƒ„ƒ[())
	pos BackScreenX(BackScreenDrawPrm1),BackScreenY(BackScreenDrawPrm1)
	gcopy BackScreenDrawPrm1,0,0,640,480
	if BackScreenX(BackScreenDrawPrm1)>0 {
		pos BackScreenX(BackScreenDrawPrm1)-640,BackScreenY(BackScreenDrawPrm1)
		gcopy BackScreenDrawPrm1,0,0,640,480
	}
	if BackScreenX(BackScreenDrawPrm1)<0 {
		pos BackScreenX(BackScreenDrawPrm1)+640,BackScreenY(BackScreenDrawPrm1)
		gcopy BackScreenDrawPrm1,0,0,640,480
	}
	if BackScreenY(BackScreenDrawPrm1)>0 {
		pos BackScreenX(BackScreenDrawPrm1),BackScreenY(BackScreenDrawPrm1)-480
		gcopy BackScreenDrawPrm1,0,0,640,480
	}
	if BackScreenY(BackScreenDrawPrm1)<0 {
		pos BackScreenX(BackScreenDrawPrm1),BackScreenY(BackScreenDrawPrm1)+480
		gcopy BackScreenDrawPrm1,0,0,640,480
	}
	if BackScreenX(BackScreenDrawPrm1)>0 and BackScreenY(BackScreenDrawPrm1)>0 {
		pos BackScreenX(BackScreenDrawPrm1)-640,BackScreenY(BackScreenDrawPrm1)-480
		gcopy BackScreenDrawPrm1,0,0,640,480
	}
	if BackScreenX(BackScreenDrawPrm1)<0 and BackScreenY(BackScreenDrawPrm1)>0 {
		pos BackScreenX(BackScreenDrawPrm1)+640,BackScreenY(BackScreenDrawPrm1)-480
		gcopy BackScreenDrawPrm1,0,0,640,480
	}
	if BackScreenX(BackScreenDrawPrm1)>0 and BackScreenY(BackScreenDrawPrm1)<0 {
		pos BackScreenX(BackScreenDrawPrm1)-640,BackScreenY(BackScreenDrawPrm1)+480
		gcopy BackScreenDrawPrm1,0,0,640,480
	}
	if BackScreenX(BackScreenDrawPrm1)<0 and BackScreenY(BackScreenDrawPrm1)<0 {
		pos BackScreenX(BackScreenDrawPrm1)+640,BackScreenY(BackScreenDrawPrm1)+480
		gcopy BackScreenDrawPrm1,0,0,640,480
	}
	return

#global