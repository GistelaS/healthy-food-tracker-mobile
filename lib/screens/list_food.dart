import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:healthy_food_tracker/models/food.dart';
import 'package:healthy_food_tracker/widgets/left_drawer.dart';

class FoodPage extends StatefulWidget {
    const FoodPage({Key? key}) : super(key: key);

    @override
    State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
Future<List<Food>> fetchFood() async {
    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    var url = Uri.parse(
        'http://127.0.0.1:8000/json/');
    var response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Food
    List<Food> listFood = [];
    for (var d in data) {
        if (d != null) {
            listFood.add(Food.fromJson(d));
        }
    }
    return listFood;
}

@override
Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Food'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchFood(),
            builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                } else {
                    if (!snapshot.hasData) {
                        return const Column(
                            children: [
                                Text(
                                    "Tidak ada data food.",
                                    style: TextStyle(
                                        color: Color(0xff59A5D8),
                                        fontSize: 20
                                    ),
                                ),
                                SizedBox(height: 8),
                            ],
                        );
                    } else {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (_, index) => Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12
                                ),
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
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
                                        Text("${snapshot.data![index].fields.calories}"),
                                        const SizedBox(height: 10),
                                        Text("${snapshot.data![index].fields.description}")
                                    ],
                                ),
                            ),
                        );
                    }
                }
            }),
        );
    }
}


