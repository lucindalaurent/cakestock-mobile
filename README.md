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

<details>
<summary>Tugas 8</summary>

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


Contoh struktur proyek Flutter yang menerapkan _clean architecture_: 

```
lib/
|- data/
|  |- repositories/
|- domain/
|  |- usecases/
|  |- entities/
|- presentation/
|  |- screens/
|  |- widgets/
```
</details>

# Tugas 9
## Jawaban Pertanyaan
### Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Iya, kita bisa melakukan pengambilan data JSON tanpa membuat model terlebih dahulu. Namun hal tersebut tidak lebih baik daripada membuat model sebelum pengambilan data JSON. Jika kita tidak membuat model terlebih dahulu maka proses pengolahan/pengaksesan data JSON tersebut nantinya akan lebih rumit. Dikhawatirkan ada perbedaan syntax antara Javascript dan Dart yang dapat menyebabkan masalah saat mengakses data. Dengan membuat model dan menyimpan data JSON tersebut sebagai objek dalam bahasa Dart, data tersebut akan lebih mudah diakses dan kodenya lebih mudah dibaca. 
### Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
CookieRequest adalah sebuah kelas yang digunakan untuk mengelola HTTP request dan cookie yang terkait dengan request tersebut. 
Fungsi dari CookieRequest adalah untuk menyediakan akses ke data cookie yang dibutuhkan oleh berbagai bagian dari aplikasi. CookieRequest perlu dibagikan ke semua komponen di aplikasi Flutter agar komponen-komponen yang berbeda dapat mengakses dan menggunakan data cookie tersebut tanpa perlu membuat instance CookieRequest baru.Instance CookieRequest perlu dibagikan ke semua komponen di aplikasi Flutter agar semua komponen dalam aplikasi dapat melakukan HTTP request yang terautentikasi dan semua komponen akan memiliki akses ke data pengguna yang sama. Selain itu, membagikan instance CookieRequest ke semua komponen mempermudah koordinasi dan pertukaran data antar komponen dalam aplikasi. Hal ini dapat meningkatkan efisiensi dan memastikan konsistensi dalam penggunaan data cookie di seluruh aplikasi Flutter.
### Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.
1. Fungsi `fetchProduct` mengajukan permintaan HTTP GET ke URL yang ditentukan secara asinkronus menggunakan `http.get` untuk mendapatkan semua data JSON.
2. Gunakan jsonDecode untuk decode http response dari server menjadi bentuk JSON
3. Konversi data JSON menjadi objek Item menggunakan method yang sudah didefinisikan dalam kelas Item, lalu semua objek Item disimpan dalam sebuah list.
4. Untuk tugas ini, akan ditampilkan data seluruh Item yang pernah dimasukkan user ke aplikasi web. Digunakan FutureBuilder untuk menunggu `fetchProduct` selesai, kemudian data dimuat dengan `ListView.builder` menggunakan `Card`.
###  Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
1. Membuat object request menggunakan CookieRequest
2. Pada aplikasi flutter, user akan memasukkan username dan password melalui `TextField`.
3. Aplikasi flutter membuat permintaan HTTP POST ke endpoint login Django menggunakan CookieRequest. Username dan password yang dimasukkan pengguna juga dikirimkan sebagai bagian dari body request.
4. Django memproses permintaan login, memeriksa apakah username dan password valid, dan mengirimkan respon ke aplikasi Flutter. Jika autentikasi berhasil, maka pengguna diarahkan ke halaman `MyHomePage()`. Jika gagal maka akan ditampilkan `AlertDialog()` berisi pesan bahwa login gagal.
### Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.
* `Provider`: Widget ini menyediakan objek atau data untuk diakses oleh widget di bawahnya.
* `LeftDrawer`: Widget untuk menampilkan drawer di bagian kiri pada halaman utama.
* `TextFormField`: Widget untuk menerima input teks dari pengguna pada formulir.
* `ElevatedButton`: Widget untuk menampilkan tombol untuk memicu tindakan tertentu.
* `ListView`: Widget ini digunakan untuk mengatur letak children widgetnya dalam sebuah scrollable list secara vertikal.
* `FutureBuilder`: Widget ini digunakan untuk membangun antarmuka pengguna berdasarkan hasil dari sebuah Future, yang biasanya digunakan untuk menangani operasi asinkron seperti permintaan HTTP, pembacaan file, atau tugas-tugas asinkron lainnya.
* `CircularProgressIndicator`: Widget ini digunakan sebagai indikator loading ketika aplikasi sedang menunggu data dari server.
* `Navigator.push`: Widget ini digunakan untuk menambahkan rute lain ke atas tumpukan screen (stack) saat ini.
* `Navigator.pushReplacement`: Widget digunakan untuk mengganti rute paling atas tumpukan screen (stack) saat ini.
* `MaterialPageRoute`: Widget ini digunakan untuk memberikan efek animasi ketika berpindah layar.
* `Align`: Widget ini digunakan untuk menempatkan child widget di dalamnya secara relatif terhadap posisi yang ditentukan di dalam parent.
* `SizedBox`: Widget ini digunakan untuk memberikan dimensi tetap pada child widget di dalamnya.
* `Card`: Widget untuk membungkus widget lain dalam container yang bisa dikustom background color, elevation, dan rounded cornersnya.<br>
Widget yang pernah disebutkan di tugas 7 juga masih digunakan
### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
* Melakukan push ulang kode aplikasi Django dengan memberikan sedikit perbedaan pada kode aplikasi untuk mengimplementasikan login dan logout aplikasi Flutter.
* Membuat django-app baru bernama authentication dan menambahkannya ke INSTALLED_APPS di settings.py aplikasi Django.
* Menginstall django-cors-headers dan menambahkannya ke INSTALLED_APPS dan requirements.txt, serta menambahkan corsheaders.middleware.CorsMiddleware ke MIDDLEWARE di settings.py
* Menambahkan beberapa konfigurasi berikut ke settings.py:
```CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True
CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SAMESITE = 'None'
SESSION_COOKIE_SAMESITE = 'None'
```
* Membuat method view untuk login dan logout pada authentication/views.py
* Membuat berkas urls.py pada direktori authentication dan menambahkan URL routing terhadap method view yang sudah dibuat.
* Menambahkan path('auth/', include('authentication.urls')), pada berkas library_app/urls.py
* Meng-install package Flutter untuk melakukan kontak dengan web service Django dengan menjalankan perintah flutter pub add provider dan flutter pub add pbp_django_auth
* Memodifikasi root widget untuk menyediakan CookieRequest library ke semua child widgets dengan menggunakan Provider
* Membuat berkas login.dart pada folder screens 
* Mengubah konfigurasi home pada Widget MaterialApp di berkas main.dart dari home: MyHomePage() menjadi home: LoginPage()
* Mengimplementasikan fitur logout dengan menambahkan kode pada shop_card.dart
* Memanfaatkan Quicktype untuk membuat model dengan data JSON 
* Membuat berkas baru bernama book.dart pada direktori lib/models dan mengisinya dengan kode model dari Quicktype tadi.
* Menambahkan package http dengan menjalankan perintah flutter pub add http.
* Menambahkan kode <uses-permission android:name="android.permission.INTERNET" /> pada berkas android/app/src/main/AndroidManifest.xml untuk memperbolehkan akses internet pada aplikasi Flutter.
* Membuat berkas list_item.dart
```dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cakestock/models/item.dart';
import 'package:cakestock/screens/detail_item.dart';
import 'package:cakestock/widgets/left_drawer.dart';
import 'package:cakestock/screens/user_item.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ItemPage> {
  Future<List<Item>> fetchProduct() async {
    var url = Uri.parse('https://lucinda-laurent-tugas.pbp.cs.ui.ac.id/json/');
    var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Product
    List<Item> list_product = [];
    for (var d in data) {
      if (d != null) {
        list_product.add(Item.fromJson(d));
      }
    }
    return list_product;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
            title: const Text('All Cake Item(s)'),
            backgroundColor: Colors.pinkAccent,
            foregroundColor: Colors.white,
            actions: [
              ElevatedButton(
                child: Text('My Cake Item(s) only'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserItemPage()),
                  );
                },
              ),
            ]),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchProduct(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return const Column(
                    children: [
                      Text(
                        "Tidak ada data item.",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => Column(children: [
                      Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: ListTile(
                              title: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${snapshot.data![index].fields.name}",
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                      "Price: ${snapshot.data![index].fields.price}"),
                                  const SizedBox(height: 10),
                                  Text(
                                      "Description: ${snapshot.data![index].fields.description}"),
                                ],
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailItemPage(
                                          item: snapshot.data![index])),
                                );
                              },
                            )),
                      )
                    ]),
                  );
                }
              }
            }));
  }
}

```
* Menambahkan ItemPage ke left_drawer.dart
* Mengubah fungsi tombol Lihat Item pada halaman utama agar mengarahkan ke halaman ItemPage
* 