@PreScript

	soundstop -1
	soundload resource/sound/0.é˜¿“pè³é«.wav 0 1
	soundplay 0 0
	font MS–¾’©,42,0

@PreScriptEnd

@Calc
	//z key
	getkey 90
	if key_getkey = 1 {
		flag 1
	}

	//x key
	getkey 88
	if key_getkey = 1 {
		end
	}

@CalcEnd

@Draw

	color 64 64 64
	boxf 0 0 640 480
	pos 10 10
	color 0 0 255
	mes Sample

@DrawEnd