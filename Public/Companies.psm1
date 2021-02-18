function Get-HuduCompanies{
	Param (
		[String]$name ='',
		[String]$phonenumber ='',
		[String]$website ='',
		[String]$city ='',
		[String]$state ='',
		[Int]$id_in_integration =''
	
	)
	
	$resourcefilter = ''
	
	if ($name) {
		$resourcefilter = "$($resourcefilter)&name=$($name)"
	}
	
	if ($phonenumber) {
		$resourcefilter = "$($resourcefilter)&phone_number=$($phonenumber)"
	}
	
	if ($website) {
		$resourcefilter = "$($resourcefilter)&website=$($website)"
	}
	
	if ($city) {
		$resourcefilter = "$($resourcefilter)&city=$($city)"
	}
	
	if ($state) {
		$resourcefilter = "$($resourcefilter)&state=$($state)"
	}
	
	if ($id_in_integration) {
		$resourcefilter = "$($resourcefilter)&id_in_integration=$($id_in_integration)"
	}
	
	
	
	$i = 0;
		$AllCompanies = do {
		$Companies = hudu_request -Method get -Resource "/api/v1/companies?page=$i&page_size=1000$($resourcefilter)"
		$i++
		$Companies.Companies
		Write-Host "Retrieved $($Companies.Companies.count) Companies" -ForegroundColor Yellow
		} while ($Companies.Companies.count % 1000 -eq 0 -and $Companies.Companies.count -ne 0)
		
			
	return $AllCompanies
	
}

		
