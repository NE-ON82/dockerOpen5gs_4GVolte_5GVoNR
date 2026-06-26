#!/usr/bin/env bash
# install.sh - Open5GS + IMS ortamını derler ve hazırlar.
# Bağımlılıkları kurar, docker imajlarını çeker/derler.

set -e

echo "[i] Root yetkileri kontrol ediliyor..."
if [ "$EUID" -ne 0 ]; then
  echo "[!] Lütfen sudo ile çalıştırın: sudo ./install.sh"
  exit 1
fi

echo "[i] Bağımlılıklar kuruluyor..."
apt-get update
apt-get install -y docker.io docker-compose curl jq git

echo "[i] Docker servisi başlatılıyor..."
systemctl enable docker
systemctl start docker

# Dizin tespiti
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OPEN5GS_DIR="${SCRIPT_DIR}/docker_open5gs"

if [ ! -d "${OPEN5GS_DIR}" ]; then
  echo "[!] docker_open5gs dizini bulunamadı! Lütfen repoyu eksiksiz indirin."
  exit 1
fi

echo "[i] Base imajlar derleniyor..."
cd "${OPEN5GS_DIR}"

if [ -d "base" ]; then
    echo "[+] open5gs/base derleniyor..."
    cd base && docker build -t open5gs/base . && cd ..
else
    echo "[-] base dizini yok, atlanıyor."
fi

if [ -d "ims_base" ]; then
    echo "[+] kamailio/ims_base derleniyor..."
    cd ims_base && docker build -t kamailio/ims_base . && cd ..
else
    echo "[-] ims_base dizini yok, atlanıyor."
fi

echo "[i] Diğer imajlar (docker-compose) çekiliyor/derleniyor..."
docker-compose -f 4g-volte-deploy.yaml build
docker-compose -f 4g-volte-deploy.yaml pull

echo "[i] Kurulum tamamlandı."
echo "[i] '.env.example' dosyasını '.env' olarak kopyalayın ve içerisindeki <HOST_IP> alanlarını düzenleyin."
echo "[i] Başlamak için CLI'yi kullanın: sudo ./neon start"
