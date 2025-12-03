$input = Get-Content -path .\input.txt

$products = $input -split ","
$tot = 0

foreach ($product in $products) {
  $range = $product -split "-"
  for ($i = $range[0]; $i -le $range[1]; $i++) {
    $l = $i.ToString().Length
    if (
      $l % 2 -eq 0 -and
      $i.ToString().Substring(0, $l/2) -eq $i.ToString().Substring($l - $l/2)
    ) {
      $tot = $tot + $i 
    }
  }
}

Write-Host "Total is:" $tot