# utsmobile

# Jelaskan perbedaan antara Cubit dan Bloc dalam aksitektur flutter
BLoC: pakai event → state. UI kirim event, BLoC proses, baru emit state. Cocok untuk aplikasi kompleks.
Cubit: langsung method → state. UI panggil method, langsung emit state. Cocok untuk fitur sederhana.

# Mengapa penting untuk memisahkan antara model data, logika bisnis, dan UI dalam pengembangan aplikasi Flutter?
1. Maintainability (Mudah Dikelola)
   Setiap bagian punya tanggung jawab jelas → gampang diperbaiki atau ditingkatkan tanpa merusak bagian lain.
   Contoh: Mengubah cara perhitungan tidak akan merusak tampilan UI.
2. Reusability (Bisa Digunakan Kembali)
   Model data dan logika bisnis bisa dipakai di layar lain atau proyek lain tanpa menulis ulang UI.
3. Testability (Mudah Dites)
   Logika bisnis bisa diuji unit test tanpa perlu menampilkan UI.
   UI bisa diuji terpisah dari data.
4. Scalability (Mudah Dikembangkan)
   Aplikasi besar lebih mudah dikembangkan karena tiap layer terpisah.

# Sebutkan dan jelaskan minimal tiga state yang mungkin digunakan dalam CartCubit beserta fungsinya.
- CartInitial
  Fungsi: Menandakan keranjang masih kosong atau belum ada interaksi.
  Biasanya state awal saat Cubit dibuat.
- CartUpdated
  Fungsi: Menandakan isi keranjang berubah, misal ada item ditambahkan atau dihapus.
  Bisa membawa data terbaru berupa list item dan total harga.
- CartError
  Fungsi: Menandakan terjadi kesalahan saat memodifikasi keranjang, misal gagal menambah item karena stok habis.
  Bisa membawa pesan error agar UI menampilkan notifikasi.
