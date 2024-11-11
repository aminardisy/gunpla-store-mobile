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












