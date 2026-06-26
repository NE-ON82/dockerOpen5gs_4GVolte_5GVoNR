# Abone Ekleme (Open5GS & pyHSS)

Bu belgede, 4G/VoLTE ve 5G/VoNR testleri için abone ekleme adımları açıklanmaktadır. İşlemi CLI üzerinden veya Web Arayüzü/Swagger üzerinden manuel olarak yapabilirsiniz.

> **ÖNEMLİ:** Buradaki değerler örnektir. Gerçek Ki ve OPc şifrelerini asla kod veya döküman içine yazmayın.

## Yöntem 1: neon CLI Kullanımı (Önerilen)

Tüm veritabanı işlemlerini (WebUI + pyHSS) tek seferde yapan komut:

```bash
sudo ./neon subscriber add <IMSI> <KI> <OPC> <MSISDN> <IPv4>
```

Örnek Kullanım:
```bash
sudo ./neon subscriber add 001010000000001 KI_PLACEHOLDER OPC_PLACEHOLDER 905330000000 10.45.0.10
```

Bu komut sırasıyla:
1. Open5GS MongoDB'ye IMSI, Ki, OPc değerlerini ve APN (internet, ims) yetkilerini ekler.
2. pyHSS (IMS tarafı) veritabanına `mnc001.mcc001.3gppnetwork.org` domaini ile abone profilini tanımlar.

## Yöntem 2: Manuel Eklemek (pyHSS Swagger & Open5GS WebUI)

### 1. Open5GS WebUI
1. Tarayıcıdan `http://<HOST_IP>:9999` adresine gidin.
2. Kullanıcı adı `admin`, şifre `<WEBUI_PASSWORD>` ile giriş yapın.
3. **Add Subscriber** diyerek IMSI (`001010000000001`), Ki ve OPc bilgilerini girin.
4. Profil kısmında `internet` (IPv4) ve `ims` (IPv4) APN'lerini tanımlayın.

### 2. pyHSS Swagger
1. Tarayıcıdan `http://<HOST_IP>:8080/docs` adresine gidin.
2. Abone eklerken pyHSS mimarisi gereği şu sırayı takip etmelisiniz:
   - **APN:** (Eğer yoksa) `ims` APN'ini ekle.
   - **AUC:** IMSI, Ki, OPc değerlerini Authentication Center tablosuna gir.
   - **Subscriber:** MSISDN ve IMSI eşleştirmesini yap.
   - **IMS_Subscriber:** Aboneyi `mnc001.mcc001.3gppnetwork.org` SIP Realm'i ile IMS Core'a tanıt.
