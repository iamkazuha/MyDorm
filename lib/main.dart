import 'package:flutter/material.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/verification': (context) => VerificationPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
            // Gambar
              Image.network(
                'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiqvtIr85ARUS8mHTlp-K5aVAfnOzA1luOnqhXicIsFz_aVzAAxS2xWNWwPncWDw-x5OYNTEWFk-1i5P99HwbIY4ajGwdncB_gHe_J6Tz4igie4ZPjLRrhlCMyHkGiHu4XvHcK18KVqquAaXMq_sgIHAHghwZ_Jj4oQ_tZNAFcsFGefRgRUDB2igeXr/s780/asrama-780x470.jpeg',
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16.0),
              Text(
                'Masuk menggunakan akun dan password yang terdaftar pada IGracias',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (value) {
                      setState(() {
                        _rememberMe = value!;
                      });
                    },
                  ),
                  Text('Ingat Saya'),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  // Memanggil fungsi untuk melakukan proses login
                  _login(context);
                },
                child: Text('Login'),
              ),
            ],
          ),
        )
      ),
    );
  }

  // Fungsi untuk melakukan proses login
  void _login(BuildContext context) {
    // Username dan password yang sudah ditentukan
    String validUsername = 'username';
    String validPassword = 'password';

    // Mendapatkan nilai yang dimasukkan oleh pengguna
    String username = 'username'; // Anda dapat mengambil nilai dari TextField
    String password = 'password'; // Anda dapat mengambil nilai dari TextField

    // Memeriksa apakah nilai yang dimasukkan cocok dengan nilai yang sudah ditentukan
    if (username == validUsername && password == validPassword) {
      // Jika cocok, navigasi ke halaman verifikasi
      Navigator.pushNamed(context, '/verification');
    } else {
      // Jika tidak cocok, tampilkan pesan kesalahan
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Gagal'),
            content: Text('Username atau password tidak valid.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}


class VerificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verification'),
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Gambar
              Image.network(
                'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiqvtIr85ARUS8mHTlp-K5aVAfnOzA1luOnqhXicIsFz_aVzAAxS2xWNWwPncWDw-x5OYNTEWFk-1i5P99HwbIY4ajGwdncB_gHe_J6Tz4igie4ZPjLRrhlCMyHkGiHu4XvHcK18KVqquAaXMq_sgIHAHghwZ_Jj4oQ_tZNAFcsFGefRgRUDB2igeXr/s780/asrama-780x470.jpeg',
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16.0),
            Text(
              'Masukkan Kode sesuai kode authenticator akun IGracias',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Kode Verifikasi',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                // Implementasi logika verifikasi di sini
                _verify(context);
              },
              child: Text('Verifikasi'),
            ),
          ],
        ),
      )
    ),
  );
}

  // Fungsi untuk melakukan verifikasi
  void _verify(BuildContext context) {
    // Implementasi logika verifikasi di sini

    // Jika verifikasi berhasil, navigasi ke halaman beranda
    Navigator.pushNamed(context, '/home');
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Selamat Datang, Batman'),
          backgroundColor: Color.fromARGB(255, 255, 0, 0),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Profile Section
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://tse3.mm.bing.net/th?id=OIP.5asUeu3qVrMOaxjSO-XlMwHaEJ&pid=Api&P=0&h=180',
                        ),
                        radius: 30.0,
                      ),
                      SizedBox(width: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nama: BATMAN',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Gedung 5 - No. 203',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              // Banner Section
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.network(
                    'https://lelogama.go-jek.com/post_featured_image/bts-meal-banner.jpg', // Ganti dengan URL gambar banner Anda
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              // Menu Section
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  children: [
                    _buildMenuItem(
                      context,
                      icon: Icons.shopping_cart,
                      title: 'TjMart Online',
                    ),
                    _buildMenuItem(
                      context,
                      icon: Icons.electrical_services,
                      title: 'Beli Token Listrik',
                    ),
                    _buildMenuItem(
                      context,
                      icon: Icons.qr_code_scanner,
                      title: 'Scan Kunci Asrama',
                    ),
                    _buildMenuItem(
                      context,
                      icon: Icons.chat,
                      title: 'Keluhan Chat/Call',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              backgroundColor: Color.fromARGB(255, 255, 0, 0),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              backgroundColor: Color.fromARGB(255, 255, 0, 0),
              label: 'Transaksi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              backgroundColor: Color.fromARGB(255, 255, 0, 0),
              label: 'Notifikasi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              backgroundColor: Color.fromARGB(255, 255, 0, 0),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, {required IconData icon, required String title}) {
    return InkWell(
      onTap: () {
        // Tambahkan aksi ketika menu ditekan
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Menu $title ditekan.'),
          ),
        );
      },
      child: Card(
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 48.0,
              ),
              SizedBox(height: 8.0),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
