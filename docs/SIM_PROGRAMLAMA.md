# SIM Kart Programlama

Boş ve yazılabilir SIM kartlarına (Sysmocom, Gomspace vb.) abone profili yükleme rehberidir.

## Ön Koşullar

- PCSC uyumlu Smart Card Okuyucu
- `pySim` (Osmocom pySim) kütüphanesi
- Programlanabilir SIM kartı (örneğin SysmoISIM-SJA2)

## 1. pySim Kurulumu

```bash
git clone https://gitea.osmocom.org/sim-card/pysim.git
cd pysim
pip3 install -r requirements.txt
```

## 2. Kartın Programlanması

SIM kartı okuyucuya takıp aşağıdaki komutu kendi bilgilerinizle çalıştırın. `KI` ve `OPC` alanlarına kendiniz belirlediğiniz 32 karakterlik (16-byte hex) sırları yazın.

> **Uyarı:** `KI_PLACEHOLDER` veya `OPC_PLACEHOLDER` değerlerini doğrudan KULLANMAYIN; 16-byte'lık geçerli HEX formatında şifreler oluşturun (örneğin `00112233445566778899AABBCCDDEEFF`).

```bash
./pySim-prog.py -p 0 \
  -x 001 -y 01 \
  -i 001010000000001 \
  -s 89882110000000000001 \
  -k KI_PLACEHOLDER \
  -o OPC_PLACEHOLDER \
  -t sysmoISIM-SJA2
```

## 3. VoLTE & ISIM Parametreleri (Önemli)

VoLTE ve VoNR bağlantıları için SIM kartında ISIM (IP Multimedia Services Identity Module) uygulamasının düzgün ayarlanmış olması şarttır. P-CSCF adresi ve SIP URI bilgileri genellikle kartta ön tanımlı olarak `mnc001.mcc001.3gppnetwork.org` domainine uyumlu ayarlanmalıdır. 

Eğer IMS kaydı sırasında cihaz SIP REGISTER isteğini P-CSCF'e ulaştırmıyorsa, sorun SIM kartın ISIM profilindeki EF_IMPI veya EF_IMPU eksikliği olabilir.
