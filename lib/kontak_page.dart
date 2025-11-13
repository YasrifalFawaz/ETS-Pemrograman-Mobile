import 'package:flutter/material.dart';

class KontakPage extends StatelessWidget {
  const KontakPage({super.key});

  // Data statis: 15 kontak (nama + nomor)
  static final List<Map<String, String>> _kontak = List.generate(
    15,
    (i) => {
      'name': 'Kontak ${i + 1}',
      'phone': '+62 812-3456-78${(i + 1).toString().padLeft(2, '0')}'
    },
  );

  String _initials(String name) {
    final parts = name.split(' ');
    if (parts.length == 1) return parts[0].substring(0, 1).toUpperCase();
    return (parts[0][0] + parts[1][0]).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Kontak'),
        centerTitle: true,
        elevation: 2,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: _kontak.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final item = _kontak[index];
          final name = item['name']!;
          final phone = item['phone']!;

          // create a slightly more stylish card with circle avatar
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: CircleAvatar(
                radius: 26,
                backgroundColor: Colors.primaries[index % Colors.primaries.length].shade700,
                child: Text(
                  _initials(name),
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Text(phone),
              trailing: IconButton(
                icon: const Icon(Icons.phone),
                onPressed: () {
                  // aksi sederhana: tampilkan snackbar (placeholder untuk panggilan)
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Panggil $phone')), 
                  );
                },
              ),
              onTap: () {
                // contoh interaksi: tampilkan detail di bottom sheet
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  builder: (_) => Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.primaries[index % Colors.primaries.length].shade700,
                              child: Text(_initials(name), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 4),
                                Text(phone),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                icon: const Icon(Icons.message),
                                label: const Text('Kirim Pesan'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Kirim pesan ke $phone')));
                                },
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: OutlinedButton.icon(
                                icon: const Icon(Icons.copy),
                                label: const Text('Salin Nomor'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Nomor $phone disalin (simulasi)')));
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
