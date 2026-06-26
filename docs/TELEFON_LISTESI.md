# Test Edilen Telefon Listesi

Aşağıdaki cihazlar bu laboratuvar ortamında bizzat test edilmiş ve bulgular listelenmiştir. Özel radyo yapılandırmalarında telefonun band (n3, n78 vs.) ve özellik desteği kritik rol oynar.

| Marka / Model | Destek / Durum | Gözlem ve Bulgular |
| :--- | :--- | :--- |
| **Xiaomi 11T Pro** | 5G SA (VoNR) Çalıştı | N3 bandı destekli. 5G SA şebekesinde internet, VoNR (ses) araması ve SMS testleri başarılı. |
| **Redmi Note 12 5G** | İncelendi | - |
| **Samsung Galaxy A17** | 5G SA (VoNR) Çok İyi | IMS ve VoNR entegrasyonu en pürüzsüz çalışan cihaz. SIP/SDP paketlerinde precondition olmadan aramayı kusursuz kuruyor. SMS sorunsuz. APN ayarını otomatik buluyor. |

## Notlar

- Telefonların **Carrier Policy** sınırları sebebiyle bazı 5G SA şebekeleri (özellikle PLMN 001/01 olan test ağları) için ek müdahale (örn. Qualcomm QPST araçları veya root ile Carrier Config değişimi) gerekebilir.
- Samsung cihazlarda `ims` APN genellikle otomatik tanınır, Xiaomi cihazlarda ise `APN_AYARI.md` içerisindeki adımların harfiyen uygulanması gerekir.
