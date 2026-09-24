# KaiteForce
A lightweight, automated Bash tool for local brute-force auditing and credential testing. Built for educational purposes and cybersecurity research

## Usage & Installation

You can download ```KaiteForce``` directly to your target system using ```wget```:
```
wget --no-check-certificate -q 'https://raw.githubusercontent.com/kaiteMuak/KaiteForce/refs/heads/main/kforce.sh'
```

## Execution steps

Grant execution privileges:
```
chmod +x kforce.sh
```

Launch the tool:
```
./kforce.sh
```

Provide required inputs:
When prompted, specify the target **username** and the path to your **wordlist** (e.g., ```/usr/share/wordlists/rockyou.txt```) to initiate the local brute-force attack.
