import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'OrderPage.dart';
import 'AboutPage.dart';

class HomePage extends StatelessWidget {
  final String username;

  HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Page',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app, color: Colors.redAccent),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    'Selamat Datang, $username!',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => AboutPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: const Text(
                      'Klik untuk ke Halaman About',
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                  ),
                  
                  SizedBox(height: 20),
                  Text(
                    'Daftar Menu:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final item = menuItems[index]; // Perbaikan di sini
                  return Card(
                    child: ListTile(
                      leading: Image.asset(
                        item.image,
                        width: 50,
                        height: 50,
                      ),
                      title: Text(item.name),
                      subtitle: Text(item.price),
                      trailing: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderPage(
                                name: item.name,
                                price: int.parse(item.price.replaceAll("Rp ", "").replaceAll(".", "")), // Ubah harga jadi integer
                                image: item.image,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        child: Text(
                          'Pesan',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  final String name;
  final String price;
  final String image;

  MenuItem({required this.name, required this.price, required this.image});
}

final List<MenuItem> menuItems = [
  MenuItem(
    name: "Nasi Goreng",
    price: "Rp 15.000",
    image: "assets/piring.jfif",
  ),
  MenuItem(
    name: "Mie Ayam",
    price: "Rp 12.000",
    image: "assets/piring.jfif",
  ),
  MenuItem(
    name: "Sate Ayam",
    price: "Rp 20.000",
    image: "assets/piring.jfif",
  ),
  MenuItem(
    name: "Bakso",
    price: "Rp 10.000",
    image: "assets/piring.jfif",
  ),
  MenuItem(
    name: "Soto Ayam",
    price: "Rp 13.000",
    image: "assets/piring.jfif",
  ),
  MenuItem(
    name: "Gado-Gado",
    price: "Rp 14.000",
    image: "assets/piring.jfif",
  ),
];
