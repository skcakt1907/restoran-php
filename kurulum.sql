-- ============================================
-- RESTORAN / KAFE TEMASI — Kurulum SQL
-- (tema-master Kurumsal/Hizmet arketipinden türetildi)
-- Kullanım: phpMyAdmin > Import  (veya: mysql -u root < kurulum.sql)
-- ============================================
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE IF NOT EXISTS `restoran_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `restoran_db`;

-- ============ AYARLAR ============
DROP TABLE IF EXISTS `ayarlar`;
CREATE TABLE `ayarlar` (
  `anahtar` VARCHAR(80) NOT NULL PRIMARY KEY,
  `deger` TEXT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ayarlar` (`anahtar`,`deger`) VALUES
('site_adi','Lezzet Konağı'),
('site_baslik','Lezzet Konağı — Restoran & Kafe'),
('site_aciklama','Geleneksel tariflerle modern sunumu buluşturan mutfağımız, sıcak atmosferimiz ve güler yüzlü ekibimizle sizi ağırlamaktan mutluluk duyarız.'),
('telefon','+90 555 000 00 00'),
('telefon2','+90 532 000 00 00'),
('mail','info@lezzetkonagi.com'),
('adres','Merkez Mah. Lezzet Sok. No:7, Kadıköy / İstanbul'),
('calisma_saati','Her gün: 09:00 - 23:30'),
('hakkimizda_kisa','Lezzet Konağı, taze ve mevsiminde malzemeyle hazırlanan özgün tatları, samimi atmosferiyle buluşturan bir aile restoranıdır. Kahvaltıdan akşam yemeğine günün her saati lezzet sunuyoruz.'),
('hakkimizda_uzun','Lezzet Konağı olarak kapılarımızı açtığımız ilk günden bu yana tek bir hedefimiz var: misafirlerimize unutulmaz bir lezzet deneyimi yaşatmak. Mutfağımızda her tabak, günlük taze malzemelerle ve ustalarımızın el emeğiyle hazırlanır. Zengin kahvaltı büfemiz, mangal ateşinde pişen ızgaralarımız, taş fırın pizzalarımız ve ev yapımı tatlılarımızla her damak zevkine hitap ediyoruz. Ailenizle keyifli bir akşam yemeği, sevdiklerinizle hafta sonu kahvaltısı ya da iş yemeği — geniş salonumuz, bahçemiz ve özel etkinlik alanımızla her davete hazırız.'),
('misyon','Misafirlerimize taze, kaliteli ve özgün lezzetleri, sıcak bir atmosfer ve kusursuz hizmetle sunmak; her ziyareti keyifli bir deneyime dönüştürmek.'),
('vizyon','Şehrin lezzet denince akla gelen ilk adresi olmak; geleneksel mutfağı yaşatırken yenilikçi tatlarla fark yaratmak.'),
('yil','12'),
('proje_sayi','150'),
('musteri_sayi','75000'),
('personel_sayi','30'),
('facebook','#'),('instagram','#'),('twitter','#'),('linkedin','#'),('youtube','#');

-- ============ HİZMETLER (MENÜ KATEGORİLERİ) ============
DROP TABLE IF EXISTS `hizmetler`;
CREATE TABLE `hizmetler` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `baslik` VARCHAR(150) NOT NULL,
  `slug` VARCHAR(180),
  `ozet` TEXT,
  `icerik` LONGTEXT,
  `ikon` VARCHAR(60) DEFAULT 'bi-cup-hot',
  `gorsel` VARCHAR(255),
  `sira` INT DEFAULT 0,
  `durum` TINYINT DEFAULT 1,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `hizmetler` (`baslik`,`slug`,`ozet`,`icerik`,`ikon`,`gorsel`,`sira`) VALUES
('Serpme Kahvaltı','serpme-kahvalti','Köy peynirleri, ev reçelleri, sıcak hamur işleri ve sınırsız çayla zengin serpme kahvaltı.','Her gün 09:00-13:00 arası servis edilen serpme kahvaltımız; yöresel peynir çeşitleri, ev yapımı reçeller, zeytin tabağı, bal-kaymak, sigara böreği, pişi, menemen ve sınırsız demleme çay içerir. Kalabalık aileler için özel kahvaltı salonumuz mevcuttur.','bi-sun','https://images.unsplash.com/photo-1533089860892-a7c6f0a88666?w=800&q=80',1),
('Ana Yemekler','ana-yemekler','Geleneksel Türk mutfağından güveç, tandır ve ev yemeği klasikleri.','Mutfağımızın kalbi olan ana yemek menümüzde; kuzu tandır, testi kebabı, hünkar beğendi, karnıyarık ve günlük değişen ev yemekleri bulunur. Tüm yemeklerimiz günlük taze malzemeyle, geleneksel tariflere sadık kalınarak hazırlanır.','bi-egg-fried','https://images.unsplash.com/photo-1544025162-d76694265947?w=800&q=80',2),
('Izgara & Kebap','izgara-kebap','Mangal ateşinde ustalıkla pişen ızgara ve kebap çeşitleri.','Meşe kömürü ateşinde pişen Adana ve Urfa kebabımız, kuzu şiş, pirzola, köfte ve karışık ızgara tabaklarımız; közlenmiş sebze, bulgur pilavı ve ezme eşliğinde servis edilir. Etlerimiz günlük olarak güvenilir tedarikçilerden temin edilir.','bi-fire','https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=800&q=80',3),
('Taş Fırın Pizza & Makarna','pizza-makarna','İtalyan usulü taş fırın pizzalar ve ev yapımı makarnalar.','Odun ateşli taş fırınımızda incecik hamuruyla pişen Margherita, Quattro Formaggi ve özel Lezzet Konağı pizzamızın yanı sıra; günlük hazırlanan taze makarnalarımızı zengin sos seçenekleriyle sunuyoruz.','bi-circle-half','https://images.unsplash.com/photo-1513104890138-7c749659a591?w=800&q=80',4),
('Tatlılar','tatlilar','Ev yapımı şerbetli tatlılar, sütlü tatlılar ve günün pastaları.','Tatlı mutfağımızdan; künefe, fırın sütlaç, trileçe, San Sebastian cheesecake ve mevsim meyveli pastalar. Tüm tatlılarımız kendi imalathanemizde günlük üretilir. Özel gün pastası siparişi alınır.','bi-cake2','https://images.unsplash.com/photo-1551024506-0bccd828d307?w=800&q=80',5),
('Kahve & İçecekler','kahve-icecekler','Özenle demlenen kahveler, taze sıkım meyve suları ve serinletici içecekler.','Baristalarımızın hazırladığı espresso bazlı kahveler, közde Türk kahvesi, bitki çayları, taze sıkım portakal ve nar suyu, ev yapımı limonata ve kış aylarına özel salep ile gününüze keyif katın.','bi-cup-hot','https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=800&q=80',6);

-- ============ PROJELER → GALERİ ============
DROP TABLE IF EXISTS `projeler`;
CREATE TABLE `projeler` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `baslik` VARCHAR(150) NOT NULL,
  `slug` VARCHAR(180),
  `kategori` VARCHAR(60),
  `gorsel` VARCHAR(255),
  `aciklama` TEXT,
  `tarih` VARCHAR(40),
  `sira` INT DEFAULT 0,
  `durum` TINYINT DEFAULT 1,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `projeler` (`baslik`,`slug`,`kategori`,`gorsel`,`aciklama`,`tarih`,`sira`) VALUES
('Ana Salon','ana-salon','Mekan','https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=800&q=80','120 kişilik ferah ana salonumuz; aile yemekleri ve kalabalık davetler için ideal.','2026',1),
('Bahçe & Teras','bahce-teras','Mekan','https://images.unsplash.com/photo-1600891964599-f61ba0e24092?w=800&q=80','Yeşillikler içinde, yaz akşamlarının vazgeçilmezi bahçe ve teras alanımız.','2026',2),
('Şefin Tabağı','sefin-tabagi','Lezzetler','https://images.unsplash.com/photo-1414235077428-338989a2e8c0?w=800&q=80','Şefimizin imza tabaklarından kareler — göze ve damağa hitap eden sunumlar.','2026',3),
('Mangal Keyfi','mangal-keyfi','Lezzetler','https://images.unsplash.com/photo-1529193591184-b1d58069ecdd?w=800&q=80','Meşe kömürü ateşinde pişen ızgaralarımızdan enfes kareler.','2025',4),
('Kahvaltı Sofrası','kahvalti-sofrasi','Lezzetler','https://images.unsplash.com/photo-1504754524776-8f4f37790ca0?w=800&q=80','Hafta sonlarının yıldızı zengin serpme kahvaltı sofralarımız.','2025',5),
('Özel Etkinlik Alanı','ozel-etkinlik','Etkinlik','https://images.unsplash.com/photo-1519671482749-fd09be7ccebf?w=800&q=80','Doğum günü, nişan ve iş yemekleri için 60 kişilik özel etkinlik salonumuz.','2025',6);

-- ============ BLOG → LEZZET KÖŞESİ ============
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `baslik` VARCHAR(200) NOT NULL,
  `slug` VARCHAR(200),
  `kategori` VARCHAR(60),
  `ozet` TEXT,
  `icerik` LONGTEXT,
  `gorsel` VARCHAR(255),
  `tarih` DATE,
  `durum` TINYINT DEFAULT 1,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `blog` (`baslik`,`slug`,`kategori`,`ozet`,`icerik`,`gorsel`,`tarih`) VALUES
('Künefenin Sırrı: Tel Kadayıf ve Hatay Peyniri','kunefenin-sirri','Lezzet Hikayeleri','Gerçek bir künefeyi sıradan olandan ayıran üç şey: peynir, kadayıf ve ustalık.','Künefe, basit görünen ama ustalık isteyen bir tatlıdır. Mutfağımızda künefeyi Hatay''dan getirttiğimiz tuzsuz künefe peyniri ve günlük taze tel kadayıfla hazırlıyoruz. Sırrın büyük kısmı ateş kontrolünde: bakır tepside, ocak üzerinde sürekli döndürülerek pişirilen künefe, her noktasında eşit kızarır. Üzerine ılık şerbet ve Antep fıstığı... Afiyet olsun!','https://images.unsplash.com/photo-1571115177098-24ec42ed204d?w=800&q=80','2026-05-18'),
('Evde Demleme Çay Nasıl Yapılır?','evde-demleme-cay','Püf Noktaları','Kahvaltının olmazsa olmazı tavşan kanı çayın püf noktalarını paylaşıyoruz.','Güzel bir demleme çay için: 1) Çaydanlığınızı önce sıcak suyla çalkalayın. 2) Kaliteli dökme çayı demliğe koymadan önce soğuk suyla hızlıca yıkayın — tozundan arınır, parlak demlenir. 3) Suyu tam kaynamadan, "balık gözü" kabarcıklar çıkarken demliğe alın. 4) Kısık ateşte 15-20 dakika demleyin, asla kaynatmayın. Restoranımızda çayı hâlâ odun ateşinde, büyük çaydanlıklarda demliyoruz — farkı ilk yudumda anlarsınız.','https://images.unsplash.com/photo-1564890369478-c89ca6d9cde9?w=800&q=80','2026-04-22'),
('Mevsiminde Beslenmek: Bahar Menümüz Yenilendi','bahar-menusu','Haberler','Enginar, taze bakla ve kuzu etiyle hazırlanan bahar lezzetleri menümüzde.','Mevsiminde tüketilen sebze hem daha lezzetli hem daha besleyicidir. Bahar menümüzde zeytinyağlı enginar, taze baklalı kuzu güveç, ısırgan otlu börek ve çağla badem salatası sizleri bekliyor. Şefimiz her mevsim dönümünde menüyü yerel üreticilerden temin ettiğimiz taze ürünlere göre yeniliyor. Bahar menümüz stoklarla sınırlı — rezervasyonunuzu erken yaptırın.','https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=800&q=80','2026-03-25');

-- ============ REFERANSLAR (MÜŞTERİ YORUMLARI) ============
DROP TABLE IF EXISTS `referanslar`;
CREATE TABLE `referanslar` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `ad` VARCHAR(100) NOT NULL,
  `unvan` VARCHAR(120),
  `yorum` TEXT,
  `foto` VARCHAR(255),
  `yildiz` TINYINT DEFAULT 5,
  `durum` TINYINT DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `referanslar` (`ad`,`unvan`,`yorum`,`foto`,`yildiz`) VALUES
('Elif S.','Müdavim','Kahvaltısı şehirdeki en iyisi, abartısız. Her şey taptaze, çay odun ateşinde demleniyor. Hafta sonu mutlaka rezervasyon yaptırın, doluyor.','https://i.pravatar.cc/100?img=44',5),
('Burak T.','Google Yorumu','Adana kebap tam kıvamında, acısı yağı dengeli. Servis hızlı, fiyatlar yaptığı işe göre gayet makul. Bahçesi yaz akşamları harika.','https://i.pravatar.cc/100?img=11',5),
('Seda & Mert','Nişan Organizasyonu','Nişanımızı etkinlik salonunda yaptık. İlgi, sunum ve lezzet kusursuzdu; misafirlerimiz hâlâ yemekleri konuşuyor. Teşekkürler Lezzet Konağı!','https://i.pravatar.cc/100?img=31',5);

-- ============ MESAJLAR ============
DROP TABLE IF EXISTS `mesajlar`;
CREATE TABLE `mesajlar` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `ad` VARCHAR(100),
  `mail` VARCHAR(150),
  `tel` VARCHAR(40),
  `konu` VARCHAR(200),
  `mesaj` TEXT,
  `okundu` TINYINT DEFAULT 0,
  `tarih` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============ TEKLİFLER (REZERVASYON TALEPLERİ) ============
DROP TABLE IF EXISTS `teklifler`;
CREATE TABLE `teklifler` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `ad` VARCHAR(100),
  `mail` VARCHAR(150),
  `tel` VARCHAR(40),
  `hizmet` VARCHAR(120),
  `il` VARCHAR(60),
  `adres` VARCHAR(255),
  `alan` VARCHAR(60),
  `butce` VARCHAR(60),
  `baslangic` VARCHAR(60),
  `detay` TEXT,
  `durum` ENUM('yeni','degerlendiriliyor','teklif_verildi','kazanildi','kaybedildi') DEFAULT 'yeni',
  `notlar` TEXT,
  `tarih` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============ ADMIN ============
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `kullanici` VARCHAR(60) NOT NULL UNIQUE,
  `sifre_hash` VARCHAR(255) NOT NULL,
  `ad_soyad` VARCHAR(120),
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Şifre: admin123  (password_hash bcrypt) — CANLIDA MUTLAKA DEĞİŞTİR
INSERT INTO `admin` (`kullanici`,`sifre_hash`,`ad_soyad`) VALUES
('admin','$2y$10$6gNrpOXRLof.Toy.Ugy.yu4DrKP23OcnJa7UBhKOH1iMxbtH8GK0.','Yönetici');

SET FOREIGN_KEY_CHECKS = 1;
