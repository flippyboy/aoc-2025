$input = Get-Content -path .\input.txt

$value = 50
$timesZero = 0

foreach ($line in $input) {
  $operation = $line -replace "L","- " -replace "R","+ "
  
  $value = (Invoke-Expression -Command "$value $operation")

  $result = (Invoke-Expression -Command "$value % 100")
  
  if ($result -eq 0) 
  {
    $timesZero++
  }
}

Write-Host "Total result is:" $timesZero