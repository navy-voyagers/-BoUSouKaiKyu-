#module Enemy
#deffunc EnemyInit
	ENEMY_TOTAL=128
	dim EnemyX,ENEMY_TOTAL
	dim EnemyY,ENEMY_TOTAL
	dim EnemyExist,ENEMY_TOTAL
	dim EnemyXChange,ENEMY_TOTAL
	dim EnemyYChange,ENEMY_TOTAL
	dim EnemyHp,ENEMY_TOTAL
	dim EnemySize,ENEMY_TOTAL
	dim EnemyColorR,ENEMY_TOTAL
	dim EnemyColorG,ENEMY_TOTAL
	dim EnemyColorB,ENEMY_TOTAL

	;sdim EnemyPic,ENEMY_TOTAL
	;dim EnemyBufferNumber,ENEMY_TOTAL

	;repeat ENEMY_TOTAL
	;EnemyPic(cnt)=""
	;loop

	return

;#deffunc EnemyPicSet str EnemyPicSetPrm1
	;return

#deffunc EnemyReset
	repeat ENEMY_TOTAL
	EnemyX(cnt)=0
	EnemyY(cnt)=0
	EnemyExist(cnt)=0
	EnemyXChange(cnt)=0
	EnemyYChange(cnt)=0
	EnemyHp(cnt)=0

	loop
	return

#deffunc EnemyColorSet int EnemyColorSetPrm1 , int EnemyColorSetPrm2 , int EnemyColorSetPrm3
	repeat ENEMY_TOTAL
	if EnemyExist(cnt)=0 {
		EnemyColorR(cnt)=EnemyColorSetPrm1
		EnemyColorG(cnt)=EnemyColorSetPrm2
		EnemyColorB(cnt)=EnemyColorSetPrm3
		break
	}
	loop
	return

#deffunc EnemySet int EnemySetPrm1 , int EnemySetPrm2 , int EnemySetPrm3 , int EnemySetPrm4 , int EnemySetPrm5 , int EnemySetPrm6
	temp=0		//実行できたかどうかを確認するフラグ
	repeat ENEMY_TOTAL
	if EnemyExist(cnt)=0 {
		EnemyX(cnt)=EnemySetPrm1
		EnemyY(cnt)=EnemySetPrm2
		EnemyXChange(cnt)=EnemySetPrm3
		EnemyYChange(cnt)=EnemySetPrm4
		EnemyHp(cnt)=EnemySetPrm5
		EnemySize(cnt)=EnemySetPrm6
		EnemyExist(cnt)=1
		temp=1		//実行OK
		break
	}
	loop
	if temp=0 {
		logmes "Too many Enemys"
	}
	return

#deffunc EnemyReflect
	repeat ENEMY_TOTAL
	if EnemyExist(cnt)=1 {
		if EnemyY(cnt)<0 or EnemyY(cnt)>480 {
			EnemyYChange(cnt)=(-1)*EnemyYChange(cnt)
		}
		if EnemyX(cnt)>640 {
			EnemyXChange(cnt)=(-1)*EnemyXChange(cnt)
		}
	}
	loop

#deffunc EnemyMove
	repeat ENEMY_TOTAL
	if EnemyExist(cnt)=1 {
		EnemyX(cnt)=EnemyX(cnt)+EnemyXChange(cnt)
		EnemyY(cnt)=EnemyY(cnt)+EnemyYChange(cnt)
		//プレイヤーのショットをくらったときにダメージを入れる命令はここに。
		cnt_t=cnt
		if PlayerShotHit(EnemyX(cnt),EnemyY(cnt),EnemySize(cnt))=1 {
			EnemyHp(cnt)--
		}
		//Hp<=0で消去
		if EnemyHp(cnt)<=0 {
			EnemyExist(cnt)=0
		}
		if EnemyX(cnt)>700 or EnemyX(cnt)<-50 or EnemyY(cnt)<-50 or EnemyY(cnt)>570 {
			EnemyExist(cnt)=0
		}
	}
	loop
	return

#defcfunc EnemyInfo int EnemyInfoPrm1 , int EnemyInfoPrm2
	if EnemyInfoPrm2>ENEMY_TOTAL {
		return 0
	}
	switch EnemyInfoPrm1
	case 0		//EnemyX
	return EnemyX(EnemyInfoPrm2)

	case 1		//EnemyY
	return EnemyY(EnemyInfoPrm2)

	case 2		//EnemyHp
	return EnemyHp(EnemyInfoPrm2)

	swend
	return "error"

#deffunc EnemyDraw
	repeat ENEMY_TOTAL
	if EnemyExist(cnt)=1 {
		//仮
		color EnemyColorR(cnt),EnemyColorG(cnt),EnemyColorB(cnt)
		circle EnemyX(cnt)-EnemySize(cnt),EnemyY(cnt)-EnemySize(cnt),EnemyX(cnt)+EnemySize(cnt),EnemyY(cnt)+EnemySize(cnt)
		color EnemyColorR(cnt)/2,EnemyColorG(cnt)/2,EnemyColorB(cnt)/2
		circle EnemyX(cnt)-EnemySize(cnt)/2,EnemyY(cnt)-EnemySize(cnt)/2,EnemyX(cnt)+EnemySize(cnt)/2,EnemyY(cnt)+EnemySize(cnt)/2
		color 0,0,0
		circle EnemyX(cnt)-EnemySize(cnt)/3,EnemyY(cnt)-EnemySize(cnt)/3,EnemyX(cnt)+EnemySize(cnt)/3,EnemyY(cnt)+EnemySize(cnt)/3
	}
	loop
	return

#global