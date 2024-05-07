#module TalkModule

#include "hsputil.as"

#deffunc TalkInit
	text 0,1
	talk_number=0
	return

#deffunc TalkReset
	talk_number=0
	return

#deffunc TalkEngine
	TalkSw="start"
	repeat
	redraw 0
	color 0,0,0
	gmode 0
	grect 240,400,0,300,70
	redraw 1
	pos 10,370
	color 255,255,255

	//会話データ
	#include "system/talk.as"

	if TalkSw="end" {
		break
	}

	repeat
	stick key
	if key&2048 {
		break
	}
	await 16
	loop

	talk_number++
	loop
	gmode 3,0,0,127
	return

#deffunc TalkEnd
	TalkSw="end"
	return

#defcfunc TalkNumber
	return talk_number

#global