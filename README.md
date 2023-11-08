# CakeStock - Pengelolaan Stok Produk pada Toko Kue

Nama: Lucinda Laurent<br>
NPM: 2206024745<br>
Kelas: PBP A<br>

# Tugas 7
## Checklist Tugas
- [x] Membuat sebuah proyek Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya.
* Menjalankan `flutter create cakestock` pada direktori lokal.
* Membuat file baru bernama `menu.dart` pada direktori `cakestock/lib`
* Menambahkan kode `import 'package:flutter/material.dart';` pada baris pertama `menu.dart`
* Membuat widget stateless MyHomePage 
```
class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            ...
        );
    }
}
```
* Menghubungkan `main.dart` dengan `menu.dart`:
    * Menambahkan `import 'package:cakestock/menu.dart';` pada `main.dart`
    * Pastikan MaterialApp yang di-return di `main.dart` memiliki atribut `home: MyHomePage()`

- [x] Membuat tiga tombol sederhana (Lihat Item, Tambah Item, dan Logout) dengan ikon dan teks.
* Membuat objek yang menyimpan data tombol, yakni nama dan ikonnya di `menu.dart`
```
class CakeItem {
  final String name;
  final IconData icon;

  CakeItem(this.name, this.icon);
}
``` 
* Tambahkan list berisi objek tombol yang akan ditampilkan di dalam class MyHomePage (di bawah `MyHomePage({Key? key}) : super(key: key);`)
```
final List<CakeItem> items = [
    CakeItem("Lihat Item", Icons.checklist),
    CakeItem("Tambah Item", Icons.add_shopping_cart),
    CakeItem("Logout", Icons.logout),
  ];
```
* Melengkapi kode Widget build pada MyHomePage
```
return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CakeStock',
        ),
      ),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'Cake Shop', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((CakeItem item) {
                  // Iterasi untuk setiap item
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
```
- [x] Memunculkan Snackbar saat tombol ditekan dengan tulisan keterangan tombol apa yang ditekan.
* Membuat widget stateless baru untuk menampilkan tombol dan mengatur supaya jika ada snackbar yang sedang tampil, maka disembunyikan dulu sebelum menampilkan snackbar yang baru.
```
class ShopCard extends StatelessWidget {
  final CakeItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.indigo,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```
- [x] Membuat repositori baru di github bernama `cakestock-mobile` dengan visibilitas Public.
- [x] Menghubungkan repositori lokal dengan repositori di github.

## Jawaban Pertanyaan
#### Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
Widget adalah semua komponen yang kita lihat di aplikasi flutter seperti button, icon, dan bahkan text. State merupakan informasi atau data yang ada pada suatu widget. Setiap widget menyimpan state yang terbagi menjadi dua jenis berdasarkan dapat berubah atau tidaknya suatu state. Stateless widget adalah widget yang state-nya tidak dapat berubah (immutable) selama runtime aplikasi. Beberapa contoh stateless widget adalah Icon, Text,dan TextButton. Sementara itu stateful widget adalah widget yang propertinya dapat berubah selama runtime(mutable). Perubahan state pada stateful widget merupakan respon terhadap interaksi pengguna maupun pada saat menerima data. Beberapa contoh stateful widget antara lain Checkbox, TextField, dan Slider.
#### Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
1. `MyApp`: berperan sebagai root widget aplikasi
2. `MaterialApp`: widget yang di-return oleh MyApp, berfungsi untuk mengimplementasikan _Material Design_ yang menyediakan konfigurasi untuk tema, navigasi, dan judul aplikasi
3. `ThemeData`: mengatur tema global yang akan digunakan oleh _MaterialApp_
4. `ColorScheme`: mengatur skema warna aplikasi
5. `MyHomePage`: custom widget sebagai halaman utama aplikasi
6. `Scaffold`: struktur visual dasar untuk aplikasi _Material Design_
7. `AppBar`: sebagai bar aplikasi _Material Design_ yang berada di atas Scaffold
8. `Text`: menampilkan teks dalam satu gaya font tunggal
9. `Theme`: dalam tugas ini digunakan untuk mengambil warna latar belakang AppBar
10. `SingleChildScrollView`: widget wrapper yang dapat di-scroll jika child-nya melebihi ukuran layar
11. `Padding`: mengatur padding dari halaman 
12. `Column`: menampilkan children-nya dalam urutan vertikal 
13. `GridView.count`: membuat layout grid dengan jumlah kolom tetap
14. `ShopCard`: custom widget untuk menampilkan tombol dalam tugas ini
15. `Material`: memberikan efek visual _Material Design_ pada widget child-nya
16. `InkWell`: widget yang merespon sentuhan dengan efek visual splash, berperan sebagai tombol dalam tugas ini
17. `Container`: widget wrapper untuk mengelompokkan beberapa widget sebagai satu kesatuan fungsional maupun untuk memberi setting (misal ukuran dan posisi) yang sama 
18. `Center`: widget yang memposisikan child-nya di tengah
19. `Icon`: menampilkan ikon _Material Design_
20. `SnackBar`: menampilkan pesan singkat di bagian bawah layar