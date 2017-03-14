/*
If the computer is idle for over 2 min, move the mouse in a square.
Then, sleep for 1 minute and test again.
*/

Loop {
	If A_TimeIdle > 120000
	{
		MouseMove, 15, 0, 50, R
		MouseMove, 0, 15, 50, R
		MouseMove, -15, 0, 50, R
		MouseMove, 0, -15, 50, R
	}
	Sleep, 60000
}