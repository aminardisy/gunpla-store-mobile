import 'package:flutter/material.dart';
import 'package:gunpla_store/models/gunpla_entry.dart';

class GunplaDetailPage extends StatelessWidget {
  final GunplaEntry gunpla;

  const GunplaDetailPage({super.key, required this.gunpla});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gunpla.fields.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name: ${gunpla.fields.name}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text("Price: ${gunpla.fields.price}"),
            const SizedBox(height: 8),
            Text("Description: ${gunpla.fields.description}"),
            const SizedBox(height: 8),
            Text("Size Ratio: ${gunpla.fields.sizeRatio}"),
            const SizedBox(height: 8),
            Text("Extensions: ${gunpla.fields.extensions}"),
            const SizedBox(height: 8),
            Text("Notes: ${gunpla.fields.notes}"),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Kembali ke halaman sebelumnya
              },
              child: const Text("Back to List"),
            ),
          ],
        ),
      ),
    );
  }
}
