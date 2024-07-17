"
The integrated scripting environment
"
Class {
	#name : 'ISE',
	#superclass : 'Object',
	#category : 'PowerShell-Tools-Scripting',
	#package : 'PowerShell-Tools',
	#tag : 'Scripting'
}

{ #category : 'opening' }
ISE class >> start [
	<script>

	LibC runCommand: 'powershell_ise.exe'
]

{ #category : 'opening' }
ISE class >> startInMultiThreadedApartmentMode [
	<script>

	LibC runCommand: 'powershell_ise.exe -MTA'
]

{ #category : 'opening' }
ISE class >> startWithoutPowerShellProfile [
	<script>

	LibC runCommand: 'powershell_ise.exe -NoProfile'
]
