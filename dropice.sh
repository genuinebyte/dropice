#!/usr/bin/fish

if test -z "$argv[1]" -o -z "$argv[2]" -o -z "$argv[3]"
	echo "Usage: dropice <year> <month> <day>"
	echo "Must be on a sunday!"

	exit
end


set year $argv[1]
set month $argv[2]
set day $argv[3]

set startdate $year"-"$month"-"$day

set weekday (date --date=$startdate +%a)

echo $weekday

if test "$weekday" != "Sun"
	echo "Date does not fall on a Sunday, refusing to run!"
	exit
end

# Short for last_week
function lw
	if test ! -z "$argv[1]"
		set -g lastweek (date --date=$argv[1]"-1 weeks" +%F)
	else
		set -g lastweek (date --date=$lastweek"-1 weeks" +%F)
	end

	echo $lastweek
end

function yesterday
	date --date=$argv[1]"-1 day" +%F
end

function tomorrow
	date --date=$argv[1]"+1 day" +%F
end

# Short for write_horizontal
function wh
	set pattern $argv[1]
	set week $argv[2]

	set day $week

	#set pattern (echo -n $pattern | rev)
	for c in (string split '' "$pattern")
		set day (yesterday $day)

		if test "$c" = "X"
			./datefill.sh $day
		end
	end
	echo ""
end

wh "X.....X" $startdate
wh "X..X..X" (lw $startdate)
wh "XXXXXXX" (lw)
wh "......." (lw)
wh "X.....X" (lw)
wh "X.....X" (lw)
wh "XXXXXXX" (lw)
wh "......." (lw)
wh "X.....X" (lw)
wh "XXXXXXX" (lw)
wh "X.....X" (lw)
wh "......." (lw)
wh "......." (lw)
wh "XXX...." (lw)
wh "X.X...." (lw)
wh "XXXXXXX" (lw)
wh "......." (lw)
wh ".XXXXX." (lw)
wh "X.....X" (lw)
wh ".XXXXX." (lw)
wh "......." (lw)
wh "XXX.XXX" (lw)
wh "X..X..." (lw)
wh "XXXXXXX" (lw)
wh "......." (lw)
wh ".XXXXX." (lw)
wh "X.....X" (lw)
wh "XXXXXXX" (lw)