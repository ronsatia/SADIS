#!/bin/bash

# =============================================================
# SADIS - Systematic Analysis & Digital Investigation Suite
# 🕵️ Advanced OSINT Aggregator Tool
# Script By Ronis
# =============================================================

# -- Definisi Warna --
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
PURPLE='\033[0;35m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# -- Fungsi Header --
header() {
    clear
    echo -e "${RED}███████╗ █████╗ ██████╗ ██╗███████╗${NC}"
    echo -e "${RED}██╔════╝██╔══██╗██╔══██╗██║██╔════╝${NC}"
    echo -e "${WHITE}███████╗███████║██║  ██║██║███████╗${NC}"
    echo -e "${WHITE}╚════██║██╔══██║██║  ██║██║╚════██║${NC}"
    echo -e "${RED}███████║██║  ██║██████╔╝██║███████║${NC}"
    echo -e "${RED}╚══════╝╚═╝  ╚═╝╚═════╝ ╚═╝╚══════╝${NC}"
    echo -e "${CYAN}Systematic Analysis & Digital Investigation Suite${NC}"
    echo -e "${YELLOW}        [ Script By Ronis ]        ${NC}"
    echo -e "==========================================="
    echo ""
}

header

# -- Input Data Target --
echo -e "${WHITE}Masukkan data target sedetail mungkin.${NC}"
echo -e "${WHITE}Jika tidak tahu, biarkan kosong lalu tekan Enter.${NC}"
echo "-------------------------------------------"

read -p "1. Nama Lengkap Target : " full_name
read -p "2. Username (Sosmed/Game): " username
read -p "3. Nomor HP (Ex: 628xx)  : " phone

echo ""
echo -e "${YELLOW}[!] Mengumpulkan database OSINT...${NC}"
sleep 1
echo -e "${YELLOW}[!] Mengonfigurasi parameter pencarian...${NC}"
sleep 1
echo -e "${GREEN}[✓] Data siap! Berikut hasil analisis manual:${NC}"
echo ""

# -- Logic Pengolahan Data --

# 1. PENCARIAN BERDASARKAN USERNAME
if [[ -n "$username" ]]; then
    echo -e "${PURPLE}--- [ JEJAK USERNAME: $username ] ---${NC}"
    echo -e "${CYAN}[>] Cek Sosial Media Utama:${NC}"
    echo -e "    Instagram : ${WHITE}https://www.instagram.com/$username${NC}"
    echo -e "    TikTok    : ${WHITE}https://www.tiktok.com/@$username${NC}"
    echo -e "    Twitter/X : ${WHITE}https://twitter.com/$username${NC}"
    echo -e "    Facebook  : ${WHITE}https://www.facebook.com/$username${NC}"
    echo -e "    GitHub    : ${WHITE}https://github.com/$username${NC}"
    
    echo -e "\n${CYAN}[>] Cek Ketersediaan Global (Namechk):${NC}"
    echo -e "    Link: ${WHITE}https://knowem.com/checkusername/?target=$username${NC}"
else
    echo -e "${RED}[X] Username tidak diinput, melewati modul ini.${NC}"
fi

echo ""

# 2. PENCARIAN BERDASARKAN NAMA (Google Dorks)
if [[ -n "$full_name" ]]; then
    # Mengganti spasi dengan + untuk URL
    name_url=${full_name// /+}
    
    echo -e "${PURPLE}--- [ JEJAK DIGITAL NAMA: $full_name ] ---${NC}"
    echo -e "${CYAN}[>] Pencarian Google Spesifik (Dorking):${NC}"
    echo -e "    Cari Dokumen PDF/Doc : ${YELLOW}https://www.google.com/search?q=\"$name_url\"+filetype:pdf+OR+filetype:doc${NC}"
    echo -e "    Cari di LinkedIn     : ${YELLOW}https://www.google.com/search?q=site:linkedin.com/in/+\"$name_url\"${NC}"
    echo -e "    Cari di Facebook     : ${YELLOW}https://www.google.com/search?q=site:facebook.com+\"$name_url\"${NC}"
    echo -e "    Cari Berita/Artikel  : ${YELLOW}https://www.google.com/search?q=intext:\"$name_url\"${NC}"
else
    echo -e "${RED}[X] Nama tidak diinput, melewati modul ini.${NC}"
fi

echo ""

# 3. PENCARIAN BERDASARKAN NOMOR HP
if [[ -n "$phone" ]]; then
    # Hapus karakter non-angka
    clean_phone=$(echo $phone | tr -dc '0-9')
    
    echo -e "${PURPLE}--- [ JEJAK NOMOR HP: $clean_phone ] ---${NC}"
    echo -e "${CYAN}[>] Direct Access:${NC}"
    echo -e "    WhatsApp Chat : ${GREEN}https://wa.me/$clean_phone${NC}"
    echo -e "    Telegram      : ${GREEN}https://t.me/+$clean_phone${NC}"
    
    echo -e "\n${CYAN}[>] Database Identitas:${NC}"
    echo -e "    TrueCaller    : ${WHITE}https://www.truecaller.com/search/id/$clean_phone${NC}"
    echo -e "    Sync.Me       : ${WHITE}https://sync.me/search?number=$clean_phone${NC}"
else
    echo -e "${RED}[X] Nomor HP tidak diinput, melewati modul ini.${NC}"
fi

echo ""
echo "==========================================="
echo -e "${YELLOW}TIPS:${NC} Salin link di atas dan buka di browser untuk melihat detail."
echo -e "${CYAN}SADIS Tools - Created By Ronis${NC}"
echo "==========================================="
