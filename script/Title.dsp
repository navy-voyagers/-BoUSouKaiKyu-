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
		if flag = 0 {
			flag 1
			break
		}
	}

	//a key
	getkey 65
	if key_getkey = 1 {
		if flag = 1 {
			flag 0
		}
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

	if flag = 0 {
		color 0 0 255
		mes FLAG=0
	}

	if flag = 1 {
		color 0 255 0
		mes FLAG=1
	}

@DrawEnd