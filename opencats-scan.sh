mek='/careers/index.php?m=careers&p=showAll'
clear
printf "


   ___                    ___      _       
  /___\_ __   ___ _ __   / __\__ _| |_ ___ 
 //  // '_ \ / _ \ '_ \ / /  / _' | __/ __|   OpenCATS 0.9.4 Arbitrary File Upload Mass Scanner
/ \_//| |_) |  __/ | | / /__| (_| | |_\__ \'   @itsmebinyourbae
\___/ | .__/ \___|_| |_\____/\__,_|\__|___/
      |_|                                  
                                                        
"
exploit () {
echo "url list: "
read list
url="$(cat $list)"
}
exploit
scanning () {
  rm result.txt
echo -e "\n[*] attacking target...\n\n"
for url in $(cat $list);
do
	if [[ $(curl --connect-timeout 3 --max-time 3 -kLs "${url}${mek}" | grep "Current Available") =~ 'Current Available Openings' ]]; then
		echo "${url} > vuln"
		echo "${url}${mek}" >> result.txt
		else
		echo "${url} > not vuln"
	fi
done
}
scanning
finish () {
printf "\nOpenCATS Scanner Result saved at result.txt"
}
finish