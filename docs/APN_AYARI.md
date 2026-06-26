# Mobil Cihaz APN Ayarları

Test şebekesine bağlanan telefonlarda İnternet ve VoLTE/VoNR çağrıları için Access Point Name (APN) ayarlarının yapılması şarttır.

*(Kullanıcı buraya daha sonra ekran videosu ekleyecek - [VIDEO_PLACEHOLDER])*

## 1. İnternet APN'i

Telefonun hücresel veri ayarlarından yeni bir APN ekleyin:

- **İsim:** İnternet (İsteğe bağlı)
- **APN:** `internet`
- **APN Türü (APN Type):** `default,supl,mms`
- **APN Protokolü:** IPv4
- **Dolaşım (Roaming) Protokolü:** IPv4

Kaydedip seçin. Cihaz bağlandığında hücresel veri (4G/5G) ikonunu göreceksiniz.

## 2. IMS APN'i

VoLTE (Voice over LTE) ve VoNR (Voice over New Radio) hizmetleri için özel IMS tünelinin açılması gerekir. Yeni bir APN ekleyin:

- **İsim:** IMS (İsteğe bağlı)
- **APN:** `ims`
- **APN Türü (APN Type):** `ims` (Başka hiçbir şey yazmayın)
- **APN Protokolü:** IPv4

**ÖNEMLİ NOT:**
IMS APN'ini telefon menüsünden *SEÇMEYİN* (Zaten yanındaki radyo butonu kaybolacaktır). Telefon `ims` APN'ini algılar ve arkaplanda gizli PDU session / dedicated bearer oluşturur.

**Özel Cihaz Notu:** Samsung cihazlar, uygun ISIM'e sahip bir test SIM kartı takıldığında `ims` APN'ini otomatik algılar ve ayarlar kısmında bile göstermeden arka planda konfigüre eder. Diğer Android markalarında manuel girilmesi genelde zorunludur.
