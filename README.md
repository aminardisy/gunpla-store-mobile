# Tugas 7
### Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
1. Stateless Widget
Stateless widget adalah widget yang tidak memiliki state atau kondisi yang dapat berubah. Dengan kata lain, ia bersifat statis dan tidak mengalami perubahan setelah pertama kali diinisialisasi. Karena itu, widget ini cocok untuk elemen-elemen UI yang tidak perlu diperbarui atau diubah saat aplikasi berjalan.
2. Stateful Widget
Stateful widget adalah widget yang dapat berubah seiring waktu, karena memiliki state atau kondisi yang dapat berubah. Widget ini digunakan ketika tampilan atau interaksi pengguna dapat mengubah tampilan widget secara dinamis. Stateful widget membutuhkan dua kelas: satu untuk mendefinisikan widget itu sendiri, dan satu lagi untuk mengelola state dari widget tersebut.
Perbedaan Utama
1. State:
- Stateless widget tidak memiliki state yang bisa diubah setelah dibangun.
- Stateful widget memiliki state yang bisa diperbarui secara dinamis dengan setState().
2. Penggunaan:
- Stateless widget digunakan untuk komponen yang bersifat statis atau tidak berubah.
- Stateful widget digunakan untuk komponen yang interaktif atau dinamis, seperti tombol, formulir, atau elemen yang memerlukan pembaruan UI.
3. Efisiensi:
- Stateless widget lebih efisien dalam penggunaan memori dan performa karena tidak perlu melacak perubahan state.
- Stateful widget sedikit lebih memakan memori dan membutuhkan proses tambahan karena harus melacak perubahan pada state-nya.
- Stateless dan stateful widget ini membantu pengembang mengatur kapan dan di mana UI perlu diperbarui secara efisien dalam aplikasi Flutter.

# Tugas 8
### Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru dengan ketentuan sebagai berikut:
- Memakai minimal tiga elemen input, yaitu name, amount, description. Tambahkan elemen input sesuai dengan model pada aplikasi tugas Django yang telah kamu buat.
- Memiliki sebuah tombol Save.
- Setiap elemen input di formulir juga harus divalidasi dengan ketentuan sebagai berikut:
    - Setiap elemen input tidak boleh kosong.
    - Setiap elemen input harus berisi data dengan tipe data atribut modelnya.

Untuk menambahkan halaman form dengan elemen input yang diinginkan, buat file baru dengan nama gunplaentry_form.dart yang diisi dengan kode berikut:
```dart
import 'package:flutter/material.dart';
import 'package:gunpla_store/widgets/left_drawer.dart';

class GunplaEntryFormPage extends StatefulWidget {
  const GunplaEntryFormPage({super.key});

  @override
  State<GunplaEntryFormPage> createState() => _GunplaEntryFormPageState();
}

class _GunplaEntryFormPageState extends State<GunplaEntryFormPage> {
  final _formKey = GlobalKey<FormState>();
	String _name = "";
	int _price = 0;
	String _description = "";
  String _sizeRatio = "";
  String _extentions = "";
  String _notes = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Tambah Gunpla',
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer() ,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama",
                    labelText: "Nama",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Nama tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Harga",
                    labelText: "Harga",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _price = int.tryParse(value!) ?? 0;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Harga tidak boleh kosong!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Harga harus berupa angka!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Deskripsi",
                    labelText: "Deskripsi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Deskripsi tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Rasio ukuran",
                    labelText: "Rasio ukuran",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _sizeRatio = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Rasio tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Ekstensi",
                    labelText: "Ekstensi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _extentions = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Ekstensi tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Notes",
                    labelText: "Notes",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _notes = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Notes tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                          Theme.of(context).colorScheme.primary),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Mood berhasil tersimpan'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Nama: $_name'),
                                    Text('Harga: $_price'),
                                    Text('Desripsi: $_description'),
                                    Text('Rasio: $_sizeRatio'),
                                    Text('Ekstensi: $_extentions'),
                                    Text('Notes: $_notes'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _formKey.currentState!.reset();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
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
```












