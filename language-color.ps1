
if (-not (Test-Path "test/")){
    mkdir  test/
}
$NumArray = "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"
$NumValueArray = "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"
$LinguistGrammerUrl = "https://rawgit.com/github/linguist/master/lib/linguist/languages.yml"
$Content = Invoke-WebRequest -Uri $LinguistGrammerUrl -UseBasicParsing
$Content = $Content.ToString().Replace('`r', '') -split "`n"
"$Content" | out-file -Encoding utf8 -filepath test/languages.yml
$CurrentColorClass = "/** `n`tAdewale Azeez <azeezadewale98@gmail.com>`n`tMIT License`n`tCopyright (c) 2019 Quick Utils`n`t$((Get-Date).ToString())`n**/"
$CurrentJSColor = "`nconst Color = require(`"color`")`n`nmodule.exports = {"
$CurrentColorClass | out-file -Encoding utf8 -filepath docs/language-color.css
$CurrentColorClass | out-file -Encoding utf8 -filepath index.js
$CurrentJSColor | out-file -Encoding utf8 -append -filepath index.js
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
			$CurrentJSColor = "$CurrentJSColor : Color('$ColorValue'),"
		}
	} 
	else 
	{
		if (-not $CurrentBGColorClass -eq "" -and $CurrentBGColorClass.Contains("background-color")) 
		{
			$CurrentColorClass | out-file -Encoding utf8 -append -filepath docs/language-color.css
			$CurrentBGColorClass | out-file -Encoding utf8 -append -filepath docs/language-color.css
			$CurrentJSColor | out-file -Encoding utf8 -append -filepath index.js
		}
		$CurrentColorClass = ""
		$CurrentBGColorClass = ""
		$Line = $Line.Replace('+', 'p').Replace("'", '').Replace("#", 'sharp').Replace("*", 'star').Replace("!", 'not')
		$LanguageClassName = $Line.Replace(':', '').Replace('.', 'dot').Replace(' ', '-').ToLower().Trim()
		$i = 0
		ForEach ($num in $NumArray) {
			if ($LanguageClassName.StartsWith($num)) {
				$LanguageClassName = $NumValueArray[$i] + $LanguageClassName.SubString(1, $LanguageClassName.Length - 1)
			}
			$i++
		}
		$CurrentColorClass = ".color-$LanguageClassName {"
		$LanguageClassName = $LanguageClassName.Replace('-', '_')
		$CurrentJSColor = "    $LanguageClassName"
		$CurrentBGColorClass = ".bg-color-$LanguageClassName {"
	}
}
"}" | out-file -Encoding utf8 -append -filepath index.js