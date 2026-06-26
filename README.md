# Neon - 4G/5G ve IMS Otomasyon Altyapısı

Neon, **Open5GS** ve **Kamailio (IMS)** tabanlı, 4G (VoLTE) ve 5G Standalone (VoNR) ağları kurmayı, yönetmeyi ve mobil cihazlara SMS/Arama hizmeti vermeyi sağlayan kapsamlı bir otomasyon ortamıdır. B210 (USRP) ve Sysmo SDR radyolarıyla tam uyumlu çalışan bu altyapı, tüm alt sistemleri `neon` isimli tek bir CLI üzerinden yönetilebilir hale getirir.

## Özellikler

| Özellik | Destek / Durum | Açıklama |
| :--- | :--- | :--- |
| **4G / LTE Core** | ✅ Aktif | Open5GS MME, SGW, PGW, HSS, PCRF bileşenleri. |
| **5G SA Core** | ✅ Aktif | Open5GS AMF, SMF, UPF, UDM, PCF bileşenleri. |
| **IMS & VoLTE** | ✅ Aktif | Kamailio (P/I/S-CSCF) ve pyHSS ile SIP haberleşmesi, Rx arayüzü. |
| **5G VoNR** | ✅ Aktif | N5 arayüzü üzerinden PCF & P-CSCF tam entegrasyonu. |
| **SMS** | ✅ Aktif | OsmoSMSC üzerinden IMS entegre metin mesajlaşma. |
| **CLI Yönetimi** | ✅ Aktif | Tek komutla sistem başlatma, durdurma ve abone yönetimi (`neon`). |

## Hızlı Başlangıç

Sistemi Ubuntu makinenizde kurmak için aşağıdaki adımları izleyin:

```bash
# 1. Repoyu klonlayıp dizine girin
cd neon-repo

# 2. Bağımlılıkları yükleyin ve İmajları derleyin (Sudo gereklidir)
sudo ./install.sh

# 3. .env dosyanızı oluşturun ve kendi IP adresinizi ayarlayın
cd docker_open5gs
cp .env.example .env
nano .env # DOCKER_HOST_IP=<HOST_IP> kısmına kendi sunucu IP'nizi yazın
cd ..

# 4. Neon CLI ile tüm sistemi başlatın
sudo ./neon start all
```

## Dokümantasyon ve Rehberler

Detaylı kullanım ve özel durumlar için `docs/` klasöründeki rehberleri inceleyin:

1. [Kurulum Rehberi (KURULUM.md)](docs/KURULUM.md)
2. [CLI Kullanımı (NEON_CLI.md)](docs/NEON_CLI.md)
3. [Abone Ekleme İşlemleri (ABONE_EKLEME.md)](docs/ABONE_EKLEME.md)
4. [SIM Kart Programlama (SIM_PROGRAMLAMA.md)](docs/SIM_PROGRAMLAMA.md)
5. [Telefon APN Ayarları (APN_AYARI.md)](docs/APN_AYARI.md)
6. [NAT / İnternet Çıkış Ayarı (NAT_INTERNET.md)](docs/NAT_INTERNET.md)
7. [Test Edilen Telefonlar (TELEFON_LISTESI.md)](docs/TELEFON_LISTESI.md)
8. [4G - 5G Geçişli Mimari (4G_5G_GECIS.md)](docs/4G_5G_GECIS.md)
