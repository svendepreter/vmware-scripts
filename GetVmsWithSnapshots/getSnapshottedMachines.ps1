
connect-viserver -server "spg-virtualcenter"
 get-vm | get-snapshot |select  VM,Name,
 				@{Name="SizeGB";Expression={[math]::Round($_.SizeGB,2)}},
				Created,
				@{Name="Days Old";Expression= {(New-TimeSpan -End (get-date) -start $_.Created).Days}} | ft -AutoSize
disconnect-viserver  -server "spg-virtualcenter" -Force -Confirm:$false