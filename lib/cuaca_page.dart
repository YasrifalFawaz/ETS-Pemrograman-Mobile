import 'package:flutter/material.dart';

class CuacaPage extends StatelessWidget {
  const CuacaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF6DD5FA), Color(0xFF2980B9)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Lokasi & Tanggal
            const Text(
              "📍 Bandung",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Kamis, 13 November 2025",
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 30),

            // Kartu suhu utama
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.white.withOpacity(0.2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: Column(
                children: [
                  const Icon(Icons.wb_sunny_rounded,
                      color: Colors.yellowAccent, size: 64),
                  const SizedBox(height: 10),
                  const Text(
                    "22°C",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 56,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Mostly Clear",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      _WeatherStat(icon: Icons.water_drop, label: "Humidity", value: "30%"),
                      _WeatherStat(icon: Icons.air, label: "Wind", value: "12 km/h"),
                      _WeatherStat(icon: Icons.compress, label: "Pressure", value: "1012 hPa"),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Judul Prakiraan 7 Hari
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "7-Day Forecast",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Daftar cuaca 7 hari
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: 7,
                itemBuilder: (context, index) {
                  final List<Map<String, dynamic>> forecast = [
                    {"day": "Fri", "temp": "24°C / 18°C", "icon": Icons.cloud},
                    {"day": "Sat", "temp": "25°C / 19°C", "icon": Icons.wb_sunny},
                    {"day": "Sun", "temp": "27°C / 20°C", "icon": Icons.wb_sunny_rounded},
                    {"day": "Mon", "temp": "26°C / 19°C", "icon": Icons.grain},
                    {"day": "Tue", "temp": "28°C / 21°C", "icon": Icons.wb_cloudy},
                    {"day": "Wed", "temp": "25°C / 19°C", "icon": Icons.thunderstorm},
                    {"day": "Thu", "temp": "23°C / 17°C", "icon": Icons.cloudy_snowing},
                  ];

                  final item = forecast[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item["day"],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(item["icon"], color: Colors.white, size: 24),
                            const SizedBox(width: 12),
                            Text(
                              item["temp"],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Komponen kecil untuk statistik cuaca
class _WeatherStat extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _WeatherStat({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 28),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
