# 4G ve 5G Geçişli Mimari

Bu sistemin en kritik özelliklerinden biri aynı veritabanını kullanan 4G ve 5G çekirdeklerini çalıştırabilmesi, ancak **P-CSCF mimarisi gereği paralel çalışamamasıdır.**

## Çakışmanın Sebebi: P-CSCF ve Policy Control

Kamailio tabanlı P-CSCF modülü derlenirken, ağın Policy (Kural/QoS) fonksiyonuna nasıl bağlanacağı belirlenir:
- **4G (VoLTE) için:** `WITH_RX` parametresi aktiftir ve Diameter üzerinden **PCRF** ile haberleşir.
- **5G (VoNR) için:** `WITH_N5` parametresi aktiftir ve HTTP/2 üzerinden **PCF** ile haberleşir.

Bir P-CSCF bileşeni aynı anda hem Rx hem N5 sinyalleşmesini idare edemez. Bu nedenle 4G ortamından 5G ortamına geçerken (veya tam tersi) P-CSCF yapılandırması (config dosyasında `#define WITH_RX` veya `#define WITH_N5`) yeniden ayarlanmalı ve konteyner yeniden başlatılmalıdır.

## neon CLI Otomatik Geçiş Mekanizması

`neon` CLI, bu handikapı aşmak üzere tasarlanmıştır:
- `sudo ./neon start 5g` çalıştırdığınızda, CLI ilk olarak 4G'nin kapalı olduğundan emin olur (Transition Strategy).
- Ardından `pcscf.cfg` içerisindeki makroları tarar. Eğer `WITH_RX` aktifse, bunu otomatik olarak `WITH_N5` ile değiştirir, P-CSCF'i yeniden başlatır.
- Böylece VoNR çağrılarındaki `P-CSCF <-> PCF` iletişimi sorunsuz gerçekleşir ve SIP davetleri kopmaz.

## Precondition (183 Session Progress) Bulgusu

5G VoNR aramalarında cihazlar QCI-1 (Ses için Dedicated Bearer) tahsisini şart koşarlar (Precondition). `WITH_N5` açılmadan yapılan aramalarda PCF bilgilendirilmediği için PDU session policy'si ses trafiği için ayrılmaz. Bu durumda telefonlar "Calling..." ekranında takılı kalır veya SIP 488 Not Acceptable / 503 Service Unavailable hatalarıyla çağrıyı düşürürler. N5 aktif edildiğinde precondition'lar doğru işlenir.
