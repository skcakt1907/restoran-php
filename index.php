<?php
require_once __DIR__ . '/inc/header.php';
$hizmetler = getList('hizmetler','durum=1','sira ASC');
$projeler  = getList('projeler','durum=1','sira ASC',6);
$referanslar = getList('referanslar','durum=1','id ASC');
$blogYazi  = getList('blog','durum=1','tarih DESC',3);
?>

<section class="hero">
  <div class="container">
    <div class="row">
      <div class="col-lg-8">
        <span class="hero-badge"><i class="bi bi-circle-fill"></i> Restoran · Kafe · Etkinlik</span>
        <h1>Taze Lezzetler,<br>Sıcak <span>Atmosfer</span>,<br>Mutlu Sofralar.</h1>
        <p><?= e(ayar('site_aciklama')) ?></p>
        <div class="hero-cta">
          <a href="<?= SITE_URL ?>/hizmetler" class="btn btn-orange me-md-2">Menümüz <i class="bi bi-arrow-right ms-2"></i></a>
          <a href="<?= SITE_URL ?>/teklif" class="btn btn-line">Rezervasyon</a>
        </div>
      </div>
    </div>
  </div>
  <div class="hero-meta d-none d-md-block">
    <div class="container">
      <div class="row g-3">
        <div class="col-md-4 col-6"><div class="meta-item"><i class="bi bi-award-fill"></i><div><strong><?= e(ayar('yil')) ?>+ Yıl</strong><small>Lezzet Tecrübesi</small></div></div></div>
        <div class="col-md-4 col-6"><div class="meta-item"><i class="bi bi-basket"></i><div><strong>Günlük Taze Malzeme</strong><small>Yerel Üreticilerden Tedarik</small></div></div></div>
        <div class="col-md-4 col-12"><div class="meta-item"><i class="bi bi-fire"></i><div><strong>Odun Ateşi & Taş Fırın</strong><small>Geleneksel Pişirme Yöntemleri</small></div></div></div>
      </div>
    </div>
  </div>
</section>

<section>
  <div class="container">
    <div class="row align-items-center g-5">
      <div class="col-lg-6">
        <div class="about-img-wrap">
          <img src="https://images.unsplash.com/photo-1555396273-367ea4eb4db5?w=900&q=85" alt="">
          <div class="exp-badge"><span class="num"><?= e(ayar('yil')) ?>+</span><span class="lbl">Yıllık Lezzet</span></div>
        </div>
      </div>
      <div class="col-lg-6">
        <div class="section-head">
          <span class="mini">Hakkımızda</span>
          <h2>Sıcak Mekan,<br><span>Usta Mutfak</span></h2>
          <p class="desc"><?= e(ayar('hakkimizda_kisa')) ?></p>
        </div>
        <ul class="about-features">
          <li><i class="bi bi-check"></i> Günlük Taze Malzeme</li>
          <li><i class="bi bi-check"></i> Ev Yapımı Tatlılar</li>
          <li><i class="bi bi-check"></i> Geniş Bahçe & Teras</li>
          <li><i class="bi bi-check"></i> Özel Etkinlik Salonu</li>
        </ul>
        <a href="<?= SITE_URL ?>/hakkimizda" class="btn btn-orange mt-4">Daha Fazla <i class="bi bi-arrow-right ms-2"></i></a>
      </div>
    </div>
  </div>
</section>

<section class="services-grid">
  <div class="container">
    <div class="section-head center">
      <span class="mini">Menümüz</span>
      <h2>Menümüzden <span>Seçkiler</span></h2>
      <p class="desc">Kahvaltıdan tatlıya, mutfağımızın öne çıkan lezzet kategorileri.</p>
    </div>
    <div class="row g-4">
      <?php foreach($hizmetler as $h): ?>
      <div class="col-lg-4 col-md-6">
        <div class="service-card">
          <div class="icon"><i class="bi <?= e($h['ikon']) ?>"></i></div>
          <h4><?= e($h['baslik']) ?></h4>
          <p><?= e($h['ozet']) ?></p>
          <a href="<?= SITE_URL ?>/hizmet-detay?slug=<?= e($h['slug']) ?>">Detay <i class="bi bi-arrow-right"></i></a>
        </div>
      </div>
      <?php endforeach; ?>
      <div class="col-lg-4 col-md-6">
        <a href="<?= SITE_URL ?>/teklif" class="service-card d-flex align-items-center justify-content-center text-decoration-none" style="background:var(--dark);color:#fff;min-height:100%">
          <div class="text-center">
            <i class="bi bi-arrow-up-right" style="font-size:2.5rem;color:var(--primary)"></i>
            <h4 style="color:#fff;margin-top:1rem">Rezervasyon</h4>
            <p style="color:#9ca3af;margin:0">Masanızı ayırtmak için tıklayın</p>
          </div>
        </a>
      </div>
    </div>
  </div>
</section>

<section class="stats">
  <div class="container">
    <div class="row g-4">
      <div class="col-md-3 col-6"><div class="stat"><i class="bi bi-award-fill"></i><h3><?= e(ayar('yil')) ?>+</h3><p>Yıllık Tecrübe</p></div></div>
      <div class="col-md-3 col-6"><div class="stat"><i class="bi bi-egg-fried"></i><h3><?= e(ayar('proje_sayi')) ?>+</h3><p>Menüde Lezzet</p></div></div>
      <div class="col-md-3 col-6"><div class="stat"><i class="bi bi-people-fill"></i><h3><?= e(ayar('musteri_sayi')) ?>+</h3><p>Mutlu Misafir</p></div></div>
      <div class="col-md-3 col-6"><div class="stat"><i class="bi bi-person-badge"></i><h3><?= e(ayar('personel_sayi')) ?>+</h3><p>Ekip Üyesi</p></div></div>
    </div>
  </div>
</section>

<section>
  <div class="container">
    <div class="section-head d-flex justify-content-between align-items-end flex-wrap">
      <div>
        <span class="mini">Galeri</span>
        <h2>Mekanımızdan <span>Kareler</span></h2>
      </div>
      <a href="<?= SITE_URL ?>/projeler" class="btn btn-orange">Galeriyi Gör <i class="bi bi-arrow-right ms-2"></i></a>
    </div>
    <div class="row g-4">
      <?php foreach($projeler as $p): ?>
      <div class="col-lg-4 col-md-6">
        <a class="proj" href="<?= SITE_URL ?>/proje-detay?slug=<?= e($p['slug']) ?>">
          <img src="<?= e($p['gorsel']) ?>" alt="<?= e($p['baslik']) ?>">
          <div class="proj-info">
            <span class="cat"><?= e($p['kategori']) ?> · <?= e($p['tarih']) ?></span>
            <h5><?= e($p['baslik']) ?></h5>
          </div>
        </a>
      </div>
      <?php endforeach; ?>
    </div>
  </div>
</section>

<section style="background:#f4f4f5">
  <div class="container">
    <div class="section-head center">
      <span class="mini">Misafir Yorumları</span>
      <h2>Misafirlerimiz <span>Ne Diyor?</span></h2>
    </div>
    <div class="row g-4">
      <?php foreach($referanslar as $r): ?>
      <div class="col-lg-4 col-md-6">
        <div class="testi">
          <div class="stars"><?= str_repeat('★',(int)$r['yildiz']) ?></div>
          <p>"<?= e($r['yorum']) ?>"</p>
          <div class="testi-user">
            <img src="<?= e($r['foto']) ?>" alt="">
            <div><h6><?= e($r['ad']) ?></h6><span><?= e($r['unvan']) ?></span></div>
          </div>
        </div>
      </div>
      <?php endforeach; ?>
    </div>
  </div>
</section>

<section class="cta-strip">
  <div class="container">
    <div class="row align-items-center">
      <div class="col-lg-8"><h3>Masanızı şimdiden ayırtın</h3><p>Hafta sonları yoğunluk olabiliyor — rezervasyonla yerinizi garantileyin.</p></div>
      <div class="col-lg-4 text-lg-end mt-3 mt-lg-0"><a href="<?= SITE_URL ?>/teklif" class="btn">Rezervasyon Yap <i class="bi bi-arrow-right ms-2"></i></a></div>
    </div>
  </div>
</section>

<section>
  <div class="container">
    <div class="section-head center">
      <span class="mini">Lezzet Köşesi</span>
      <h2>Mutfağımızdan <span>Hikayeler</span></h2>
    </div>
    <div class="row g-4">
      <?php foreach($blogYazi as $b): ?>
      <div class="col-lg-4 col-md-6">
        <div class="blog-card">
          <div class="img">
            <img src="<?= e($b['gorsel']) ?>" alt="">
            <span class="cat"><?= e($b['kategori']) ?></span>
          </div>
          <div class="blog-body">
            <div class="meta"><i class="bi bi-calendar3"></i><?= trTarih($b['tarih']) ?></div>
            <h5><a href="<?= SITE_URL ?>/blog-detay?slug=<?= e($b['slug']) ?>"><?= e($b['baslik']) ?></a></h5>
            <p><?= e($b['ozet']) ?></p>
          </div>
        </div>
      </div>
      <?php endforeach; ?>
    </div>
  </div>
</section>

<?php require_once __DIR__ . '/inc/iletisim-bolumu.php'; ?>

<?php require_once __DIR__ . '/inc/footer.php'; ?>
