	//select–½—ßƒZƒbƒg
#module SelectCalcDraw
#deffunc SelectColor int SelectCalcPrm1 , int SelectCalcPrm2 , int SelectCalcPrm3 , int SelectCalcPrm4 , int SelectCalcPrm5 , int SelectCalcPrm6
	select_r_t=SelectCalcPrm1
	select_g_t=SelectCalcPrm2
	select_b_t=SelectCalcPrm3
	select_r_f=SelectCalcPrm4
	select_g_f=SelectCalcPrm5
	select_b_f=SelectCalcPrm6
	return

#deffunc VarSelect int VarSelectPrm1
	if VarSelectPrm1=1 {
		PlayerSelect+		//‰ÁŽZ
		if SelectMax<PlayerSelect {
			PlayerSelect=SelectMin
		}
	}
	if VarSelectPrm1=0 {
		PlayerSelect-		//Œ¸ŽZ
		if SelectMin>PlayerSelect {
			PlayerSelect=SelectMax
		}
	}
	return

#deffunc VarSet int VarSetPrm1
	PlayerSelect=VarSetPrm1
	return

#deffunc SetSelectMax int SetSelectMaxPrm1
	SelectMax=SetSelectMaxPrm1
	return

#deffunc SetSelectMin int SetSelectMinPrm1
	SelectMin=SetSelectMinPrm1
	return

#deffunc SelectMes str SelectMesPrm1 , int SelectMesPrm2
	if SelectMesPrm2=PlayerSelect {
		color select_r_t,select_g_t,select_b_t
	}else{
		color select_r_f,select_g_f,select_b_f
	}
	mes SelectMesPrm1
	return

#defcfunc SelectInfo int SelectInfoPrm1
	switch SelectInfoPrm1
	case 0		//PlayerSelect
	return PlayerSelect

	swend
	return "error"

#global