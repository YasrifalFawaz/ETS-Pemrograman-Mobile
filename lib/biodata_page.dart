import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Pastikan Anda sudah menambahkan 'intl' di pubspec.yaml

class BiodataPage extends StatefulWidget {
  const BiodataPage({super.key});

  @override
  State<BiodataPage> createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {
  // Variabel untuk menyimpan state dari input
  String? _selectedGender = 'Laki-laki';
  String? _selectedHobby;
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  // List opsi untuk dropdown
  final List<String> _hobbies = ['Membaca', 'Olahraga', 'Gaming', 'Musik', 'Menulis'];

  @override
  void initState() {
    super.initState();
    // Inisialisasi data dummy
    _selectedHobby = _hobbies[0]; // Set hobi default
    _dateController.text = DateFormat('dd MMMM yyyy').format(_selectedDate);
  }

  @override
  void dispose() {
    _addressController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  // Fungsi untuk menampilkan date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1950),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('dd MMMM yyyy').format(_selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // === BAGIAN PROFIL ===
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.blueAccent,
              // Jika Anda punya gambar di assets:
              backgroundImage: AssetImage('assets/images/profil.jpg'),
            ),
            const SizedBox(height: 16),
            const Text(
              "Yasrifal Fawaz", 
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              "152023024", 
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const Text(
              "Informatika", 
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const Divider(height: 40),

            // === BAGIAN INPUT ===
            // Sesuai permintaan: Dropdown, Radio, Teks, Kalender 
            
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- Input Teks  ---
                    TextFormField(
                      controller: _addressController,
                      decoration: const InputDecoration(
                        labelText: 'Alamat',
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.home),
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 20),

                    // --- Input Dropdown  ---
                    DropdownButtonFormField<String>(
                      value: _selectedHobby,
                      decoration: const InputDecoration(
                        labelText: 'Hobi',
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.sports_esports),
                      ),
                      items: _hobbies.map((String hobby) {
                        return DropdownMenuItem<String>(
                          value: hobby,
                          child: Text(hobby),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedHobby = newValue;
                        });
                      },
                    ),
                    const SizedBox(height: 20),

                    // --- Input Kalender  ---
                    TextFormField(
                      controller: _dateController,
                      decoration: const InputDecoration(
                        labelText: 'Tanggal Lahir',
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.calendar_today),
                      ),
                      readOnly: true, // Membuat field ini tidak bisa diketik
                      onTap: () {
                        _selectDate(context); // Memanggil date picker saat diklik
                      },
                    ),
                    const SizedBox(height: 20),

                    // --- Input Radio Button  ---
                    const Text("Jenis Kelamin:", style: TextStyle(fontSize: 16)),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text('Laki-laki'),
                            value: 'Laki-laki',
                            groupValue: _selectedGender,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedGender = value;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text('Perempuan'),
                            value: 'Perempuan',
                            groupValue: _selectedGender,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedGender = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Data tidak perlu disimpan [cite: 19]
                // Tapi kita bisa tampilkan snackbar sebagai bukti input berhasil
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Data input diterima (tidak disimpan)')),
                );
              },
              child: const Text('Simpan (Demo)'),
            ),
          ],
        ),
      ),
    );
  }
}