#packopt name "StageScriptHelper"

*StartUp
	sdim prm,32,256
	screen 1,320,240
	gsel 1,-1
	gsel 0,0

*MainScreen
	gsel 0,0
	cls 4
	redraw 0
	pos 0,0
	color 0,0,0
	boxf
	color 255,255,255
	pos 10,10
	mes "StageScriptHelper"
	mes "入力支援システムを起動するにはB+Ctrlを押して下さい。"
	redraw 1
	button "終了",*Exit

*key_wait
	repeat
	getkey b,66
	getkey ctrl,17	//わからないから調べて
	if b=1 and ctrl=1 {
		gosub *OpenToolScreen
	}
	await 16
	loop

*OpenToolScreen
	repeat 16
	prm(cnt)=""
	loop
	gsel 1,1
	cls 4
	objsize 200,30,0
	pos 10,10
	color 255,255,255
	mes "StageScriptHelper"
	button "If_set",*if_set
	button "BulletSet",*bullet_set
	return

*if_set
	cls 4
	color 255,255,255
	mes "FRAME_MIN"
	input prm(0),200,24,32
	mes "FRAME_MAX"
	input prm(1),200,24,32
	mes "BOSS_HP"
	input prm(2),200,24,32
	mes "(IF SET BOSS HP PRM,)BOSSINFO"
	input prm(3),200,24,32
	mes "(IF SET BOSS HP PRM,)BOSS_ID"
	input prm(4),200,24,32
	button "Make",*if_set_result
	stop

*if_set_result
	if prm(2)="" {
		result="if stage_frame>"+prm(0)+" and stage_frame<"+prm(1)+" {"
	}else{
		result="if stage_frame>"+prm(0)+" and stage_frame<"+prm(1)+" and BossInfo("+prm(3)+","+prm(4)+")>"+prm(2)+" {"
	}
	cls 4
	color 255,255,255
	mes "result"
	mesbox result,300,100,4,0
	button "close",*window_close
	stop

*bullet_set

	stop

*window_close
	gsel 1,-1
	goto *key_wait

*Exit
	end