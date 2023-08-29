# Instal John The Ripper

instal(){
    sudo apt update
    sudo apt install build-essential libssl-dev yasm pkg-config
    git clone https://github.com/openwall/john.git
    cd john
    ./configure && make -s clean && make -sj4
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
        nanya
    fi
}

nanya
