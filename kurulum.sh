#!/usr/bin/env bash
# kurulum.sh - mobsec-repo'yu uzak bir PC'ye SSH üzerinden kurar.
# Kullanım: ./kurulum.sh <hedef_ip> <hedef_kullanici>

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Kullanım: ./kurulum.sh <hedef_ip> <hedef_kullanici>"
    echo "Örnek: ./kurulum.sh 192.168.1.100 ubuntu"
    exit 1
fi

TARGET_IP="$1"
TARGET_USER="$2"
TARGET_DIR="/home/$TARGET_USER/mobsec-repo"

echo "[i] Hedef: ${TARGET_USER}@${TARGET_IP}:${TARGET_DIR}"

# 1. Dosyaları kopyala
echo "[+] Dosyalar kopyalanıyor (rsync)..."
rsync -avz --exclude '.git' --exclude '.env' --exclude '*.log' --exclude '*.bak' \
    ./ "${TARGET_USER}@${TARGET_IP}:${TARGET_DIR}/"

if [ $? -ne 0 ]; then
    echo "[!] Dosya kopyalama başarısız oldu."
    exit 1
fi

# 2. Uzak makinede install.sh çalıştır
echo "[+] Uzak makinede kurulum başlatılıyor..."
ssh -t "${TARGET_USER}@${TARGET_IP}" "cd ${TARGET_DIR} && sudo ./install.sh"

if [ $? -eq 0 ]; then
    echo "[✓] Uzak kurulum başarıyla tamamlandı."
    echo "[i] Hedef makineye bağlanıp '.env' ayarlarınızı yapabilirsiniz."
else
    echo "[!] Uzak kurulumda hata oluştu."
fi
