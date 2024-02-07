@PreScript

	buffer 1
	//picload resource/pic/menu.bmp
	soundstop -1
	soundload resource/sound/0.é˜¿“pè³é«.wav 0 1
	soundplay 0 0
	font MS–¾’©,42,0

@PreScriptEnd

@Calc

	SelectMax 5
	SelectMin 0

	//–îˆóƒL[
	stick 0 0
	if key_stick & 2 {
		VarSelect -
	}
	if key_stick & 8 {
		VarSelect +
	}

	//x key
	getkey 88
	if key_getkey = 1 {
		end
	}

	SelectColor 255 0 0 0 0 255
@CalcEnd

@Draw

	pos 0 0
	//gcopy 1 0 0 640 480
	color 255 255 255
	boxf 0 0 640 480
	pos 10 10
	color 0 0 255
	mes Sample
	SelectMes Start 0
	SelectMes ExtraStart 1
	SelectMes PracticeStart 2
	SelectMes MusicRoom 3
	SelectMes Option 4
	SelectMes Exit 5

@DrawEnd