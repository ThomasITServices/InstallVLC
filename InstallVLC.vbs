''  Install VLC 
''  by Edward L. Thomas                                                     
''  Email: Edward@ThomasITServices.com Phone: 503-409-8918
''  Created:    7/5/2016                                                                           
''  Last Modified:  7/5/2016                                                                              
''  Last Modified By: Edward Thomas                                                            
''  Programming Language: VBScript

Option Explicit

'''''Start Up'''''
If WScript.Arguments.Named.Exists("elevated") = False Then
    'Launch the script again as administrator
    Dim StartMeUP : Set StartMeUP = createObject("Shell.Application")
    Call StartMeUP.ShellExecute("wscript.exe", chr(34) + WScript.ScriptFullName + chr(34) + " /elevated", "", "runas", 1)
                
Else

    '''' Setting Variables ''''

    Dim ProgramName: ProgramName = "Install VLC"
    Dim popOnTop : popOnTop = 4096
    Dim ProgramPath : ProgramPath = "\\netapp3\Aero_IET\Software\Applications\VLC\source\vlc-2.1.0-win32.exe" 
    Dim Arg : Arg = "/L=1033 /S"

    Dim objShell : Set objShell = createobject("Wscript.shell")
    Dim oFSO: Set oFSO = CreateObject("Scripting.FileSystemObject")
    Dim oEnv : Set oEnv = objShell.Environment("PROCESS")

    '''''Process Block ''''


    Call installSoftware(ProgramName,ProgramPath,Arg)


    ''''Function Block '''''
'/passive /norestart
 Sub installSoftware(ProgramName,installPath,arg)
	oENV("SEE_MASK_NOZONECHECKS") = 1
	Dim BWaitOnReturn : bWaitOnReturn = True
		If Not oFSO.FileExists(installPath) Then
			objShell.Popup "File Not found! " + installPath ,5,"Missing File",popOnTop
			Exit Sub
		Else
			objShell.popup "Installing " + ProgramName,2,ProgramName
			objShell.run Chr(34) + installPath + Chr(34)  + " " + arg,0,bWaitOnReturn 
			objShell.popup ProgramName + " is now Installed ",2,ProgramName,popOnTop 
		End If
	oEnv.Remove("SEE_MASK_NOZONECHECKS") 
End Sub
    ''''End'''
    Wscript.Quit

End IF
