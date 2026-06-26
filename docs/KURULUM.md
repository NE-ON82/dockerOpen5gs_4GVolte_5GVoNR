# Kurulum Rehberi

Bu repo, Open5GS ve IMS altyapısını Docker üzerinde otomatik olarak kurar ve derler.

## Ön Koşullar

- Ubuntu 20.04 veya 22.04 LTS (Önerilen)
- Kök (root) yetkileri
- İnternet erişimi

## 1. Bağımlılıkların Kurulumu ve İmaj Derleme

`install.sh` betiği gerekli bağımlılıkları (Docker, jq, curl) kurar ve Docker imajlarını (base, ims_base) derler.

```bash
sudo ./install.sh
```

**Not:** Bu işlem internet hızına ve donanım gücüne bağlı olarak yaklaşık 15-20 dakika sürebilir.

## 2. Çevre Değişkenlerinin Ayarlanması

Kurulum tamamlandıktan sonra, örnek `.env` dosyasını kopyalayın ve kendi IP adresinize göre yapılandırın.

```bash
cd docker_open5gs
cp .env.example .env
nano .env
```

`.env` dosyasında aşağıdaki satırları kendi sunucu IP adresiniz ile değiştirin:
```ini
DOCKER_HOST_IP=<HOST_IP>
```

## 3. Uzak Sunucuya Kurulum (İsteğe Bağlı)

Eğer bu yapıyı farklı bir makineye kurmak istiyorsanız, `kurulum.sh` betiğini kullanabilirsiniz. Bu betik, ilgili dosyaları SSH üzerinden hedefe kopyalar ve uzaktan `install.sh` komutunu çalıştırır.

Kullanım:
```bash
./kurulum.sh <hedef_ip> <kullanici_adi>
# Örnek: ./kurulum.sh 192.168.1.50 ubuntu
```

## 4. Sistemin Başlatılması

Tüm ayarlar bittikten sonra sistemi `neon` CLI üzerinden başlatabilirsiniz:

```bash
sudo ./neon start all
```

Sistem durumunu kontrol etmek için:
```bash
sudo ./neon status
```
