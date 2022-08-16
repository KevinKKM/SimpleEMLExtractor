$FileNames = Get-ChildItem -Path '.\sample\*' -Name

for (($i = 0); $i -lt $FileNames.Length; $i++){
	$fileName = $FileNames[$i]
	$content = type .\sample\$fileName | findstr /R "href="
	$haveLink = $content -match 'href=\"(?<hyperLink>.*)\"'
	if($haveLink){
	$link = $matches['hyperLink']| Out-string
	[String]::Format("FileName:{0}, link:{1}",$fileName, $link.Trim())
	}
	else{
	echo $fileName" : N/A"
	}
}