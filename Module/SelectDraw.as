	//Menu.hsp専用select命令セット(switch文の中で使用)
	switch ScriptBitData(0)
	case "SelectMes"
	if ScriptBitData(2)=PlayerSelect {
		color select_r_t,select_g_t,select_b_t
	}else{
		color select_r_f,select_g_f,select_b_f
	}
	mes ScriptBitData(1)
	swbreak

	swend