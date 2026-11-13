import 'package:flutter/material.dart';

void main() {
  runApp(const AplikasiPendaftaranMabaApp());
}

// ============================================================================
// KONSTANTA IDENTITAS & WARNA TEMA PORTAL KAMPUS
// ============================================================================
const String kNamaAplikasi = 'Pendaftaran Mahasiswa Baru';
const String kNamaMahasiswa = 'Ananda Pratama';
const String kNimMahasiswa = '2411010001'; // Sesuaikan dengan NIM Anda
const String kProgramStudi = 'Informatika (IF)';
const String kNamaUniversitas = 'Universitas Potensi Utama';

const Color kPrimaryBlue = Color(0xFF1E40AF);
const Color kPrimaryDark = Color(0xFF1E3A8A);
const Color kPrimarySoft = Color(0xFFEFF6FF);
const Color kAccentGold = Color(0xFFF59E0B);
const Color kBgSurface = Color(0xFFF4F7FE);

// ============================================================================
// MODEL DATA PENDAFTARAN MAHASISWA BARU
// ============================================================================
class DataPendaftaran {
  final String namaLengkap;
  final String nomorPendaftaran;
  final String alamat;
  final String programStudi;
  final String jenisKelamin;
  final DateTime tanggalLahir;

  const DataPendaftaran({
    required this.namaLengkap,
    required this.nomorPendaftaran,
    required this.alamat,
    required this.programStudi,
    required this.jenisKelamin,
    required this.tanggalLahir,
  });

  String get inisial {
    final parts = namaLengkap.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return namaLengkap.length >= 2
        ? namaLengkap.substring(0, 2).toUpperCase()
        : namaLengkap.toUpperCase();
  }

  String get tanggalLahirFormatted {
    const List<String> namaBulan = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];
    return '${tanggalLahir.day.toString().padLeft(2, '0')} '
        '${namaBulan[tanggalLahir.month - 1]} '
        '${tanggalLahir.year}';
  }
}

// ============================================================================
// PENYIMPANAN DAFTAR MAHASISWA YANG SUDAH MENDAFTAR
// ============================================================================
final List<DataPendaftaran> daftarMahasiswaTerdaftar = [
  DataPendaftaran(
    namaLengkap: 'Ananda Pratama',
    nomorPendaftaran: 'PMB-2026-001',
    alamat: 'Jl. KL. Yos Sudarso Km. 6,5 No. 3-A, Medan',
    programStudi: 'Informatika (S1)',
    jenisKelamin: 'Laki-laki',
    tanggalLahir: DateTime(2005, 5, 14),
  ),
  DataPendaftaran(
    namaLengkap: 'Siti Rahmawati',
    nomorPendaftaran: 'PMB-2026-002',
    alamat: 'Jl. Setia Budi No. 48, Helvetia, Medan',
    programStudi: 'Sistem Informasi (S1)',
    jenisKelamin: 'Perempuan',
    tanggalLahir: DateTime(2006, 8, 22),
  ),
  DataPendaftaran(
    namaLengkap: 'Budi Santoso',
    nomorPendaftaran: 'PMB-2026-003',
    alamat: 'Jl. Gatot Subroto No. 112, Binjai',
    programStudi: 'Rekayasa Perangkat Lunak (S1)',
    jenisKelamin: 'Laki-laki',
    tanggalLahir: DateTime(2006, 1, 9),
  ),
];

// ============================================================================
// ROOT WIDGET APLIKASI
// ============================================================================
class AplikasiPendaftaranMabaApp extends StatelessWidget {
  const AplikasiPendaftaranMabaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kNamaAplikasi,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: kPrimaryBlue,
          primary: kPrimaryBlue,
          secondary: kAccentGold,
        ),
        scaffoldBackgroundColor: kBgSurface,
        appBarTheme: const AppBarTheme(
          backgroundColor: kPrimaryDark,
          foregroundColor: Colors.white,
          centerTitle: false,
          elevation: 0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFFF8FAFC),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 12,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: kPrimaryBlue, width: 1.8),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

// ============================================================================
// WIDGET LOGO KAMPUS (ImageView)
// ============================================================================
class KampusLogoWidget extends StatelessWidget {
  final double size;

  const KampusLogoWidget({super.key, this.size = 76});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(color: kAccentGold, width: 2.5),
        boxShadow: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          'assets/logo_upu.png',
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [kPrimaryDark, kPrimaryBlue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_balance_rounded,
                    size: size * 0.44,
                    color: const Color(0xFFFBBF24),
                  ),
                  Text(
                    'UPU',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: size * 0.16,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// ============================================================================
// WIDGET KARTU ITEM PENDAFTAR (DAFTAR MAHASISWA YANG SUDAH DAFTAR)
// ============================================================================
class ItemMahasiswaTerdaftarCard extends StatelessWidget {
  final DataPendaftaran data;
  final bool isSelected;
  final VoidCallback onTap;

  const ItemMahasiswaTerdaftarCard({
    super.key,
    required this.data,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 11),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFF8FAFF) : Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isSelected ? kPrimaryBlue : const Color(0xFFEEF2F6),
              width: 1.5,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [kPrimaryBlue, Color(0xFF3B82F6)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  data.inisial,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 13.5,
                  ),
                ),
              ),
              const SizedBox(width: 11),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.namaLengkap,
                      style: const TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${data.nomorPendaftaran} • ${data.jenisKelamin}',
                      style: const TextStyle(
                        fontSize: 11.2,
                        color: Color(0xFF64748B),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: kPrimarySoft,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        data.programStudi,
                        style: const TextStyle(
                          fontSize: 10.5,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryBlue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFECFDF5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Terdaftar ✓',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF059669),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// WIDGET 4 TOMBOL NAVIGASI DI DALAM LAYAR PALING BAWAH
// 1. Home | 2. Formulir Pendaftaran | 3. Hasil Pendaftaran | 4. Profil
// ============================================================================
class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const AppBottomNavBar({super.key, required this.currentIndex});

  void _onItemTapped(BuildContext context, int index) {
    if (index == currentIndex) return;
    if (index == 0) {
      Navigator.popUntil(context, (route) => route.isFirst);
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const FormulirPendaftaranPage(),
        ),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HasilPendaftaranPage(
            dataPendaftaran: daftarMahasiswaTerdaftar.first,
          ),
        ),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const TentangAplikasiPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => _onItemTapped(context, index),
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: kPrimaryBlue,
      unselectedItemColor: const Color(0xFF64748B),
      selectedFontSize: 11,
      unselectedFontSize: 11,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment_rounded),
          label: 'Formulir Pendaftaran',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fact_check_rounded),
          label: 'Hasil Pendaftaran',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_rounded),
          label: 'Profil',
        ),
      ],
    );
  }
}

// ============================================================================
// 1. HALAMAN UTAMA (HOME PAGE)
// ============================================================================
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _bukaFormulir() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const FormulirPendaftaranPage(),
      ),
    );
    setState(() {});
  }

  void _bukaProfil() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TentangAplikasiPage()),
    );
  }

  void _bukaDetailMahasiswa(DataPendaftaran mhs) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HasilPendaftaranPage(dataPendaftaran: mhs),
      ),
    ).then((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // HERO BANNER BIRU ROYAL & LOGO KAMPUS
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 36),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [kPrimaryDark, Color(0xFF2563EB)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(28),
                    bottomRight: Radius.circular(28),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0x29FFFFFF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        '✨ PMB TAHUN AKADEMIK 2026 / 2027',
                        style: TextStyle(
                          color: Color(0xFFFEF08A),
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const KampusLogoWidget(size: 78),
                    const SizedBox(height: 8),
                    const Text(
                      kNamaAplikasi,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.5,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 3),
                    const Text(
                      kNamaUniversitas,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFDBEAFE),
                        fontSize: 12.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              // KARTU SAMBUTAN & DAFTAR MAHASISWA YANG SUDAH MENDAFTAR
              Transform.translate(
                offset: const Offset(0, -20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Card(
                        elevation: 2,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '👋 Selamat Datang, Calon Mahasiswa!',
                                style: TextStyle(
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w800,
                                  color: kPrimaryDark,
                                ),
                              ),
                              const SizedBox(height: 6),
                              const Text(
                                'Selamat datang di aplikasi resmi Pendaftaran Mahasiswa Baru '
                                'Universitas Potensi Utama. Silakan lengkapi formulir pendaftaran '
                                'secara online untuk bergabung bersama kami.',
                                style: TextStyle(
                                  fontSize: 12.5,
                                  height: 1.5,
                                  color: Color(0xFF475569),
                                ),
                              ),
                              const SizedBox(height: 14),

                              // Tombol "Mulai Pendaftaran"
                              SizedBox(
                                width: double.infinity,
                                height: 44,
                                child: ElevatedButton.icon(
                                  onPressed: _bukaFormulir,
                                  icon: const Icon(Icons.assignment_rounded),
                                  label: const Text(
                                    'Mulai Pendaftaran',
                                    style: TextStyle(
                                      fontSize: 13.8,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: kPrimaryBlue,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),

                              // Tombol "Tentang Aplikasi"
                              SizedBox(
                                width: double.infinity,
                                height: 44,
                                child: OutlinedButton.icon(
                                  onPressed: _bukaProfil,
                                  icon: const Icon(Icons.info_outline_rounded),
                                  label: const Text(
                                    'Tentang Aplikasi',
                                    style: TextStyle(
                                      fontSize: 13.8,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: kPrimaryBlue,
                                    side: const BorderSide(
                                      color: kPrimaryBlue,
                                      width: 1.8,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),

                      // Header Daftar Mahasiswa yang Sudah Mendaftar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Daftar Mahasiswa yang Sudah Mendaftar',
                            style: TextStyle(
                              fontSize: 13.5,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF0F172A),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: kPrimarySoft,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: const Color(0xFFBFDBFE)),
                            ),
                            child: Text(
                              '${daftarMahasiswaTerdaftar.length} Terdaftar',
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w800,
                                color: kPrimaryBlue,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // List Item Mahasiswa Terdaftar
                      ...daftarMahasiswaTerdaftar.map(
                        (mhs) => ItemMahasiswaTerdaftarCard(
                          data: mhs,
                          onTap: () => _bukaDetailMahasiswa(mhs),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// 2. HALAMAN FORMULIR PENDAFTARAN (9 KOMPONEN WAJIB UTS)
// ============================================================================
class FormulirPendaftaranPage extends StatefulWidget {
  const FormulirPendaftaranPage({super.key});

  @override
  State<FormulirPendaftaranPage> createState() =>
      _FormulirPendaftaranPageState();
}

class _FormulirPendaftaranPageState extends State<FormulirPendaftaranPage> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nomorPendaftaranController =
      TextEditingController();
  final TextEditingController _alamatController = TextEditingController();

  final List<String> _daftarProdi = const [
    'Informatika (S1)',
    'Sistem Informasi (S1)',
    'Rekayasa Perangkat Lunak (S1)',
    'Teknik Industri (S1)',
    'Desain Komunikasi Visual (S1)',
  ];

  String? _selectedProdi;
  String? _selectedJenisKelamin;
  DateTime? _selectedTanggalLahir;

  @override
  void dispose() {
    _namaController.dispose();
    _nomorPendaftaranController.dispose();
    _alamatController.dispose();
    super.dispose();
  }

  Future<void> _pilihTanggalLahir() async {
    final DateTime sekarang = DateTime.now();
    final DateTime? hasil = await showDatePicker(
      context: context,
      initialDate: _selectedTanggalLahir ?? DateTime(2005, 5, 14),
      firstDate: DateTime(1980),
      lastDate: sekarang,
      helpText: 'PILIH TANGGAL LAHIR CALON MAHASISWA',
      cancelText: 'BATAL',
      confirmText: 'PILIH',
    );

    if (hasil != null) {
      setState(() {
        _selectedTanggalLahir = hasil;
      });
    }
  }

  String _formatTanggal(DateTime date) {
    const List<String> namaBulan = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];
    return '${date.day.toString().padLeft(2, '0')} '
        '${namaBulan[date.month - 1]} '
        '${date.year}';
  }

  void _simpanPendaftaran() {
    final String nama = _namaController.text.trim();
    final String nomorPendaftaran = _nomorPendaftaranController.text.trim();
    final String alamat = _alamatController.text.trim();

    final List<String> dataBelumLengkap = [];
    if (nama.isEmpty) dataBelumLengkap.add('Nama Lengkap');
    if (nomorPendaftaran.isEmpty) {
      dataBelumLengkap.add('NIM / Nomor Pendaftaran');
    }
    if (alamat.isEmpty) dataBelumLengkap.add('Alamat');
    if (_selectedProdi == null) dataBelumLengkap.add('Program Studi');
    if (_selectedJenisKelamin == null) dataBelumLengkap.add('Jenis Kelamin');
    if (_selectedTanggalLahir == null) dataBelumLengkap.add('Tanggal Lahir');

    if (dataBelumLengkap.isNotEmpty) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color(0xFFDC2626),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: Row(
            children: [
              const Icon(Icons.warning_amber_rounded, color: Colors.white),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Mohon lengkapi seluruh data wajib: ${dataBelumLengkap.join(', ')}!',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      );
      return;
    }

    final dataPendaftaran = DataPendaftaran(
      namaLengkap: nama,
      nomorPendaftaran: nomorPendaftaran,
      alamat: alamat,
      programStudi: _selectedProdi!,
      jenisKelamin: _selectedJenisKelamin!,
      tanggalLahir: _selectedTanggalLahir!,
    );

    // Tambahkan ke daftar mahasiswa yang sudah mendaftar
    daftarMahasiswaTerdaftar.insert(0, dataPendaftaran);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            HasilPendaftaranPage(dataPendaftaran: dataPendaftaran),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Formulir Pendaftaran',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 1),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 2,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // [8] ImageView & [1] TextView / Text Judul Formulir
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: kPrimarySoft,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFFBFDBFE)),
                    ),
                    child: const Row(
                      children: [
                        KampusLogoWidget(size: 48),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Formulir Pendaftaran Mahasiswa Baru',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  color: kPrimaryDark,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Data yang disimpan akan masuk ke Daftar Pendaftar.',
                                style: TextStyle(
                                  fontSize: 11.5,
                                  color: Color(0xFF475569),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),

                  // [2] EditText / TextField: Mengisi nama lengkap
                  const Text(
                    'Nama Lengkap *',
                    style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    controller: _namaController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      hintText: 'Masukkan nama lengkap sesuai ijazah',
                      prefixIcon: Icon(
                        Icons.person_outline_rounded,
                        color: kPrimaryBlue,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // [3] EditText / TextField: Mengisi NIM atau nomor pendaftaran
                  const Text(
                    'NIM / Nomor Pendaftaran *',
                    style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    controller: _nomorPendaftaranController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      hintText: 'Contoh: PMB-2026-004 atau NIM',
                      prefixIcon: Icon(
                        Icons.badge_outlined,
                        color: kPrimaryBlue,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // [4] EditText / TextField: Mengisi alamat
                  const Text(
                    'Alamat Lengkap *',
                    style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    controller: _alamatController,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      hintText: 'Masukkan alamat tempat tinggal lengkap',
                      prefixIcon: Icon(
                        Icons.home_outlined,
                        color: kPrimaryBlue,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // [5] Spinner / Dropdown: Memilih program studi
                  const Text(
                    'Program Studi Pilihan *',
                    style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  DropdownButtonFormField<String>(
                    value: _selectedProdi,
                    decoration: const InputDecoration(
                      hintText: 'Pilih Program Studi',
                      prefixIcon: Icon(
                        Icons.school_outlined,
                        color: kPrimaryBlue,
                      ),
                    ),
                    items: _daftarProdi.map((String prodi) {
                      return DropdownMenuItem<String>(
                        value: prodi,
                        child: Text(prodi),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedProdi = newValue;
                      });
                    },
                  ),
                  const SizedBox(height: 12),

                  // [6] Radio Button: Memilih jenis kelamin
                  const Text(
                    'Jenis Kelamin *',
                    style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8FAFC),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xFFCBD5E1)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text(
                              'Laki-laki',
                              style: TextStyle(fontSize: 13),
                            ),
                            value: 'Laki-laki',
                            groupValue: _selectedJenisKelamin,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedJenisKelamin = value;
                              });
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 6,
                            ),
                            dense: true,
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text(
                              'Perempuan',
                              style: TextStyle(fontSize: 13),
                            ),
                            value: 'Perempuan',
                            groupValue: _selectedJenisKelamin,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedJenisKelamin = value;
                              });
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 6,
                            ),
                            dense: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // [7] DatePicker: Memilih tanggal lahir
                  const Text(
                    'Tanggal Lahir *',
                    style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  InkWell(
                    onTap: _pilihTanggalLahir,
                    borderRadius: BorderRadius.circular(10),
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.calendar_month_outlined,
                          color: kPrimaryBlue,
                        ),
                        suffixIcon: Icon(Icons.arrow_drop_down),
                      ),
                      child: Text(
                        _selectedTanggalLahir == null
                            ? 'Pilih Tanggal Lahir'
                            : _formatTanggal(_selectedTanggalLahir!),
                        style: TextStyle(
                          fontSize: 13.5,
                          color: _selectedTanggalLahir == null
                              ? const Color(0xFF64748B)
                              : const Color(0xFF0F172A),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),

                  // [9] Button: Menyimpan data pendaftaran
                  SizedBox(
                    height: 46,
                    child: ElevatedButton.icon(
                      onPressed: _simpanPendaftaran,
                      icon: const Icon(Icons.fact_check_rounded),
                      label: const Text(
                        'Simpan Pendaftaran',
                        style: TextStyle(
                          fontSize: 14.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryBlue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// 3. HALAMAN HASIL PENDAFTARAN & DAFTAR MAHASISWA YANG SUDAH DAFTAR
// ============================================================================
class HasilPendaftaranPage extends StatefulWidget {
  final DataPendaftaran dataPendaftaran;

  const HasilPendaftaranPage({super.key, required this.dataPendaftaran});

  @override
  State<HasilPendaftaranPage> createState() => _HasilPendaftaranPageState();
}

class _HasilPendaftaranPageState extends State<HasilPendaftaranPage> {
  late DataPendaftaran _selectedData;

  @override
  void initState() {
    super.initState();
    _selectedData = widget.dataPendaftaran;
  }

  Widget _buildDetailItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: kPrimarySoft,
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(icon, color: kPrimaryBlue, size: 18),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 10.8,
                    color: Color(0xFF64748B),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 13.2,
                    color: Color(0xFF0F172A),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hasil & Daftar Pendaftar',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 2),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Banner Status
              Container(
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF059669), Color(0xFF10B981)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.check_circle_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(width: 11),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Data Pendaftaran Terverifikasi!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Pilih nama pada daftar di bawah untuk melihat detailnya.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // Kartu Detail Bukti Pendaftaran
              Card(
                elevation: 2,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              KampusLogoWidget(size: 38),
                              SizedBox(width: 9),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'DETAIL BUKTI PENDAFTARAN',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w800,
                                      color: kPrimaryBlue,
                                    ),
                                  ),
                                  Text(
                                    kNamaUniversitas,
                                    style: TextStyle(
                                      fontSize: 11.5,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF475569),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 9,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFEF3C7),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'VALID ✓',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFFB45309),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Divider(),
                      _buildDetailItem(
                        icon: Icons.person_rounded,
                        label: 'Nama Lengkap',
                        value: _selectedData.namaLengkap,
                      ),
                      const Divider(height: 1),
                      _buildDetailItem(
                        icon: Icons.badge_rounded,
                        label: 'NIM / Nomor Pendaftaran',
                        value: _selectedData.nomorPendaftaran,
                      ),
                      const Divider(height: 1),
                      _buildDetailItem(
                        icon: Icons.home_rounded,
                        label: 'Alamat Lengkap',
                        value: _selectedData.alamat,
                      ),
                      const Divider(height: 1),
                      _buildDetailItem(
                        icon: Icons.school_rounded,
                        label: 'Program Studi Pilihan',
                        value: _selectedData.programStudi,
                      ),
                      const Divider(height: 1),
                      Row(
                        children: [
                          Expanded(
                            child: _buildDetailItem(
                              icon: Icons.wc_rounded,
                              label: 'Jenis Kelamin',
                              value: _selectedData.jenisKelamin,
                            ),
                          ),
                          Expanded(
                            child: _buildDetailItem(
                              icon: Icons.calendar_month_rounded,
                              label: 'Tanggal Lahir',
                              value: _selectedData.tanggalLahirFormatted,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Daftar Seluruh Mahasiswa yang Sudah Mendaftar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Daftar Mahasiswa yang Sudah Daftar',
                    style: TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: kPrimarySoft,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFFBFDBFE)),
                    ),
                    child: Text(
                      '${daftarMahasiswaTerdaftar.length} Mahasiswa',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: kPrimaryBlue,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              ...daftarMahasiswaTerdaftar.map(
                (mhs) => ItemMahasiswaTerdaftarCard(
                  data: mhs,
                  isSelected:
                      mhs.nomorPendaftaran == _selectedData.nomorPendaftaran &&
                      mhs.namaLengkap == _selectedData.namaLengkap,
                  onTap: () {
                    setState(() {
                      _selectedData = mhs;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// 4. HALAMAN PROFIL / TENTANG APLIKASI
// ============================================================================
class TentangAplikasiPage extends StatelessWidget {
  const TentangAplikasiPage({super.key});

  Widget _buildInfoRow({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9.0),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: kPrimarySoft,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: kPrimaryBlue, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF64748B),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13.8,
                    color: Color(0xFF0F172A),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profil & Tentang Aplikasi',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 3),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 2,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const KampusLogoWidget(size: 76),
                  const SizedBox(height: 10),
                  const Text(
                    kNamaAplikasi,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17.5,
                      fontWeight: FontWeight.w800,
                      color: kPrimaryDark,
                    ),
                  ),
                  const SizedBox(height: 3),
                  const Text(
                    'Versi 1.0.0 — UTS Pengembangan Aplikasi Mobile',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF64748B),
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Divider(),
                  _buildInfoRow(
                    icon: Icons.assignment_rounded,
                    title: 'Nama Aplikasi',
                    subtitle: kNamaAplikasi,
                  ),
                  const Divider(height: 1),
                  _buildInfoRow(
                    icon: Icons.person_rounded,
                    title: 'Nama Mahasiswa Pembuat Aplikasi',
                    subtitle: kNamaMahasiswa,
                  ),
                  const Divider(height: 1),
                  _buildInfoRow(
                    icon: Icons.badge_rounded,
                    title: 'Nomor Induk Mahasiswa (NIM)',
                    subtitle: kNimMahasiswa,
                  ),
                  const Divider(height: 1),
                  _buildInfoRow(
                    icon: Icons.school_rounded,
                    title: 'Program Studi',
                    subtitle: kProgramStudi,
                  ),
                  const Divider(height: 1),
                  _buildInfoRow(
                    icon: Icons.account_balance_rounded,
                    title: 'Nama Universitas',
                    subtitle: kNamaUniversitas,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
