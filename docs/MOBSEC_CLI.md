# Mobsec CLI Rehberi

`mobsec`, 4G/5G, IMS ve Radyo katmanlarının tek merkezden yönetilmesini sağlayan komut satırı aracıdır.

## Kullanım Sözdizimi

```bash
sudo ./mobsec <komut> [hedef] [parametreler]
```

## Temel Komutlar

### 1. status
Sistemin genel durumunu, çalışan konteynerleri ve IP/Port bilgilerini özetler.
```bash
sudo ./mobsec status
```

### 2. start / stop
Belirli bir modülü veya tüm sistemi başlatır/durdurur. `--force` parametresiyle önceki hataları ezerek işlemi zorlayabilirsiniz.
```bash
sudo ./mobsec start all
sudo ./mobsec stop 4g
sudo ./mobsec start 5g --force
sudo ./mobsec stop radyo
```
**Modüller:** `4g`, `5g`, `core`, `radyo`, `all`

**Not:** Sistemde 4G'den 5G'ye geçerken, CLI `P-CSCF` geçişini (WITH_RX veya WITH_N5) algılar ve otomatik olarak ilgili container'ı yeniden başlatarak precondition gereksinimlerini karşılar.

### 3. subscriber
Abone yönetimini (Open5GS WebUI ve pyHSS) CLI üzerinden yapmanızı sağlar.

- **Abone Ekleme:**
  ```bash
  sudo ./mobsec subscriber add <IMSI> <KI> <OPC> <MSISDN> <IPv4>
  # Örnek: sudo ./mobsec subscriber add 001010000000001 KI_XXX OPC_XXX 905551234567 10.45.0.2
  ```

- **Abone Silme:**
  ```bash
  sudo ./mobsec subscriber del <IMSI>
  ```

- **Abone Listeleme / Görüntüleme:**
  ```bash
  sudo ./mobsec subscriber show <IMSI>
  ```

- **MSISDN Güncelleme:**
  ```bash
  sudo ./mobsec subscriber set-msisdn <IMSI> <YENI_MSISDN>
  ```

### 4. calibrate
USRP (B210 vb.) veya Sysmo radyo cihazları için kalibrasyon ayarlarını yapar.

```bash
sudo ./mobsec calibrate power 80
sudo ./mobsec calibrate arfcn 3000
sudo ./mobsec calibrate plmn 001 01
```
