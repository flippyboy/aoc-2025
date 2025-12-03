$input = Get-Content -path .\input.txt

$value = 50
$timesZero = 0

foreach ($line in $input) {
  $operation = $line -replace "L","- " -replace "R","+ "

  $s = $value
  $value = (Invoke-Expression -Command "$value $operation")

  $f = $value

  foreach ($i in $s..$f){
    if (
      $i -ne $s -and
      $i -ne $f -and
      $i % 100 -eq 0
      ) {
      $timesZero++
    }
  }

  $result = (Invoke-Expression -Command "$value % 100")
  if ($result -eq 0) 
  {
    $timesZero++
  }

}

Write-Host "Total result is:" $timesZero