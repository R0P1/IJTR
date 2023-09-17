#!/bin/bash
# Instal John The Ripper

instal(){
    read -p "[$] Masukkan direktori untuk menyimpan John The Ripper: " dir
    if [[ -d ${dir} ]]; then
        cd $dir
        apt update
        apt-get install build-essential libssl-dev zlib1g-dev yasm pkg-config libgmp-dev libpcap-dev libbz2-dev
        git clone https://github.com/openwall/john.git
        cd john/src
        ./configure && make -s clean && make -sj4
        echo "export PATH=$PATH:/usr/share/john/run/" >> "~/.bashrc"
        echo "alias john='/usr/share/john/run/john'" >> "~/.bashrc"
        source ~/.bashrc
        echo "[+] Selesai."
    else
        echo "[!] Kesalahan: direktori ${dir} tidak ada."
        exit 1
    fi
}

nanya(){
    read -p "[$] Apakah anda mau menginstal John The Ripper [iya/tidak]: " nanya
    if [[ ${nanya} == "iya" ]]; then
        instal
        exit 0
    elif [[ ${nanya} == "tidak" ]]; then
        exit 0
    else
        echo "[!] Kesalahan: masukkan salah."
        exit 1 
    fi
}

cek_root(){
    if [ $UID -eq 0 ]; then
        nanya
    else
        echo "[!] Jalankan sebagai root."
    fi
}

cek_root
