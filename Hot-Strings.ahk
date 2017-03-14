/*
-------------------------------------------------
HotStrings.ahk will help by typing commonly used
text in an active window.

Created By: Dan Anderson

-------------------------------------------------
*/


;Housekeeping variables (should be added in most AHK scripts)

#NoEnv  ;Performance and compatibility
SendMode Input  ;Superior speed and reliability
SetWorkingDir %A_ScriptDir%  ;Ensures a consistent starting directory
; #Warn  ;Uncomment to enable warnings


;Variable definitions
; #Hotstring * ;adds the * option to all hotstrings in this file. Ends the need for typing an ending character.

/*
-----------------------------
Useful Functions
-----------------------------
*/


;Send the caller the current date and time in 01-Jan-2015 <24 hour time> <Time Zone> format.

GetDateTime()
{
RegRead, TimeZone, HKEY_LOCAL_MACHINE, SYSTEM\CurrentControlSet\Control\TimeZoneInformation, TimeZoneKeyName
TimeZone:=RegExReplace(TimeZone, "[^A-Z]+")
FormatTime, CurrentDate,, dd-MMM-yyyy HH:mm

GetDateTimeVar = %CurrentDate% %TimeZone%

return GetDateTimeVar
}



/*
-----------------------------
Hotstrings
-----------------------------
*/

;Send the caller the current date and time in 01-Jan-2015 <24 hour time> <Time Zone> format.
::>cd::
CurrentDateTime := GetDateTime()
Send %CurrentDateTime%
return


;Inserts a PC blurb for root cause.
::>rc::
RootCause =
(
We are unable to point to the cause of the issue at this time. Root Cause analysis will be conducted as soon as possible.
)
Send %RootCause%
return


;Template for email updates on cases.
::>u::
CurrentDateTime := GetDateTime()

Send,
(
^bUpdate as of:^b %CurrentDateTime%

^bDate/Time problem reported:^b{Space}

^bAffected Client(s):^b{Space}

^bProblem Statement:^b{Space}

^bCurrent Status:^b{Space}

^bNext Update:^b{Space}
)
return


;Template for final email updates on cases.
::>f::
CurrentDateTime := GetDateTime()

Send,
(
^bUpdate as of:^b %CurrentDateTime%

^bDate/Time problem reported:^b{Space}

^bAffected Client(s):^b{Space}

^bProblem Statement:^b{Space}

^bCurrent Status:^b Resolved

^bTime Issue resolved:^b{Space}

^bResolution:^b{Space}

^bPreliminary Root Cause:^b{Space}

^bThis is the last update for this case. The case will remain open pending further research, root cause analysis and follow-up actions.^b
)
return


;Template for maintenance/release stuff
::>maint::

Send,
(
Hello Team,
 
Our final interruption for today will occur in 30 minutes. Please take care to wrap up any active queries, testing, or sessions.
We expect roughly 30 to 40 minutes of downtime. I’ll send notice once the applications are available and maintenance is complete.
 
 
Cheers,
Dan
)
return


/*
-----------------------------
Case Hotstrings
-----------------------------
*/


;C drive update
::>CDrive::
CDriveUpdate=
(
--Ran TreeSize to check for large files in System Volume Information - OK
--Ran Disk Cleanup
--Cleaned up old Temporary Internet Files
--Cleaned up old IE Active Recovery Files
--Cleaned up old IE WebCache files
--Cleaned up old IIS Logs
--Cleaned up all recycle bins

Drive at <> free now.
Closing ticket.

)
Send %CDriveUpdate%
return


/*
-----------------------------
Mongo Hotstrings
-----------------------------
*/


;Mongo Commands (Server Startup)
::>mongostart::
MongoStart=
(
mongod --dbpath "C:\mongohomework\mongo1" --port 27017 --smallfiles --oplogSize 50 --replSet NameOfSet
)
Send %MongoStart%
return


;Mongo Commands (Mongo Find)
::>mongofind::
MongoFind=
(
db.collectionName.find({{}keyCondition:value{}}, {{}_id:1, _id:0{}}).limit().pretty();
)
Send %MongoFind%
return


/*
-----------------------------
Linux Hotstrings
-----------------------------
*/


;Linux Commands (disk usage)
::>disk::
DiskUsage=
(
du -hsx * | sort -rh | head -10
)
Send %DiskUsage%
return


;Linux Commands (manual scraper)
::>scrape::
ScrapeFind=
(
cat /logs/apache/access.current.log | grep "POST \/BEL\/AirLowFareSearch" | awk '{print $1}' | sed 's/,//' | sort | uniq -c | sort -rn | head -20 > /var/tmp/iplist.txt
)
Send %ScrapeFind%
return


