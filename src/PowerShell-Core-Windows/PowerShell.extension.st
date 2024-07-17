Extension { #name : 'PowerShell' }

{ #category : '*PowerShell-Core-Windows' }
PowerShell class >> isAvailableInRegistry [
	"Check in HKLM\Software\Microsoft\PowerShell\1\Install if PowerShell is installed."

	|hKey value |
	hKey := (WinRegistryKey localMachine queryOpenSubkey: 'Software\\Microsoft\\PowerShell\\1').
	value := WinRegistry queryValue: 'Install' fromKey: hKey.
	hKey close.
   ^ value >= 1
]
