# UTS Mobile App - Pemrograman Mobile

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
- Dilengkapi dengan animasi fade-in

### 2. Dashboard dengan Bottom Navigation
Menu utama aplikasi yang terdiri dari 5 navigasi:
- Biodata
- Kontak
- Kalkulator
- Cuaca
- Berita

### 3. Halaman Biodata
Fitur:
- Menampilkan foto profil dengan desain menarik
- Form input data dengan berbagai widget:
    - TextField untuk nama, NIM, email, dan alamat
    - DatePicker untuk tanggal lahir (Calendar)
    - RadioButton untuk jenis kelamin
    - Dropdown untuk agama
- Tombol simpan (data tidak disimpan ke database)
- UI/UX yang responsive dan modern

### 4. Halaman Kontak
Fitur:
- Daftar 15 kontak telepon statis
- Setiap kontak menampilkan:
    - Circle avatar dengan inisial
    - Nama kontak
    - Nomor telepon
    - Tombol call dan message
- Data bersifat statis dari variabel
- Tampilan card yang modern

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
- UI dengan warna yang intuitif

### 6. Halaman Cuaca
Fitur:
- Informasi cuaca statis untuk kota Bandung
- Menampilkan:
    - Suhu saat ini
    - Kondisi cuaca dengan icon
    - Kelembapan
    - Kecepatan angin
    - Jarak pandang
    - Tekanan udara
    - Prakiraan 5 hari ke depan
- Desain dengan gradient background yang menarik

### 7. Halaman Berita
Fitur:
- Daftar 15 berita statis
- Setiap berita menampilkan:
    - Icon kategori dengan warna berbeda
    - Judul berita
    - Ringkasan berita
    - Tanggal publikasi
    - Kategori berita
- Tampilan card dengan layout yang responsive
- Detail berita muncul saat card diklik

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

Dikembangkan oleh *Yasrifal Fawaz* untuk memenuhi tugas UTS Pemrograman Mobile.

## 📄 Lisensi

Aplikasi ini dikembangkan untuk keperluan akademik di Institut Teknologi Nasional Bandung.

---

*Institut Teknologi Nasional Bandung*  
Jl. Khp Hasan Mustopa No.23, Bandung - 40124  
© 2024

  <img width="431" height="262" alt="Screenshot 2025-11-13 122659" src="https://github.com/user-attachments/assets/29283495-dee8-46ec-a33d-b0ecad0afcdd" />
