import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/data.dart';
import 'package:pokedex/pages/pokemon.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

late Response response;
var dio = Dio();

var size;

Data data = Data();

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Pokedex',
            style: GoogleFonts.poppins(
                fontSize: 40, fontWeight: FontWeight.w700, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(
              data.data['pokemon'].length,
              (index) {
                var type = data.data['pokemon'][index]["type"][0];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => Pokemon(
                                    pokemon_data: data.data['pokemon'][index],
                                    heroTag: index,
                                    typecolor: type == 'Grass'
                                        ? Colors.green[700]
                                        : type == 'Fire'
                                            ? Colors.red[700]
                                            : type == 'Electric'
                                                ? Colors.yellow[700]
                                                : type == 'Water'
                                                    ? Colors.blue[700]
                                                    : type == 'Poison'
                                                        ? Colors.purple[700]
                                                        : type == 'Rock'
                                                            ? Colors.grey[700]
                                                            : type == 'Ground'
                                                                ? Colors
                                                                    .brown[700]
                                                                : type == 'Ice'
                                                                    ? Colors.cyan[
                                                                        700]
                                                                    : type ==
                                                                            'Fighting'
                                                                        ? Colors.orange[
                                                                            700]
                                                                        : type ==
                                                                                'Psychic'
                                                                            ? Colors.pink[700]
                                                                            : type == 'Ghost'
                                                                                ? Colors.grey[700]
                                                                                : type == 'Dragon'
                                                                                    ? Colors.indigo[700]
                                                                                    : type == 'Dark'
                                                                                        ? Colors.black
                                                                                        : type == 'Bug'
                                                                                            ? Colors.lightGreen[700]
                                                                                            : Colors.grey[900],
                                    color: type == 'Grass'
                                        ? Colors.green
                                        : type == 'Fire'
                                            ? Colors.red
                                            : type == 'Electric'
                                                ? Colors.yellow[700]
                                                : type == 'Water'
                                                    ? Colors.blue
                                                    : type == 'Poison'
                                                        ? Colors.purple
                                                        : type == 'Rock'
                                                            ? Colors.grey
                                                            : type == 'Ground'
                                                                ? Colors.brown
                                                                : type == 'Ice'
                                                                    ? Colors
                                                                        .cyan
                                                                    : type ==
                                                                            'Fighting'
                                                                        ? Colors
                                                                            .orange
                                                                        : type ==
                                                                                'Psychic'
                                                                            ? Colors.pink
                                                                            : type == 'Ghost'
                                                                                ? Colors.grey
                                                                                : type == 'Dragon'
                                                                                    ? Colors.indigo
                                                                                    : type == 'Dark'
                                                                                        ? Colors.black
                                                                                        : type == 'Bug'
                                                                                            ? Colors.lightGreen
                                                                                            : Colors.grey[800],
                                  )));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 4),
                          color: type == 'Grass'
                              ? Colors.green
                              : type == 'Fire'
                                  ? Colors.red
                                  : type == 'Electric'
                                      ? Colors.yellow[700]
                                      : type == 'Water'
                                          ? Colors.blue
                                          : type == 'Poison'
                                              ? Colors.purple
                                              : type == 'Rock'
                                                  ? Colors.grey
                                                  : type == 'Ground'
                                                      ? Colors.brown
                                                      : type == 'Ice'
                                                          ? Colors.cyan
                                                          : type == 'Fighting'
                                                              ? Colors.orange
                                                              : type ==
                                                                      'Psychic'
                                                                  ? Colors.pink
                                                                  : type ==
                                                                          'Ghost'
                                                                      ? Colors
                                                                          .grey
                                                                      : type ==
                                                                              'Dragon'
                                                                          ? Colors
                                                                              .indigo
                                                                          : type == 'Dark'
                                                                              ? Colors.black
                                                                              : type == 'Bug'
                                                                                  ? Colors.lightGreen
                                                                                  : Colors.grey[800],
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[200]!,
                              offset: const Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20)),
                      child: Stack(
                        children: [
                          Positioned(
                            right: -10,
                            child: Image(
                                image: Image.asset('images/pokeball.png').image,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover),
                          ),
                          Positioned(
                            bottom: 0,
                            right: -20,
                            child: Hero(
                              tag: index,
                              child: Container(
                                width: 130,
                                height: 130,
                                child: CachedNetworkImage(
                                  imageUrl: data.data['pokemon'][index]['img'],
                                  placeholder: (context, url) => Container(
                                    width: 50,
                                    height: 50,
                                    child: const Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: CircularProgressIndicator(
                                        color: Colors.black,
                                        strokeWidth: 5,
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 40,
                            left: 10,
                            child: Container(
                              height: 25,
                              decoration: BoxDecoration(
                                  color: type == 'Grass'
                                      ? Colors.green[700]
                                      : type == 'Fire'
                                          ? Colors.red[700]
                                          : type == 'Electric'
                                              ? Colors.yellow[700]
                                              : type == 'Water'
                                                  ? Colors.blue[700]
                                                  : type == 'Poison'
                                                      ? Colors.purple[700]
                                                      : type == 'Rock'
                                                          ? Colors.grey[700]
                                                          : type == 'Ground'
                                                              ? Colors
                                                                  .brown[700]
                                                              : type == 'Ice'
                                                                  ? Colors
                                                                      .cyan[700]
                                                                  : type ==
                                                                          'Fighting'
                                                                      ? Colors.orange[
                                                                          700]
                                                                      : type ==
                                                                              'Psychic'
                                                                          ? Colors
                                                                              .pink[700]
                                                                          : type == 'Ghost'
                                                                              ? Colors.grey[700]
                                                                              : type == 'Dragon'
                                                                                  ? Colors.indigo[700]
                                                                                  : type == 'Dark'
                                                                                      ? Colors.black
                                                                                      : type == 'Bug'
                                                                                          ? Colors.lightGreen[700]
                                                                                          : Colors.grey[900],
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Center(
                                  child: Text(
                                      data.data['pokemon'][index]["type"]
                                          .join(", "),
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white)),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            left: 10,
                            child: Text(
                              data.data['pokemon'][index]['name'],
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
