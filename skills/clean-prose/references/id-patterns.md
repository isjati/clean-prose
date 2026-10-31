# Indonesian patterns (pola tulisan AI dalam Bahasa Indonesia)

Load this file when the text is in Indonesian or mixes Indonesian and English. The structural patterns in [patterns.md](patterns.md) still apply; this file adds the Indonesian forms and the cases where English rules do not transfer.

## What does not transfer from English

- **Passive "di-" is normal.** "Laporan ini disusun oleh tim data" is ordinary Indonesian. Do not convert every passive to active. Change it only when the hidden actor matters.
- **"Merupakan" and "adalah" are fine.** The tell is the inflated alternative ("hadir sebagai", "berperan sebagai", "tampil sebagai").
- **Code-switching is normal in tech writing.** Keep English terms the writer already uses (deploy, container, endpoint, dashboard, monitoring). Do not force "penyebaran" for "deploy".
- **Register matters.** Formal reports use "kami/Anda". Telegram, WhatsApp and casual notes may use "aku/kamu", "gue/lo", "nggak", "udah". Match the source; never formalize casual text or casualize a report.

## 1. Kontras palsu (Not X but Y)

**Watch for:** bukan sekadar X, melainkan Y; tidak hanya X, tetapi juga Y (sebagai pemanis); ini bukan tentang X, ini tentang Y; X? Bukan. Y.
**Fix:** State Y. Keep the contrast only if the reader actually believes X.
> Sebelum: Ini bukan sekadar dashboard, melainkan pusat kendali operasional Anda.
> Sesudah: Dashboard ini menampilkan status 19 layanan dan suhu CPU secara langsung.

## 2. Pembuka basa-basi

**Watch for:** Mari kita bahas / selami / kupas tuntas; Di era digital ini; Di zaman yang serba cepat ini; Seperti yang kita ketahui bersama; Tidak dapat dipungkiri bahwa; Perlu diketahui bahwa; Perlu dicatat bahwa; Dalam artikel ini, kita akan; Pada kesempatan kali ini.
**Fix:** Delete the opener and start with the point.
> Sebelum: Di era digital ini, tidak dapat dipungkiri bahwa keamanan server sangatlah penting.
> Sesudah: Server yang terbuka ke internet perlu segera dipatch.

## 3. Inflasi makna

**Watch for:** memainkan peran penting / krusial / vital; sangat krusial; menjadi kunci utama; tonggak sejarah; langkah strategis; bukti nyata; wujud komitmen; lanskap (kiasan); ekosistem (kiasan); revolusioner; transformatif; holistik; sinergi; komprehensif; berkelanjutan (sebagai hiasan); "di tengah dinamika ..."
**Fix:** Keep the fact, drop the importance claim.
> Sebelum: Migrasi ke SSD baru menjadi tonggak penting yang memainkan peran krusial dalam transformasi infrastruktur.
> Sesudah: Model LLM dipindah ke SSD baru agar SSD sistem tidak penuh.

## 4. Ekor "yang mencerminkan" (shallow riders)

**Watch for:** ..., yang mencerminkan ...; ..., menegaskan komitmen ...; ..., menunjukkan pentingnya ...; ..., sehingga menciptakan ...; hal ini menunjukkan bahwa ...
**Fix:** Cut the rider, or replace it with the concrete consequence from the source.

## 5. Penutup klise

**Watch for:** Kesimpulannya; Pada akhirnya; Dengan demikian, dapat disimpulkan bahwa; Singkatnya; Masa depan terlihat cerah; Semoga bermanfaat!; Semoga membantu!; Jangan ragu untuk bertanya.
**Fix:** End on the last concrete point or the next action.

## 6. Kata kerja yang dipanjang-panjangkan

| Hindari | Gunakan |
|---|---|
| melakukan pengecekan | mengecek |
| melakukan analisis | menganalisis |
| melakukan instalasi | menginstal |
| memberikan dukungan | mendukung |
| melakukan peningkatan | meningkatkan |
| hadir sebagai / tampil sebagai | adalah, menjadi |
| memiliki kemampuan untuk | bisa, dapat |
| dalam rangka untuk | untuk |
| guna untuk | untuk / guna (pilih satu) |

## 7. Pagar bertumpuk (stacked hedges)

**Watch for:** dapat berpotensi; mungkin bisa saja; cenderung dapat; sedikit banyak; boleh dikatakan.
**Fix:** Keep one hedge if the doubt is real, otherwise none.

## 8. Tiga serangkai paksa

**Watch for:** efektif, efisien, dan inovatif; cepat, tepat, dan akurat; aman, nyaman, dan terpercaya.
**Fix:** Keep the words that carry a distinct claim. Usually one.

## 9. Kata pembuka berulang

**Watch for:** paragraphs that all start with "Hal ini", "Adapun", "Dalam hal ini", "Selain itu", "Oleh karena itu".
**Fix:** Merge sentences or start with the subject.

## 10. Sisa chatbot

**Watch for:** Tentu!; Tentu saja!; Pertanyaan yang bagus!; Baik, berikut adalah ...; Berikut penjelasannya:; Semoga jawaban ini membantu.
**Fix:** Remove the wrapper, keep the content.

## 11. Format dekoratif

Emoji in every heading, bold on every other phrase, Title Case In Indonesian Headings ("Langkah-Langkah Instalasi Yang Mudah"). Use sentence case ("Langkah instalasi") and bold only for real emphasis.
