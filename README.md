# ETS Mobile App - Pemrograman Mobile

## 📱 Informasi Mahasiswa

- *Nama*: Yasrifal Fawaz
- *NIM*: 152023024
- *Kelas*: BB
- *Dosen*: Galih Ashari R., S.Si., MT
- *Semester*: Ganjil 2024/2025

## 📋 Deskripsi Aplikasi

Aplikasi ini merupakan aplikasi mobile berbasis Flutter yang terdiri dari 5 menu utama yang dapat diakses melalui Bottom Navigation Bar. Aplikasi ini dirancang dengan UI/UX yang modern dan responsif.

## ✨ Fitur Aplikasi

### 1. Splash Screen
- Durasi tampil: 5 detik
- Menampilkan:
    - Judul aplikasi
    - Foto mahasiswa
    - NIM
    - Nama mahasiswa
<img width="310" height="677" alt="SplashScreen" src="https://github.com/user-attachments/assets/acb7480e-c76a-4630-9bd9-d774b876d950" />

### 2. Dashboard dengan Bottom Navigation
Menu utama aplikasi yang terdiri dari 5 navigasi:
- Biodata
- Kontak
- Kalkulator
- Cuaca
- Berita
<img width="314" height="671" alt="Dashboard Biodata" src="https://github.com/user-attachments/assets/0afa30fe-5a65-4665-80d0-25a734e83622" />

### 3. Halaman Biodata
Fitur:
- Menampilkan foto profil dengan desain menarik
- Form input data dengan berbagai widget:
    - TextField untuk alamat
    - Dropdown untuk hobi
    - DatePicker untuk tanggal lahir (kalender)
    - RadioButton untuk jenis kelamin
- Tombol simpan (data tidak disimpan ke database)
<img width="314" height="671" alt="Dashboard Biodata" src="https://github.com/user-attachments/assets/d5d626fa-34e2-4ea4-b395-300702563e97" />

### 4. Halaman Kontak
Fitur:
- Daftar 15 kontak telepon statis
- Setiap kontak menampilkan:
    - Circle avatar dengan inisial
    - Nama kontak
    - Nomor telepon
    - Tombol call
    - Message dan salin nomor saat diklik
      <img width="314" height="675" alt="Msg" src="https://github.com/user-attachments/assets/021f2227-67a1-498f-8c75-e0c28516e510" />

- Data bersifat statis dari variabel
<img width="312" height="672" alt="Kontak" src="https://github.com/user-attachments/assets/27745889-26c8-4a7e-a6a4-00070d48189e" />

### 5. Halaman Kalkulator
Fitur operasi matematika:
- Penjumlahan (+)
- Pengurangan (-)
- Perkalian (×)
- Pembagian (÷)
- Pangkat dua (x²)
- Akar kuadrat (√)
- Tombol Clear (C)
- Display hasil yang besar dan jelas
<img width="311" height="673" alt="Kalkulator" src="https://github.com/user-attachments/assets/9bdd6029-3ac8-4e79-bd41-dc194330c201" />

### 6. Halaman Cuaca
Fitur:
- Informasi cuaca statis untuk kota Bandung
- Menampilkan:
    - Suhu saat ini
    - Kondisi cuaca dengan icon
    - Kelembapan
    - Kecepatan angin
    - Perkiraan 7 hari ke depan
<img width="312" height="673" alt="Cuaca" src="https://github.com/user-attachments/assets/c735e880-70b3-47fb-ab13-8c7bf5f763e5" />

### 7. Halaman Berita
Fitur:
- Daftar 15 berita statis
- Setiap berita menampilkan:
    - Icon kategori dengan warna berbeda
    - Judul berita
    - Ringkasan berita
<img width="310" height="667" alt="Berita" src="https://github.com/user-attachments/assets/b28bfdb5-c6b5-4522-8056-6f853e870314" />

## 🚀 Cara Clone Aplikasi

### Langkah-langkah

1. Clone repository ini
bash
git clone https://github.com/YasrifalFawaz/ETS-Pemrograman-Mobile
cd uts


2. Install dependencies
bash
flutter pub get


3. Jalankan aplikasi
bash
flutter run

## 📝 Catatan Pengembangan

### SubCPMK 2
Aplikasi ini memenuhi SubCPMK 2 dengan menerapkan berbagai jenis layout dan widget:
- *Layout*: Column, Row, ListView, Container, Card, Stack
- *Widget Input*: TextField, RadioButton, DropdownButton, DatePicker
- *Widget Display*: Text, Image, Icon, CircleAvatar
- *Navigation*: BottomNavigationBar, Fragment
- *Styling*: Gradient, BoxDecoration, Border, Shadow
- *Interaction*: Button, InkWell, GestureDetector

## 🔧 Pengembangan Selanjutnya

Fitur yang dapat dikembangkan:
- [ ] Integrasi dengan API cuaca real-time
- [ ] Integrasi dengan API berita
- [ ] Database lokal untuk menyimpan data biodata
- [ ] Import kontak dari sistem
- [ ] History perhitungan kalkulator
- [ ] Dark mode
- [ ] Localization (multi-bahasa)

## 👨‍💻 Developer

Dikembangkan oleh *Yasrifal Fawaz* untuk memenuhi ETS Pemrograman Mobile.

## 📄 Lisensi

Aplikasi ini dikembangkan untuk keperluan akademik di Institut Teknologi Nasional Bandung.

---

*Institut Teknologi Nasional Bandung*  
Jl. Khp Hasan Mustopa No.23, Bandung - 40124  
© 2024
