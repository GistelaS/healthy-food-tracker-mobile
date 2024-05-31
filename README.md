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

- ## TUGAS 8 (Flutter Navigation, Layouts, Forms, and Input Elements)

- #### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)


- ### Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru dengan ketentuan sebagai berikut:

    - #### Memakai minimal tiga elemen input, yaitu name, amount, description. Tambahkan elemen input sesuai dengan model pada aplikasi tugas Django yang telah kamu buat.

    Pada file 

    ```

    trackerlist_form.dart

    ```

    saya menambahkan field berikut

    ```

     String _name = "";
    int _page = 0;
    String _description = "";

    ```

    - #### Memiliki sebuah tombol Save
    
    Lalu saya menambahkan kode berikut

    ```

        Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.indigo),
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

    ```
    - #### Setiap elemen input di formulir juga harus divalidasi dengan ketentuan sebagai berikut :

        - ##### Setiap elemen input tidak boleh kosong.

        Saya memasukkan pada folder bernama lib dan file trackerlist_form.dart dengan

        ```
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Food",
                            labelText: "Food",
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
                            return "Food tidak boleh kosong!";
                            }
                            return null;
                        },
                    ),
                ),

        ```

        dan juga

        ```

        Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Calories",
                    labelText: "Calories",
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    ),
                ),
                onChanged: (String? value) {
                    setState(() {
                    // TODO: Tambahkan variabel yang sesuai
                    ... = int.tryParse(value!) ?? 0;
                    });
                },
                validator: (String? value) {
                    if (value == null || value.isEmpty) {
                        return "Calories tidak boleh kosong!";
                    }
                    if (int.tryParse(value) == null) {
                        return "Calories harus berupa angka!";
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
                    // TODO: Tambahkan variabel yang sesuai
                    ... = value!;
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

        ```
    - #### Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama.

    - #### Ketika memiih opsi Tambah Item, maka aplikasi akan mengarahkan pengguna ke halaman form tambah item baru.

    Saya memasukkan kode berikut pada menu.dart dengan :

    ```

        // Area responsif terhadap sentuhan
    onTap: () {
        // Memunculkan SnackBar ketika diklik
        ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));

        // Navigate ke route yang sesuai (tergantung jenis tombol)
        if (item.name == "Tambah Food") {
            // TODO: Gunakan Navigator.push untuk melakukan navigasi ke MaterialPageRoute yang mencakup TrackerFormPage.
        }
    },

    ```

- ### Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.

    Pada folder lib di file trackerlist_form.dart dengan kode :

    ```

        Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.indigo),
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

    ```

- ### Membuat sebuah drawer pada aplikasi dengan ketentuan sebagai berikut:

    - ####  Drawer minimal memiliki dua buah opsi, yaitu Halaman Utama dan Tambah Item.

    - #### Ketika memiih opsi Halaman Utama, maka aplikasi akan mengarahkan pengguna ke halaman utama

    Pada file left_drawer.dart saya menambahkan kode berikut :

    ```

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
        leading: const Icon(Icons.library_add_rounded),
        title: const Text('Tambah Food'),
        // Bagian redirection ke TrackerFormPage
        onTap: () {
        /*
        TODO: Buatlah routing ke TrackerFormPage di sini,
        setelah halaman TrackerFormPage sudah dibuat.
        */
        },
    ),

    ```




- ### Menjawab beberapa pertanyaan berikut pada README.md pada root folder (silakan modifikasi README.md yang telah kamu buat sebelumnya; tambahkan subjudul untuk setiap tugas).

    - #### Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!


    a. Navigator.push() :

       Metode ini menambahkan rute baru di atas rute yang ada di tumpukan navigasi. Contohnya :
       
       ```

       Navigator.push(context,
       
       MaterialPageRoute(builder: (context) {

        return LocationScreen();
       }));

       ```

       Setelah menggunakan push (), tumpukan navigasi  akan terlihat seperti ini : /A /B /D (jika rute sebelumnya adalah /A dan kita ingin menuju ke rute /D).

    b. Navigator.pushReplacement() :

        Metode ini menggantikan rute yang ada di tumpukan navigasi dengan rute baru. Contoh :

        ```

        Navigator.pushReplacement(context,

        MaterialPageRoute(builder: (context) {

          return LocationScreen();
        }));

        ```

        Setelah menggunakan pushReplacement. tumpukan navigasu akan terlihat seperti ini: /A /B / D(rute /C digantikan dengan rute /D).

        Perbedaan utamanya adalah pushReplacement() hanya menggantikan rute pertama, sedangkan push() dapat menambahkan rute beru ke awal rute mana pun di tumpukan navigasi. Selain itu, pushReplacement() juga dapat digunakan untuk mengganti beberapa rute hingga batas yang ditentukan menggunakan pushAndRemoveUntil().

    ```


    - #### Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!

    ```

    a. Center adalah widget yang memusatkan widget turunannya secara horizontal dan vertikal pada layar. Contoh :

    ```

    Center(

      child: Text('Hello, World!'),
    )

    ```

    Digunakan bila ingin menempatkan widget di tengah layar

    b. Column adalah widget yang menyusun turunannya secara vertikal dari atas ke bawah. Contoh :

    ```

    Column(
      children: [
        Text('Item 1),
        Text('Item 2'), 
        // ...
      ],
    )

    ```

    Digunakan untuk membuat tata letak lapisan vertikal seperti daftar dan tampilan lapisan.

    c. ListView adalah widget yang mengatur turunannya ke dalam daftar bergulir. 

    ```

    ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return LitTile(title: Text(items[index]));
      },
    )

    ```

    Digunakan agar dapat menggulir daftar item yang dibuat.

    d. Row merupakan widget yang menyusun turunannnya secara horizontal dari kiri ke kanan. Contoh :

    ```

    Row(
      children: [
        Icon(Icons.star),
        Text('Rating: 4.5'),
        // ...
      ],
    )

    ```

     Digunakan untuk membuat tata letak lapisan horizontal seperti barisan ikon atau tombol.

    e. Tack adalah widget yang menyusun turunan dalam rangkap dua (urutan Z). Contoh :

    ```

    Stack(
      children: [
        Positioned(left: 10, top: 20, child:
    Text('Top Left')),
        Positioned(right: 10, bottom: 20, child:
    Text('Bottom Right)),
      ],
    )

    ```

    Berguna dalam menumpuk widget satu sama lain, yang bisa seperti lapisan teks ataupun foto.



    - ####  Bagaimana penerapan clean architecture pada aplikasi Flutter?

    ```
    Menerapkan arsitektur yang bersih di aplikasi flutter bertujuan untuk memisahkan lapisan dalam aplikasi agar lebih terstruktur dan lebih mudah unutk diuji dan dikelola. langkah-langkah implementasinya adalah sebagai berikut :

    a. Identifikasi entitas inti yang mewakili logika bisnis aplikasi. Contoh : jika membuat apliaksi daftar tugas, entitas dapat berupa tugas atau kategori. 
    
    b. Membuat Use Case yaitu yang berisi aturan bisnis untuk aplikasi. Contoh penggunaan untuk menambahkan tugas baru ke daftar.

    c. Lapisan Individual

    ```


- ## Tugas 9 (Integrasi Web Service dengan Aplikasi Flutter)



- ### Membuat halaman login pada proyek tugas Flutter.


    Pada folder authentication dan file views.py saya menambahkan kode berikut :

    ```

        from django.contrib.auth import authenticate, login as auth_login
    from django.http import JsonResponse
    from django.views.decorators.csrf import csrf_exempt

    @csrf_exempt
    def login(request):
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                auth_login(request, user)
                # Status login sukses.
                return JsonResponse({
                    "username": user.username,
                    "status": True,
                    "message": "Login sukses!"
                    # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
                }, status=200)
            else:
                return JsonResponse({
                    "status": False,
                    "message": "Login gagal, akun dinonaktifkan."
                }, status=401)

        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, periksa kembali email atau kata sandi."
            }, status=401)

    ```

- ### Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.


    Pertama saya membuka command prompt healthy_food_tracker dan memberi command 

    ```

    python manage.py startapp authentication

    ```

    lalu menambahkan authentication pada INSTALLED_APPS di file settings.py. PAda command prompt kembali saya masukkan command :

    ```

    pip install django-cors-headers

    ```

    setelah itu saya menambahkan :


    ```

    corsheaders.middleware.CorsMiddleware

    ```

    kembali saya masukkan di file settings.py kembali. Dan saya juga memasukkan kode berikut :

    ```

    CORS_ALLOW_ALL_ORIGINS = True
    CORS_ALLOW_CREDENTIALS = True
    CSRF_COOKIE_SECURE = True
    SESSION_COOKIE_SECURE = True
    CSRF_COOKIE_SAMESITE = 'None'
    SESSION_COOKIE_SAMESITE = 'None'

    ```

    Pada file views.py yang ada di folder authentication saya menambahkan kode berikut :

    ```

    from django.contrib.auth import authenticate, login as auth_login
    from django.http import JsonResponse
    from django.views.decorators.csrf import csrf_exempt

    @csrf_exempt
    def login(request):
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                auth_login(request, user)
                # Status login sukses.
                return JsonResponse({
                    "username": user.username,
                    "status": True,
                    "message": "Login sukses!"
                    # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
                }, status=200)
            else:
                return JsonResponse({
                    "status": False,
                    "message": "Login gagal, akun dinonaktifkan."
                }, status=401)

        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, periksa kembali email atau kata sandi."
            }, status=401)

    ```

    pada file urls.py yang ada pada folder authentication menambahkan kode berikut :

    ```

    from django.urls import path
    from authentication.views import login

    app_name = 'authentication'

    urlpatterns = [
        path('login/', login, name='login'),
    ]

    ```

    tidak lupa menambahkan pada file urls.py yang ada pada folder food_tracker dengan :

    ```

    path('auth/', include('authentication.urls')),

    ```


    langkah berikutnya adalah mendownload package dari http://pub.dev/packages/pbp_django_auth lalu menjalankan pada command prompt dengan :

    ```

    flutter pub add provider
    flutter pub add pbp_django_auth

    ```

    





- ### Membuat model kustom sesuai dengan proyek aplikasi Django.


    Pertama saya membuka website berikut http://app.quicktype.io/ dan mengcopy website healthy_food_tracker. Lalu mengganti nama setup menjadi Food dan type JSON language Dart. Disini saya paste yang sudah saya copy tadi dan saya copy code. Sasya menempel copy code ke folder baru bernama models dan subfolder bernama lib dan saya paste copy code yang tadi pada file baru bernama food.dart.


- ### Membuat halaman yang berisi daftar semua item yang terdapat pada ** JSON diendpoint Django yang telah kamu deploy.

    - #### Tampilkan name, amount, dan description dari masing-masing item pada halaman ini.


    Pada tahap ini saya membuka file views.py yang ada pada folder main dan menambahkan kode berikut :

    ```

        from django.views.decorators.csrf import csrf_exempt
    import json
    from django.http import JsonResponse
    ...
    @csrf_exempt
    def create_food_flutter(request):
        if request.method == 'POST':

            data = json.loads(request.body)

            new_food = Food.objects.create(
                user = request.user,
                name = data["name"],
                calories = int(data["calories"]),
                description = data["description"]
            )

            new_food.save()

            return JsonResponse({"status": "success"}, status=200)
        else:
            return JsonResponse({"status": "error"}, status=401)    

    ```


- ###  Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item. 

- ### 

    - #### Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?

        Secara teori, bisa langsung mengambil data JSON tanpa harus membuat model terlebih dahulu. Namun dalam praktiknya, ada beberapa pertimbangan. Keamanan data model dapat digunakan untuk memvalidasi dan memastikan bahwa data yang dikumpulkan sesuai dengan struktur yang diharapkan. Tanpa model, mungkin mengambil data yang tidak valid atau tidak sesuai. Akurasi model berfungsi sebagai blue print untuk memetakan data JSON menjadi objek yang lebih mudah dikelola. Tanpa model, data harus diakses dan dianalisis secara manual, yang dapat menimbulkan kesalahan dan inefisiensi. Skalabilitas jika aplikasi hanya memerlukan beberapa nilai JSON, tanpa model mungkin lebih cepat dan sederhana. Namun, jika berencana memperoleh data dalam jumlah besar dengan struktur yang beragam, lebih baik menggunakan model dalam jangka panjang. Untuk Flutter dengan Dart, dapat mengurai data JSON tanpa model menggunakan json,decode. Contoh mendapatkan nilai tunggal dari respons JSON adalah :

        ```

        void getCurrenciesRatesFromServer() {
            repository.getCurrenciesRates(selectedFromCountryCode).then((value) async {
                var response = json.decode(value);
                var usdRate = response['rates']['USD']; 
                log("Nilai USD: $usdrate");
            });
        }

        ```

        Namun, perhatikan bahwa penggunaan model disarankan untuk menghindari kesalahan dan memastikan keamanan data. Oleh karena itu, yang terbaik adalah mempertimbangkan persyaratan aplikasi dan kompleksitas data sebelum memutuskan apakah akan menggunakan suatu model.
    
    
        







    
     



    



    


    



    
    


    

        







