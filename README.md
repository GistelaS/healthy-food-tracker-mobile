# healthy_food_tracker

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

- ## TUGAS 7 (Elemen Dasar Flutter)
- ###  Membuat sebuah program Flutter baru dengan tema tracker seperti tugas-tugas sebelumnya.

    Pertama saya membuka command prompter yang sudah ke direct ke storage yang diinginkan dan memberi perintah :

    
        flutter create healthy_food_tracker
        

    dan juga 

        
        cd healthy_food_tracker

    Lalu saya membuat repository baru pada github saya dengan nama healthy-food-tracker-mobile dan melakukan perintah pada command promp yaitu :

        git add .

    lalu :

        git commit -m "tugas 7"

    setelah itu :

        git branch -M main

    dan :

        git remote add origin https://github.com/GistelaS/healthy-food-tracker-mobile.git

    yang terakhir adalah :

        git push -u origin main

- ###  Membuat tiga tombol sederhana dengan masing-masing warna berbeda yang memiliki ikon dan teks untuk:

- #### Melihat daftar item (Lihat Item)

- #### Menambah item (Tambah Item)

- #### Logout (Logout)

    Pada tahap ini saya membuka main.dart dan mengubah menjadi :

    ```
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
    
    ```

    Lalu saya mengahpus beberapa bagian yang menghasilkan menjadi seperti ini :

    ```

    MyHomePage()

    ```

    Dan juga melakukan beberapa perubahan seperti :

    ```

    ...extends StatefulWidget

    ```

    menjadi :

    ```

    ...extends StatelessWidget

    ```

    dan juga menghapus 

    ```

    const

    ```

    dibagian bawah bagian yang sudah dirubah sebelumnya. Selanjutnya saya menghapus komen-komen yang ada dan juga pada bagian :

    ```

    final string title;

    ```

    dan juga menghapus seluruh class

    ```

    class _MyHomePageState extends State<MyHomePage>

    ```

    Setelah itu saya menambahkan lagi ke menu.dart yang ada pada dibawah 

    ```

    MyHomePage

    ```

    dengan :

    ```

        class TrackerItem {
        final String name;
        final IconData icon;

        TrackerItem(this.name, this.icon);
    }

    ```

    Langkah selanjutnya adalah menambahkan beberapa fungsi dibagian bawah 

    ```

    MyHomePage({Key? key}) : super(key: key);

    ```

    dengan :

    ```

        final List<TrackerItem> items = [
        TrackerItem("Lihat Food", Icons.library_foods_rounded),
        TrackerItem("Tambah Food", Icons.library_add_rounded),
        TrackerItem("Logout", Icons.logout),
    ];
    
    ```

    dan juga mengubah menjadi :

    ```

    return Scaffold(
            appBar: AppBar(
            title: const Text(
                'Healthy Food Tracker',
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
                        'Food\'s Tracker', // Text yang menandakan tracker
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
                    children: items.map((TrackerItem item) {
                        // Iterasi untuk setiap item
                        return TrackerCard(item);
                    }).toList(),
                    ),
                ],
                ),
            ),
            ),
        );

    ```

- #### Memunculkan Snackbar dengan tulisan:

    - ##### "Kamu telah menekan tombol Lihat Item" ketika tombol Lihat Item ditekan.

    - ##### "Kamu telah menekan tombol Tambah Item" ketika tombol Tambah Item ditekan.

    - ##### "Kamu telah menekan tombol Logout" ketika tombol Logout ditekan.

- ### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)

    Untuk bagian ini saya menambahkan bagian berikut pada menu.dart :

    ```

        class TrackerCard extends StatelessWidget {
        final TrackerItem item;

        const TrackerCard(this.item, {super.key}); // Constructor

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

- #### Menjawab beberapa pertanyaan berikut pada README.md pada root folder.

    - ##### Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?

    ```

    Stateless Widget:
    1.  Deskripsi: Stateless Widget adalah widget yang tidak dapat diubah atau tidak akan pernah berubah.
        Contoh Penggunaan: Stateless Widget biasanya digunakan untuk komponen yang bersifat statis, seperti halaman “Tentang Aplikasi” yang berisi informasi seperti nama, logo, dan versi aplikasi.
        Karakteristik: Tidak memerlukan perubahan state atau interaksi pengguna.Tidak dapat mengupdate tampilan, merubah warna, atau menambah jumlah baris. Nilainya tetap konstan sepanjang waktu.
    2.  Stateful Widget:
        Deskripsi: Stateful Widget adalah widget yang dinamis dan dapat berubah.
        Contoh Penggunaan: Stateful Widget digunakan ketika kita memerlukan komponen yang dapat diubah, seperti mengupdate tampilan, merubah warna, atau menambah jumlah baris.
        Karakteristik:
        Memerlukan perubahan state atau interaksi pengguna.
        Dapat mengupdate tampilan berdasarkan perubahan data.
        Menggunakan fungsi setState() untuk memberitahu widget bahwa ada perubahan pada state.
    Jadi, jika ingin membuat komponen sederhana dan bersifat statis, Stateless Widget adalah pilihan yang tepat. Namun, jika membutuhkan komponen yang dinamis, gunakan Stateful Widget.

    ```

    - ##### Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.

    ```

    Widget yang digunakan dalam tugas ini adalah icon untuk menampilkan icon, header digunakan untuk menampilkan judul aplikasi,sedangkan button saat ini hanya mampu menampilkan snackbar atau pesandilayar saat ditekan, dan card untuk sebagai button.

    ```

    - #####
     



    



    


    



    
    


    

        







