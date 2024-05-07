#module BackScreenModule
#deffunc BackScreenInit
	//���������B��������Y����(����Ȃ�)�o�O��܂�()
	dim BackScreenX,16
	dim BackScreenY,16
	dim BackScreenXChange,16
	dim BackScreenYChange,16
	return

#deffunc BackScreenLoad str BackScreenLoadPrm1 , int BackScreenLoadPrm2
	//��Ԗڂɔw�i�摜�̃p�X���A��Ԗڂ͕`���o�b�t�@�̐ݒ�
	buffer BackScreenLoadPrm2
	picload BackScreenLoadPrm1
	gsel 0,0
	return

#deffunc BackScreenMoveSet int BackScreenMoveSetPrm1 , int BackScreenMoveSetPrm2 , int BackScreenMoveSetPrm3
	//��Ԗڂ��w�i�ԍ��A��ԖڂƎO�Ԗڂ̃p�����[�^��X,Y���W�l
	BackScreenXChange(BackScreenMoveSetPrm1)=BackScreenMoveSetPrm2
	BackScreenYChange(BackScreenMoveSetPrm1)=BackScreenMoveSetPrm3
	return

#deffunc BackScreenMove int BackScreenMovePrm1
	//�w�i�ړ����s
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
	//�w�肵���w�i�̉摜���т�[�����܂��B(�w�i�ԍ��Ŏw�肵������A���̃����[())
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