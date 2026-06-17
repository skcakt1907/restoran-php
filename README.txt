============================================================
RESTORAN / KAFE TEMASI — KURUMSAL WEB SİTESİ
PHP + MySQL + Bootstrap 5   (Demo marka: Lezzet Konağı)
============================================================

KURULUM (yerel WAMP / canlı sunucu)
------------------------------------------------------------
1. Dosyaları sunucuya yükleyin
   - Tüm klasörü web kök dizinine kopyalayın (örn: public_html/)

2. Veritabanı oluşturun
   - cPanel / phpMyAdmin'de yeni bir DB oluşturun (örn: restoran_db)
   - kurulum.sql dosyasını import edin
   - 7 tablo + örnek veriler otomatik yüklenir

3. Veritabanı bağlantı bilgilerini düzenleyin
   - inc/config.php dosyasını açın
   - DB_HOST, DB_NAME, DB_USER, DB_PASS değerlerini doldurun
   - SITE_URL değerini gerçek domaininizle değiştirin
   - Canlı sunucuda DEBUG'i false yapın
   - Alt klasörde çalışıyorsa .htaccess içindeki RewriteBase'i güncelleyin

4. uploads/ klasörüne yazma izni verin
   - chmod 755 uploads/    (Linux)

5. Admin paneline giriş yapın
   - URL: https://siteniz.com/admin/
   - Kullanıcı: admin   Şifre: admin123
   - !!! Giriş yaptıktan sonra şifrenizi MUTLAKA değiştirin !!!

------------------------------------------------------------
SEKTÖRE ÖZEL ETİKETLER
------------------------------------------------------------
Bu temada motor "kurumsal/hizmet" altyapısıdır; etiketler restorana
uyarlanmıştır:
  Hizmetler  → Menümüz (lezzet kategorileri)
  Projeler   → Galeri (mekan + yemek fotoğrafları)
  Blog       → Lezzet Köşesi
  Teklif Al  → Rezervasyon (online rezervasyon formu)
Admin panelindeki "Rezervasyonlar" bölümü masa taleplerini listeler.

------------------------------------------------------------
DOSYA YAPISI
------------------------------------------------------------
├── index.php             Anasayfa
├── hakkimizda.php        Hakkımızda
├── hizmetler.php         Menü kategorileri
├── hizmet-detay.php      Tek kategori sayfası (?slug=...)
├── projeler.php          Galeri (filtreli)
├── proje-detay.php       Tek galeri öğesi (?slug=...)
├── blog.php              Lezzet köşesi listesi
├── blog-detay.php        Tek yazı (?slug=...)
├── iletisim.php          İletişim formu + harita
├── teklif.php            Online rezervasyon formu
│
├── inc/                  config, db, helpers, header, footer
├── admin/                Yönetim paneli (login, CRUD'lar, ayarlar)
├── css/style.css         Tema CSS (kırmızı/turuncu sıcak palet)
├── js/main.js            Navbar scroll efekti
├── uploads/              Yüklenen görseller (PHP engelli)
└── kurulum.sql           DB şema + örnek veri

------------------------------------------------------------
TEKNİK DETAYLAR
------------------------------------------------------------
- PHP 7.4+ (önerilen 8.x), MySQL 5.7+ / MariaDB
- PDO prepared statements, CSRF token, password_hash (bcrypt)
- XSS koruması (e() htmlspecialchars)
- Bootstrap 5.3.2 + Bootstrap Icons 1.11 (CDN)
- Responsive (mobil uyumlu)

------------------------------------------------------------
RENK PALETİ
------------------------------------------------------------
Birincil  : #c0392b (kiremit kırmızı)
Vurgu     : #e67e22 (turuncu)
Koyu      : #1a120b (koyu kahve)
Açık      : #fdf6ee (krem)
- css/style.css → :root değişkenlerinden değiştirebilirsiniz

------------------------------------------------------------
DESTEK / NOTLAR
------------------------------------------------------------
- Yerel test:   http://localhost/restoran-php/
- Admin:        /admin/  (admin / admin123)
- DB import:    phpMyAdmin → Import → kurulum.sql

İyi çalışmalar!
