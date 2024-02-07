	//Menu.hsp専用select命令セット(switch文の中で使用)
	case "SelectMes"
	if ScriptBitData(2)=0 {
		color select_r_t,select_g_t,select_b_t
	}else{
		color select_r_f,select_g_f,select_b_f
	}
	mes ScriptBitData(1)
	swbreak

	case "SelectColor"
	select_r_t=int(ScriptBitData(1))
	select_g_t=int(ScriptBitData(2))
	select_b_t=int(ScriptBitData(3))
	swbreak