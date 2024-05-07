#module
#deffunc EnemyPicInit
	dim EnemyPicFile,10
	dim EnemyPicType,128
	ddim EnemyPicX,128
	ddim EnemyPicY,128
	ddim EnemyPicChangeX,128
	ddim EnemyPicChangeY,128
	ddim EnemyExist,128
	return

#deffunc EnemyPicLoad int EnemyPicLoadPrm1
	buffer 40+EnemyPicLoadPrm1
	gsel 0,0
	return

#global