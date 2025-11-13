import 'package:flutter/material.dart';

class BeritaPage extends StatelessWidget {
  const BeritaPage({super.key});

  static final List<Map<String, String>> _berita = [
    {
      'judul': 'Flutter 4.0 Resmi Dirilis',
      'isi': 'Versi terbaru Flutter menghadirkan performa yang lebih cepat dan stabil.'
    },
    {
      'judul': 'Cuaca Panas Melanda Kota Besar',
      'isi': 'Warga diminta untuk mengurangi aktivitas di luar ruangan pada siang hari.'
    },
    {
      'judul': 'Teknologi AI Kian Populer',
      'isi': 'Penggunaan AI meningkat di berbagai sektor termasuk kesehatan dan pendidikan.'
    },
    {
      'judul': 'Produksi Pisang Nasional Meningkat',
      'isi': 'Petani pisang melaporkan hasil panen meningkat berkat cuaca yang mendukung.'
    },
    {
      'judul': 'Harga Bahan Pokok Stabil',
      'isi': 'Pemerintah memastikan pasokan bahan pokok cukup menjelang libur panjang.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: _berita.length,
      itemBuilder: (context, index) {
        final item = _berita[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 3,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blueAccent,
              child: Text(
                '${index + 1}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(
              item['judul']!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text(item['isi']!),
          ),
        );
      },
    );
  }
}
