# CakeStock - Pengelolaan Stok Produk pada Toko Kue

Nama: Lucinda Laurent<br>
NPM: 2206024745<br>
Kelas: PBP A<br>

<details>
<summary>Tugas 7</summary>

## Checklist Tugas
- [x] Membuat sebuah proyek Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya.
* Menjalankan `flutter create cakestock` pada direktori lokal.
* Membuat file baru bernama `menu.dart` pada direktori `cakestock/lib`
* Menambahkan kode `import 'package:flutter/material.dart';` pada baris pertama `menu.dart`
* Membuat widget stateless MyHomePage 
```dart
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
```dart
class CakeItem {
  final String name;
  final IconData icon;

  CakeItem(this.name, this.icon);
}
``` 
* Tambahkan list berisi objek tombol yang akan ditampilkan di dalam class MyHomePage (di bawah `MyHomePage({Key? key}) : super(key: key);`)
```dart
final List<CakeItem> items = [
    CakeItem("Lihat Item", Icons.checklist),
    CakeItem("Tambah Item", Icons.add_shopping_cart),
    CakeItem("Logout", Icons.logout),
  ];
```
* Melengkapi kode Widget build pada MyHomePage
```dart
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
```dart
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

</details>

# Tugas 8
## Checklist Tugas
- [x] Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru
* Membuat file `addcake_form.dart` 
```dart
import 'package:flutter/material.dart';

class CakeFormPage extends StatefulWidget {
  const CakeFormPage({super.key});

  @override
  State<CakeFormPage> createState() => _CakeFormPageState();
}

class _CakeFormPageState extends State<CakeFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  int _price = 0;
  String _description = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Form Tambah Kue',
            ),
          ),
          backgroundColor: Colors.pinkAccent,
          foregroundColor: Colors.white,
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama Kue",
                    labelText: "Nama Produk",
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
                    if (int.tryParse(value) != null) {
                      return "Nama sebaiknya bersifat deskriptif :)";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Jumlah",
                    labelText: "Jumlah",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _amount = int.parse(value!);
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Jumlah tidak boleh kosong!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Jumlah harus berupa angka!";
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
                    if (int.tryParse(value) != null) {
                      return "Deskripsikan produkmu dengan kata-kata";
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
                      _price = int.parse(value!);
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
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.pinkAccent),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}

```
- [x] Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol `Tambah Item` pada halaman utama dengan memodifikasi widget `ShopCard` 
```dart
...
onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
          if (item.name == "Tambah Item") {
            //navigasi ke MaterialPageRoute yang mencakup CakeFormPage.
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const CakeFormPage(),
                ));
          }
        },
...
```
-[x] Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru dengan modifikasi tombol save.
```dart
        onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title:
                                  const Text('Kue baru berhasil ditambahkan'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Jenis kue: $_name'),
                                    Text('Jumlah: $_amount'),
                                    Text('Deskripsi: $_description'),
                                    Text('Harga: $_price'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        //pindah sini biar pesan tulisan "harga tidak kosong", dll. muncul
                        _formKey.currentState!.reset();
                      }
                    },
                    
```
- [x] Membuat sebuah drawer pada aplikasi yang memiliki opsi `halaman utama` dan `tambah item`<br> 
* Membuat file baru `left_drawer.dart` pada folder baru `widgets` 
```dart
import 'package:flutter/material.dart';
import 'package:cakestock/menu.dart';
import 'package:cakestock/addcake_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            //Bagian drawer header
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
            ),
            child: Column(
              children: [
                Text(
                  'CakeStock',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Kelola stok produk toko kuemu di sini!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          //Bagian routing
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
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Item'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CakeFormPage(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
```
* Menambahkan drawer pada `MyHomePage` dan `CakeFormPage` <br>
Pada `MyHomePage` <br> 
```dart
...
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'CakeStock',
          ),
          backgroundColor: Colors.pinkAccent,
          foregroundColor: Colors.white),
      drawer: const LeftDrawer(),
... 

```
Pada `CakeFormPage`
```
...
Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Form Tambah Kue',
            ),
          ),
          backgroundColor: Colors.pinkAccent,
          foregroundColor: Colors.white,
        ),
        drawer: const LeftDrawer(),
...
```

- [x] Tambahan: merapikan struktur folder project
* Widget ShopCard pada `menu.dart` dijadikan file terpisah `shop_card.dart` dan dimasukkan ke folder `widgets` 
* File `addcake_form.dart` dan `menu.dart` dimasukkan dalam folder `screens`


## Jawaban Pertanyaan
###  Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()`, disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
Method `Navigator.push()`akan menambahkan suatu route ke dalam stack route yang dikelola oleh Navigator. Method ini menyebabkan route yang ditambahkan berada pada paling atas stack, sehingga route yang baru saja ditambahkan tersebut akan muncul dan ditampilkan kepada pengguna. Adapun halaman sebelumnya akan tetap berada di dalam stack sehingga jika pengguna menekan tombol kembali, mereka dapat kembali ke halaman sebelumnya. <br>
Contoh penggunaannya adalah ketika pengguna ingin melihat detail suatu item dari daftar item. Kita bisa menggunakan Navigator.push() untuk membuka halaman detail tersebut, dan ketika pengguna selesai, mereka bisa kembali ke daftar item dengan menekan tombol kembali. Contoh kode:
```dart
if (item.name == "Lihat Item Ini") {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DetailPage()));
    }
```
Method `Navigator.pushReplacement()` menghapus route yang sedang ditampilkan kepada pengguna dan menggantinya dengan suatu route. Method ini menyebabkan aplikasi untuk berpindah dari route yang sedang ditampilkan kepada pengguna ke suatu route yang diberikan. Pada stack route yang dikelola Navigator, route lama pada atas stack akan digantikan secara langsung oleh route baru yang diberikan tanpa mengubah kondisi elemen stack yang berada di bawahnya. Metode ini digunakan untuk navigasi ke halaman baru dan menghapus halaman saat ini dari stack navigasi. <br>
Contoh penggunaannya adalah ketika pengguna logout dari aplikasi. Kita ingin membawa mereka kembali ke halaman login dan memastikan mereka tidak bisa kembali ke halaman yang terakhir diakses (misalnya halaman profil) dengan menekan tombol kembali. Kita bisa mengimplementasikan Navigator.pushReplacement() untuk navigasi ke halaman login. Contoh kode:
```dart
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => LoginScreen()),
);
```
### Jelaskan masing-masing _layout widget_ pada Flutter dan konteks penggunaannya masing-masing!
Secara umum, terdapat 3 jenis _layout widget_:
1. Single-child layout widgets <br>
Jenis widget ini hanya menerima satu widget sebagai child-nya dan biasanya digunakan sebagai pembungkus widget lain untuk mengubah posisi, ukuran, menambahkan ruang, margin, dan menyesuaikan konten. 
Beberapa contoh single-child layout widgets:
* Container: menggabungkan widget umum untuk _painting, positioning_, dan _sizing_
* Center: memposisikan child di tengah
* Expanded: memperluas child dari Row, Column, atau Flex sehingga child mengisi ruang yang tersedia
* Align: melakukan _alignment_ pada child
* SizedBox: "memaksa" child agar memiliki ukuran yang spesifik
2. Multi-child layout widgets <br>
Jenis widget ini dapat menerima lebih dari satu widget sebagai child-nya. Widget ini biasanya digunakan untuk membuat daftar widget dengan arah horizontal atau vertikal, menumpuk widget satu di atas yang lain, serta mengatur data atau widget dalam struktur tabel.
Beberapa contoh multi-child layout widgets:
* Column: mengatur tampilan child ke arah vertikal
* Row: mengatur tampilan child ke arah horizontal
* ListView: mengatur tampilan widgets dalam bentuk scrollable list yang linear
* Table: menampilkan child dalam format baris dan kolom
3. Sliver widgets <br>
Sliver adalah bagian dari scrollable area yang bisa kita custom. Jenis widget ini memang digunakan untuk membuat efek scroll kustom.
Beberapa contoh sliver widgets:
* SliverAppBar: material design app bar yang terintegrasi dengan CustomScrollView
* SliverGrid: menempatkan beberapa box children dalam susunan dua dimensi

###  Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
Pada tugas kali ini saya menggunakan empat buah elemen input berupa widget `TextFormField` untuk menerima input nama, jumlah, deskripsi, dan harga kue dari pengguna. Saya menggunakan `TextFormField` untuk membuat form field yang dapat memvalidasi input dan memberikan feedback kepada pengguna. Validasi input dilakukan menggunakan `validator` dengan memastikan fieldnya tidak kosong, dan diisi tipe data yang sesuai. 

### Bagaimana penerapan clean architecture pada aplikasi Flutter?
_Clean architecture_ adalah prinsip desain perangkat lunak yang menerapkan pemisahan _concerns_ dan bertujuan untuk menciptakan kode yang _modular, scalable_, dan _testable_. Pemisahan _concerns_ tersebut dilakukan dengan memisahkan sebuah aplikasi ke dalam beberapa lapisan berbeda dengan tanggung jawabnya masing-masing. 
Pada aplikasi Flutter, penerapan _clean architecture_ biasanya terdiri dari lapisan-lapisan:
1. Presentation layer (UI): terdiri dari komponen _user interface_ seperti widgets, screens, dan views. Layer ini bertanggung jawab menangani interaksi dengan pengguna dan rendering UI (termasuk _state management_).
2. Domain layer (business logic): mewakili logika bisnis aplikasi, berisi _use cases, entities,_ dan _business rules._ Use cases adalah operasi atau aksi yang bisa dilakukan dalam aplikasi. _Entities_ merepresentasikan objek penting dalam _domain layer_ serta enkapsulasi perilaku dan state objek tersebut. 
3. Data layer: bertanggung jawab atas penyimpanan dan pengaksesan data. Data layer umumnya terdiri dari _repositories_ dan _data sources_. _Repositories_ menyediakan abstraksi untuk mengakses dan memanipulasi data. Data sources bisa berupa remote APIs, local database, maupun sumber data eksternal lainnya. <br>
<br>
Contoh struktur proyek Flutter yang menerapkan _clean architecture_:
```
- lib
 - data
   - repositories
 - domain
   - entities
   - usecases
 - presentation
   - screens
   - widgets
```
