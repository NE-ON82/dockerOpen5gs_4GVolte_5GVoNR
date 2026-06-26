# NAT ve İnternet Çıkışı

Konteyner içerisindeki telefonların (UE) gerçek internete çıkabilmesi için, Open5GS UPF (User Plane Function) ile dış dünyaya bakan ağ arayüzü arasında iptables kuralları tanımlanmalıdır.

## 1. UPF TUN/TAP Arayüzleri

UPF varsayılan olarak `ogstun` arayüzünü oluşturur. UE'lere bu arayüz üzerinden IP verilir (Örn: `10.45.0.0/16` internet, `10.46.0.0/16` ims).

Arayüzlerin listesini görmek için:
```bash
ip addr show ogstun
```

## 2. IP Forwarding Aktifleştirme

Sunucunuzda paket yönlendirmenin (IP Forwarding) aktif olması gerekir:
```bash
# Geçici aktifleştirme:
sudo sysctl -w net.ipv4.ip_forward=1

# Kalıcı aktifleştirme (/etc/sysctl.conf içine ekleyin):
# net.ipv4.ip_forward=1
# sudo sysctl -p
```

## 3. iptables NAT (Masquerade) Kuralı

Telefondan gelen trafiği gerçek ağ kartınızın IP'si üzerinden internete çıkarmak için NAT gereklidir. `eth0` kısmını fiziksel ethernet veya Wi-Fi kartınızın (örneğin `enp3s0` veya `wlan0`) adıyla değiştirin.

```bash
# Giden trafiği maskele
sudo iptables -t nat -A POSTROUTING -s 10.45.0.0/16 -o eth0 -j MASQUERADE

# UFW kullanıyorsanız (Opsiyonel)
sudo ufw route allow in on ogstun out on eth0
```

Bu ayarlardan sonra telefondan açtığınız bir YouTube videosu veya tarayıcı trafiği başarıyla ana makinenizin internet bağlantısını kullanacaktır.
