# Instal John The Ripper

instal(){
    path="/root/instal-john-the-ripper/john/run"
    cd /root
    sudo apt update
    sudo apt-get install build-essential libssl-dev zlib1g-dev yasm pkg-config libgmp-dev libpcap-dev libbz2-dev
    git clone https://github.com/openwall/john.git
    cd john/src
    ./configure && make -s clean && make -sj4
    export PATH=$PATH:${path}
    echo "Selesai."
}

nanya(){
    read -p "Apakah anda mau menginstal John The Ripper [iya/tidak]: " nanya
    if [[ ${nanya} == "iya" ]]; then
        instal
        exit 0
    elif [[ ${nanya} == "tidak" ]]; then
        exit 0
    else
        echo "Kesalahan: masukkan salah."
        exit 1 
    fi
}

cek_root(){
    if [ $UID -eq 0 ]; then
        nanya
    else
        echo "Jalankan sebagai root."
    fi
}

cek_root
