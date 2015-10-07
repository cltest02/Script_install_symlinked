#
# Algorithm borrowed from http://wiki.rtorrent.org/MagnetUri and adapted to work with zsh.
#

magnet_to_torrent()
{
  local hashh filename

	[[ "$1" =~ xt=urn:btih:([^\&/]+) ]] || return 1

	hashh=${match[1]}

	if [[ "$1" =~ dn=([^\&/]+) ]]; then
	  filename=${match[1]}
	else
	  filename=$hashh
	fi

	echo "d10:magnet-uri${#1}:${1}e" > "$filename.torrent"
}
