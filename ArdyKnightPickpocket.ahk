CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

pauseAnime()
{
	if WinExist("ahk_exe PotPlayerMini64.exe")
	{
		WinActivate
		Send {Space}
	}
}	

F1::
Loop 
{
	OutputDebug, "Searching for Ardy knight."
	PixelSearch, outputX, outputY, -768, 211, -253, 549, 0xFFFF00, 0, Fast
	if (ErrorLevel = 0)
	{
		OutputDebug, "Found Ardy knight!"
		OutputDebug, "Clicking on ardy knight"
		Click, -500, 485
		OutputDebug, "Check if coin pouch exists."
		PixelGetColor, color, -192, 444
		if (color = "0x2F434A")
		{
			OutputDebug, "Coin pouch found. Clicking on it."
			Click, -192, 444
		}
		OutputDebug, "Check if hp is low."
		PixelGetColor, color, -220, 275
		if (color = "0x131313")
		{
			pauseAnime()
			MsgBox, 4096, "You are low on health"
		}
	}
	Else
	{
		pauseAnime()
		MsgBox, 4096, "Ardy knight has moved or de-spawned."
	}
}

F2::
Reload