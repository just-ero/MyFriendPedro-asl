//
//
//Update 26/06/2019
//
//
//

state("My Friend Pedro - Blood Bullets Bananas")
{
	 //
	 //UnityPlayer.dll 74 ?? 48 8B 41 10 48 85 C0 74 ?? 89 90 ?? ?? ?? ?? 48 83 C4 28 (+13)
	 //UnityPlayer.dll F3 0F 10 78 ?? 48 3B DF 74 ?? 83 B9 ?? ?? ?? ?? 00 75 ?? (+12)
	 //
	 int isMenu: "UnityPlayer.dll", 0x144CD38, 0x80, 0x10, 0xAC;
	 //
	 //
	 byte isLoading: "UnityPlayer.dll", 0x144BCE5;
	 //
	 // v1.0.0
	 int iLevel: "mono.dll", 0x264110, 0xA8, 0x18, 0x6C; 
	 // Experimental 
	 // int iLevel: "mono.dll", 0x264110, 0xA8, 0x18, 0x70;
	 //
	 //
}

startup
{
	settings.Add("AllSplits", false, "Enable all autosplits including for Tutorial subsplits");
}

isLoading
{
		return current.isLoading == 0 ||current.isMenu == 1;
}

split
{
	if((current.iLevel == 13) || (current.iLevel == 15) || (current.iLevel == 29) || (current.iLevel == 42) || (current.iLevel == 51))
	{
		return false;
	}

	if(settings["AllSplits"])
	{
		if(current.iLevel >= 2)
		{
			return current.iLevel == old.iLevel+1;
		}
	}
	else
	{
		if(current.iLevel >= 6)
		{
			return current.iLevel == old.iLevel+1;
		}
	}
}

reset
{
	return current.iLevel == 1;
}

start
{
	return current.iLevel == 3;
}

exit
{
	timer.IsGameTimePaused = true;
}
