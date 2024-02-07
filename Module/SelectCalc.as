	//Menu.hsp専用select命令セット(switch文の中で使用)
	switch ScriptBitData(0)
	case "SelectColor"
	select_r_t=int(ScriptBitData(1))
	select_g_t=int(ScriptBitData(2))
	select_b_t=int(ScriptBitData(3))
	select_r_f=int(ScriptBitData(4))
	select_g_f=int(ScriptBitData(5))
	select_b_f=int(ScriptBitData(6))
	swbreak

	case "VarSelect"
	if ScriptBitData(1)="+" {
		PlayerSelect+
		if SelectMax<PlayerSelect {
			PlayerSelect=SelectMin
		}
	}
	if ScriptBitData(1)="-" {
		PlayerSelect-
		if SelectMin>PlayerSelect {
			PlayerSelect=SelectMax
		}
	}
	swbreak

	case "SelectMax"
	SelectMax=int(ScriptBitData(1))
	swbreak

	case "SelectMin"
	SelectMin=int(ScriptBitData(1))
	swbreak

	swend