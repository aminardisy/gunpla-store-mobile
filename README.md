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

### Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama.
Tambahkan kode berikut untuk mengarahkan pengguna ke form tambah item jika pengguna menekan tombol tambah item di halaman utama:
```dart
 Widget build(BuildContext context) {
    return Material(
      ...
      child: InkWell(
        // Aksi ketika kartu ditekan.
        ...
            if (item.name == "Tambah Gunpla") {
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => const GunplaEntryFormPage()));
            }
        },
	...
```
### Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.
```dart
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
bagian kode ini yang menghandle apa saja dan bagaimana message yang muncul setelah pengguna menekan tombol save
### Membuat sebuah drawer pada aplikasi dengan ketentuan sebagai berikut:
- Drawer minimal memiliki dua buah opsi, yaitu Halaman Utama dan Tambah Item.
- Ketika memiih opsi Halaman Utama, maka aplikasi akan mengarahkan pengguna ke halaman utama.
- Ketika memiih opsi Tambah Item, maka aplikasi akan mengarahkan pengguna ke halaman form tambah item baru.
untuk membuat drawer dengan ketentuan di atas, buat file baru yang bernama left_drawer.dart dan isi dengan kode berikut:
```dart
import 'package:flutter/material.dart';
import 'package:gunpla_store/screens/gunplaentry_form.dart';
import 'package:gunpla_store/screens/menu.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Column(
              children: [
                Text(
                  'Gunpla store',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Text(
                  "Ayo tingkatkan kebahagiaanmu setiap hari dengan koleksi terbaik dari Gunpla Store!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Halaman Utama'),
              // Bagian redirection ke MyHomePage
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Tambah Gunpla'),
              // Bagian redirection ke MoodEntryFormPage
              onTap: () {
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => GunplaEntryFormPage(),
                ));
              },
            ),
        ],
      ),
    );
  }
}
```
## Menjawab Pertanyaan:
### 1. Kegunaan `const` di Flutter
`const` digunakan untuk membuat objek yang bersifat immutable (tidak dapat diubah) pada Flutter. Ini menginstruksikan Dart untuk membuat objek yang hanya satu kali dibuat di memori (compile-time constant), sehingga membantu dalam efisiensi performa aplikasi.

#### Keuntungan Menggunakan `const`:
- **Optimasi Performa**: Objek `const` hanya dibuat sekali dan dapat diakses di beberapa tempat, sehingga penggunaan memori menjadi lebih efisien.
- **Kecepatan Render**: Dengan `const`, widget tidak akan di-render ulang jika tidak ada perubahan, sehingga mengurangi beban CPU.
- **Debugging Lebih Mudah**: Mendeteksi perubahan pada objek yang seharusnya tidak berubah menjadi lebih sederhana.

#### Kapan Menggunakan `const`:
- Ketika membuat widget statis yang tidak memerlukan perubahan, misalnya `Text`, `Icon`, dan elemen statis lainnya.
- Saat mendefinisikan variabel global atau parameter yang tidak berubah.

#### Kapan Tidak Menggunakan `const`:
- Ketika objek akan diubah pada runtime.
- Pada widget dinamis yang bergantung pada data yang berubah.

### 2. Perbandingan `Column` dan `Row`
`Column` dan `Row` adalah widget layout di Flutter yang mengatur widget anak secara vertikal dan horizontal.

#### Perbandingan:
- **Column**: Menyusun widget anak dalam arah vertikal (atas ke bawah).
- **Row**: Menyusun widget anak dalam arah horizontal (kiri ke kanan).

#### Implementasi:
**Contoh Implementasi Column**:
```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Text('First Child'),
    Text('Second Child'),
    ElevatedButton(onPressed: () {}, child: Text('Button'))
  ],
)
```
### Elemen input yang digunakan:
Pada tugas ini, elemen input yang digunakan pada halaman form adalah:
- **TextFormField**: Elemen ini digunakan untuk menerima input teks dari pengguna. TextFormField mendukung berbagai fitur validasi dan penyesuaian input, yang membuatnya cocok digunakan untuk berbagai jenis data teks.
Elemen Input Flutter Lain yang Tidak Digunakan

Selain TextFormField, ada beberapa elemen input Flutter lain yang tidak digunakan dalam tugas ini, yaitu:
- DropdownButtonFormField: Digunakan untuk memilih satu item dari daftar opsi yang tersedia.
- Checkbox: Digunakan untuk input biner, misalnya persetujuan pengguna terhadap syarat dan ketentuan.
- Radio: Digunakan untuk memilih satu opsi dari beberapa pilihan.
- Slider: Digunakan untuk memilih nilai dalam rentang tertentu.
- Switch: Digunakan untuk mengaktifkan atau menonaktifkan opsi.
- DatePicker: Digunakan untuk memilih tanggal.
- TimePicker: Digunakan untuk memilih waktu.
- RangeSlider: Digunakan untuk memilih rentang nilai.
- Autocomplete: Menyediakan saran input saat pengguna mulai mengetik.

Elemen-elemen di atas dapat digunakan untuk berbagai kebutuhan input data yang lebih kompleks atau spesifik. Namun, pada tugas ini, hanya TextFormField yang dipilih untuk memenuhi kebutuhan form input yang lebih sederhana.

### Bagaimana cara mengatur tema aplikasi:
Dalam aplikasi Flutter, kita dapat mengatur tema pada widget MaterialApp, yang berfungsi seperti file base.html pada website. Widget ini menjadi referensi tema utama bagi seluruh widget dalam aplikasi, sehingga komponen lainnya dapat mengikuti gaya dan skema warna yang telah ditentukan.Pada aplikasi yang saya buat, tema dasar diatur melalui MaterialApp seperti contoh berikut:
```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple,).copyWith(secondary: Colors.deepPurple[400]),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
```

Setelah tema utama diatur, elemen lain dalam aplikasi dapat mengambil referensi dari tema ini untuk menjaga konsistensi tampilan. Berikut adalah contoh implementasi tema pada salah satu elemen di aplikasi saya:
```dart
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
```
### Cara menangani navigasi:
Untuk menghindari kebingungan dalam navigasi di Flutter, saya membagi proyek menjadi beberapa folder. Saya membuat folder `screens` yang berisi halaman-halaman yang akan ditampilkan dalam aplikasi, seperti `menu.dart` untuk halaman utama dan `gunplaentry_form.dart` untuk halaman formulir entri produk. Selain itu, saya juga membuat folder `widgets` yang berisi komponen-komponen aplikasi seperti `left_drawer.dart` dan `gunpla_card.dart`. Komponen-komponen ini dihubungkan melalui fungsi `import`, dan saya menggunakan `Navigator.push` serta `Navigator.pushReplacement` untuk navigasi antara halaman.
# Tugas 9

### 1. Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?
Membuat model untuk pengambilan atau pengiriman data JSON sangat penting karena model mempermudah proses pemetaan data JSON ke dalam struktur data yang terorganisir, seperti objek. Hal ini memudahkan untuk pengelolaan, validasi, dan manipulasi data, serta mengurangi risiko kesalahan ketika format data berubah. Jika model tidak dibuat, kita harus menangani data secara manual, yang lebih rawan error, sulit di-maintain, dan cenderung meningkatkan kompleksitas kode.

### 2. Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini
Library `http` digunakan dalam aplikasi Flutter untuk mengirim request `HTTP`, seperti `GET` dan `POST`, ke server backend. Library ini juga berfungsi untuk menerima respons dari server, termasuk mem-parsing data JSON yang dikembalikan. Jadi, `http` ini menjadi penghubung antara aplikasi Flutter dan API backend untuk mengelola pertukaran data.

### 3. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
`CookieRequest` berfungsi untuk menyimpan cookie sesi pengguna, yang berguna untuk mempertahankan status autentikasi pengguna, seperti login. Cookie ini akan secara otomatis dikirim bersama setiap request HTTP yang memerlukan autentikasi. Instance CookieRequest perlu dibagikan ke seluruh komponen aplikasi agar semua fitur yang memerlukan autentikasi dapat mengakses status sesi yang sama tanpa perlu dikelola ulang di setiap bagian aplikasi.

### 4. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
Mekanisme pengiriman data dimulai ketika pengguna memasukkan data melalui form di Flutter. Data ini kemudian dikirim ke backend melalui request `HTTP`, misalnya `POST`. Backend (Django) akan memproses data tersebut, seperti menyimpannya ke database atau menghasilkan respons tertentu. Respons dari backend, dalam format JSON, diterima oleh Flutter, diproses, dan hasilnya ditampilkan kepada pengguna di antarmuka aplikasi flutter kita.

### 5. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Proses autentikasi meliputi login, register, dan logout. Pada proses login, pengguna memasukkan kredensial di Flutter, yang kemudian dikirim ke Django melalui request POST. Django memverifikasi kredensial dan, jika valid, mengembalikan cookie atau token sesi yang disimpan di `CookieRequest`. Token ini digunakan untuk mengakses fitur yang memerlukan autentikasi. Pada register, data akun dikirim ke Django, diverifikasi, dan disimpan ke database jika valid. Django kemudian memberikan konfirmasi ke Flutter. Pada logout, Flutter mengirimkan request ke Django untuk menghapus sesi atau token, dan Django memastikan pengguna telah keluar. Setelah logout, Flutter menghapus data sesi lokal dan mengarahkan pengguna kembali ke halaman login.

## 6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
1. Pertama, saya mengimplementasikan fitur registrasi akun. Di Django, saya membuat aplikasi bernama authentication dan menambahkan fungsi `register` di file` views.py` untuk memvalidasi input, seperti memastikan password cocok dan username belum digunakan. Setelah itu, saya konfigurasi path di `urls.py`. Di Flutter, saya membuat file register.dart yang berisi form registrasi menggunakan widget seperti TextField untuk username, password, dan konfirmasi password. Saya menggunakan package pbp_django_auth untuk menghubungkan form ini dengan endpoint Django dan menampilkan pesan kesalahan jika registrasi gagal atau mengarahkan ke halaman login jika berhasil.

2. Selanjutnya, saya membuat halaman login pada Flutter. Di Django, saya menambahkan fungsi `login` di `views.py `untuk memverifikasi kredensial pengguna, lalu saya konfigurasi path di urls.py. Di Flutter, saya membuat file login.dart yang berisi form login. Saya menggunakan CookieRequest dari pbp_django_auth untuk mengirim data login ke server Django.

3. Setelah itu, saya mengintegrasikan sistem autentikasi Django dengan Flutter. Di Django, saya mengatur middleware `CorsMiddleware` pada settings.py untuk mendukung komunikasi lintas domain. Saya juga menambahkan variabel konfigurasi seperti `CORS_ALLOW_ALL_ORIGINS` dan `ALLOWED_HOSTS`. Di Flutter, saya menambahkan `Provider` di `main.dart `untuk menyediakan objek `CookieRequest` ke seluruh aplikasi, sehingga session dapat digunakan secara global.

4. Model product di django saya mencangkup `name`, `price`, `description`, dan `quantity`. Di Flutter, saya menggunakan Quicktype untuk membuat model Dart dari data JSON yang dihasilkan oleh endpoint Django.

5. Berikutnya, saya membuat halaman daftar item. Di Flutter, saya membuat file list_item.dart dan menggunakan `FutureBuilder` untuk mengambil data dari endpoint Django menggunakan `CookieRequest.get`. Data ditampilkan menggunakan widget ListView.builder, dengan menampilkan atribut seperti name, price, description, dan quantity. Saya juga memastikan view JSON untuk memfilter item berdasarkan pengguna yang sedang login menggunakan request.user.

6. Selanjutnya, saya mengimplementasikan fitur logout. Di Django, saya menambahkan fungsi logout di views.py yang memanggil `auth_logout` untuk menghapus sesi pengguna. Di Flutter, saya mengubah apa yang terjadi ketika tombol logout ditekan. Setelah logout, pengguna diarahkan kembali ke halaman login.

7. Terakhir, saya mengintegrasikan form input di Flutter dengan Django. Di Django, saya membuat path create-flutter/ untuk menerima data dari Flutter dan menyimpannya ke database. Di Flutter, saya membuat form menggunakan pbp_django_auth untuk mengirim data form ke Django.
