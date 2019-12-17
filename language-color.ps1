
$LinguistGrammerUrl = "https://rawgit.com/github/linguist/master/lib/linguist/languages.yml"
$Content = Invoke-WebRequest $LinguistGrammerUrl
$Content = $Content.ToString().Replace('`r', '') -split "`n"
#"$Content" | out-file -filepath test/languages.yml
$CurrentColorClass = "/** `n`tAdewale Azeez <azeezadewale98@gmail.com>`n`tMIT License`n`tCopyright (c) 2019 Quick Utils`n`t$((Get-Date).ToString())`n**/"
$CurrentColorClass | out-file -filepath language-color.css
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
			$CurrentColorClass = "$CurrentColorClass background-color: $ColorValue; }"
		}
	} 
	else 
	{
		if (-not $CurrentColorClass -eq "" -and $CurrentColorClass.Contains("background-color")) 
		{
			$CurrentColorClass | out-file -append -filepath language-color.css
		}
		$CurrentColorClass = ""
		$Line = $Line.Replace('+', 'p').Replace("'", '').Replace("#", 'sharp').Replace("*", 'star').Replace("!", 'not')
		$LanguageClassName = $Line.Replace(':', '').Replace(' ', '-').ToLower().Trim()
		$CurrentColorClass = ".color-$LanguageClassName {"
	}
}