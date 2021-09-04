GNU nano 5.4                                                                                                        web.sh
#!/bin/bash/
#  coder by M4CK3R
# Colours
#-----------------
red="\e[91m"
rset="\e[0m"
grn="\e[92m"
ylo="\e[93m"
blue="\e[94m"
cyan="\e[96m"
pink="\e[95m"
4#-----------------
clear
# check for root access
#[ "${UID}" -eq 0 ] || { echo -e "sudo !!\n" ; exit 1; }
if [[ $UID -ne 0 ]]
then
        echo 'sudo !!'
        echo
        exit 1
fi
clear
sleep 2
echo -e "$blue╔═════════════════════╗
║                     ║"
echo -e "$ylo║---CODER BY M4CK3R---║"
echo -e "$blue║                     ║
╚═════════════════════╝"
echo "$redPlease Wait...."
sleep 3
echo -e "\e[91m
  ████╗░███████╗██╗░░░░░██╗░░░░░░█████╗░
██╔══██╗██╔════╝██║░░░░░██║░░░░░██╔══██╗
██████╔╝█████╗░░██║░░░░░██║░░░░░██║░░██║
██╔═══╝░██╔══╝░░██║░░░░░██║░░░░░██║░░██║
██║░░░░░███████╗███████╗███████╗╚█████╔╝
╚═╝░░░░░╚══════╝╚══════╝╚══════╝░╚════╝░"
echo ""
echo ""

echo -e "$grn[1]~Sql scan"
echo""
echo -e "$grn[2]~Xss scan"
echo""
echo -e "$grn[3]~Port scan"
echo""
echo -e "$grn[4]~Admin scan"
echo""
echo -e "$grn[5]~Exit"
echo""
read -p "[~select~]~>" sad

if [ $sad = 1 ] || [ $sad = 1 ]
then
clear
#sqlibanner
echo -n "[+] List site: "
        read mass_site
echo -n "[+] Output name: "
        read output_mass
        echo ""
                while IFS= read -r ms
                do
                        curl -s $ms | wc -l > ms1
                        curl -s $ms\' | wc -l > ms2
                        ms1=$(cat ms1)
                        ms2=$(cat ms2)
                        if [ $ms1 -lt $ms2 ]; then
                                echo -e "${hijau}[+]${n} ${biru}$ms${n} ${hijau}[VULN]${n}"
                                echo "$ms" >> mass_$output_mass
                        elif [ $ms1 -gt $ms2 ]; then
                                echo -e "${hijau}[+]${n} ${biru}$ms${n} ${hijau}[VULN]${n}"
                                echo "$ms" >> mass_$output_mass
                        elif [ $ms1 -eq $ms2 ]; then
                                echo -e "${red}[-]${n} ${biru}$ms${n} ${red}[NOT FOUND]${n}"
                        fi
                done < $mass_site
rm ms1 ms2
jumlah_sqli=$(cat mass_$output_mass | wc -l)
        echo "Saved on mass_$output_mass, Total $jumlah_sqli line"
clear
#sqlibanner
echo -n "[+] Site: "
        read site
                curl -s $site | wc -l > file1
                curl -s $site\' | wc -l > file2
                file1=$(cat file1)
                file2=$(cat file2)
                if [ $file1 -lt $file2 ]; then
                        echo -e "${hijau}[+]${n} $site ${hijau}[VULN]${n}"
                elif [ $file1 -gt $file2 ]; then
                        echo -e "${hijau}[+]${n} $site ${hijau}[VULN]${n}"
                elif [ $file1 -eq $file2 ]; then
                        echo -e "${red}[-]${n} $site ${red}[NOT FOUND]${n}"
                fi
rm file1 file2
clear
#sqlibanner
today=$(date)
echo -e "Today: $today\n"
echo -e "[1] Single\n[2] Massive\n"
echo -n "[+] Select: "
        read sqli_play
                if [ $sqli_play -eq 1 ]; then
                        sqli_single
                elif [ $sqli_play -eq 2 ]; then
                        sqli_massive
                fi
#sqlijut_sqli
echo -n "[+] Back? Y/N: "
        read back_sqli
                if [ $back_sqli = "Y" ]; then
                        sqlimain
                elif [ $back_sqli = "N" ]; then
                        echo "ngontol amat"
                fi
fi