# Aplikasi Pendaftaran Mahasiswa Baru — Universitas Potensi Utama

Project Ujian Tengah Semester (UTS) **Pengembangan Aplikasi Mobile**  
- **Fakultas**: Teknik dan Ilmu Komputer  
- **Program Studi**: Informatika (IF)  
- **Semester / TA**: V / 2026-2027  
- **Dosen Pengampu**: Khairul Ummi, M.Kom  
- **Nama Mahasiswa**: Ananda Pratama  

---

## Struktur Project Flutter

```text
aplikasi_pendaftaran_maba/
├── android/                                   # Konfigurasi Android
├── assets/
│   └── logo_upu.png                           # Logo Universitas Potensi Utama
├── lib/
│   ├── main.dart                              # Entry point utama aplikasi
│   ├── models/
│   │   └── data_pendaftaran.dart              # Model DataPendaftaran & identitas pembuat
│   ├── pages/
│   │   ├── home_page.dart                     # 1. Halaman Utama (Home)
│   │   ├── formulir_pendaftaran_page.dart     # 2. Halaman Formulir Pendaftaran
│   │   ├── hasil_pendaftaran_page.dart        # 3. Halaman Hasil Pendaftaran
│   │   └── tentang_aplikasi_page.dart         # 4. Halaman Tentang Aplikasi
│   └── widgets/
│       └── kampus_logo_widget.dart            # Widget ImageView Logo Kampus
├── test/
│   └── widget_test.dart                       # Pengujian widget utama
├── analysis_options.yaml
└── pubspec.yaml
```

## Fitur & Halaman Aplikasi

1. **Halaman Utama (`HomePage`)**:
   - Menampilkan nama aplikasi **Pendaftaran Mahasiswa Baru**.
   - Menampilkan logo kampus **Universitas Potensi Utama**.
   - Menampilkan teks sambutan kepada calon mahasiswa baru.
   - Tombol **"Mulai Pendaftaran"** (menuju halaman Formulir Pendaftaran).
   - Tombol **"Tentang Aplikasi"** (menuju halaman Tentang Aplikasi).

2. **Halaman Formulir Pendaftaran (`FormulirPendaftaranPage`)**:
   - `Text`: Judul formulir pendaftaran.
   - `TextField` (Nama Lengkap): Input nama lengkap calon mahasiswa.
   - `TextField` (NIM / Nomor Pendaftaran): Input nomor pendaftaran atau NIM.
   - `TextField` (Alamat Lengkap): Input alamat domisili.
   - `DropdownButtonFormField` (Spinner / Dropdown): Pilihan Program Studi.
   - `RadioListTile` (Radio Button): Pilihan Jenis Kelamin (`Laki-laki` / `Perempuan`).
   - `showDatePicker` (DatePicker): Pilihan Tanggal Lahir.
   - `Image` (`KampusLogoWidget`): Menampilkan logo kampus.
   - `ElevatedButton`: Tombol **"Simpan Pendaftaran"**.

3. **Halaman Hasil Pendaftaran (`HasilPendaftaranPage`)**:
   - Memvalidasi apakah seluruh data wajib telah diisi dan menampilkan `SnackBar` peringatan apabila ada field yang belum lengkap.
   - Menampilkan kembali seluruh data pendaftaran yang valid (Nama, Nomor Pendaftaran/NIM, Alamat, Program Studi, Jenis Kelamin, dan Tanggal Lahir).

4. **Halaman Tentang Aplikasi (`TentangAplikasiPage`)**:
   - Menampilkan Nama Aplikasi, Nama Mahasiswa Pembuat Aplikasi, NIM, Program Studi Informatika, dan Nama Universitas (Universitas Potensi Utama).
