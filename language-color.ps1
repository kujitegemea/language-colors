
if (-not (Test-Path "test/")){
    mkdir  test/
}
$LinguistGrammerUrl = "https://rawgit.com/github/linguist/master/lib/linguist/languages.yml"
$Content = Invoke-WebRequest -Uri $LinguistGrammerUrl -UseBasicParsing
$Content = $Content.ToString().Replace('`r', '') -split "`n"
"$Content" | out-file -filepath test/languages.yml
$CurrentColorClass = "/** `n`tAdewale Azeez <azeezadewale98@gmail.com>`n`tMIT License`n`tCopyright (c) 2019 Quick Utils`n`t$((Get-Date).ToString())`n**/"
$CurrentColorClass | out-file -filepath language-color.css
$CurrentBGColorClass = ""
ForEach ($Line in $Content)
{
	if ($Line.StartsWith("#") -or $Line.StartsWith("-") -or $Line.Trim() -eq "") 
	{
		continue
	}
	if ($Line.StartsWith("  "))
	{
		if ($Line.Trim().StartsWith("color")) 
		{
			$FirstIndex = $Line.IndexOf('"')
			$ColorValue = $Line.SubString($FirstIndex + 1, $Line.LastIndexOf('"') - $FirstIndex - 1)
			$CurrentColorClass = "$CurrentColorClass color: $ColorValue !important; }"
			$CurrentBGColorClass = "$CurrentBGColorClass background-color: $ColorValue !important; }"
		}
	} 
	else 
	{
		if (-not $CurrentBGColorClass -eq "" -and $CurrentBGColorClass.Contains("background-color")) 
		{
			$CurrentColorClass | out-file -append -filepath language-color.css
			$CurrentBGColorClass | out-file -append -filepath language-color.css
		}
		$CurrentColorClass = ""
		$CurrentBGColorClass = ""
		$Line = $Line.Replace('+', 'p').Replace("'", '').Replace("#", 'sharp').Replace("*", 'star').Replace("!", 'not')
		$LanguageClassName = $Line.Replace(':', '').Replace(' ', '-').ToLower().Trim()
		$CurrentColorClass = ".color-$LanguageClassName {"
		$CurrentBGColorClass = ".bg-color-$LanguageClassName {"
	}
}