import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/pages/home_page.dart';

class Pokemon extends StatefulWidget {
  final Color? typecolor;

  var heroTag;

  Pokemon(
      {Key? key, this.pokemon_data, this.color, this.typecolor, this.heroTag})
      : super(key: key);
  final pokemon_data;
  final Color? color;

  @override
  _PokemonState createState() => _PokemonState();
}

class _PokemonState extends State<Pokemon> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: size.width,
              height: size.height * 0.6,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Candies req. to evolve :  ",
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[800]),
                          ),
                          Text(
                            widget.pokemon_data['candy_count'].toString() ==
                                    "null"
                                ? "Max"
                                : widget.pokemon_data['candy_count'].toString(),
                            style: GoogleFonts.poppins(
                                fontSize: 40,
                                fontWeight: FontWeight.w800,
                                color: widget.color),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Distance to hatch egg :  ",
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[800]),
                          ),
                          Text(
                            widget.pokemon_data['egg'] != "Not in Eggs"
                                ? widget.pokemon_data['egg'].toString()
                                : "-",
                            style: GoogleFonts.poppins(
                                fontSize: 40,
                                fontWeight: FontWeight.w800,
                                color: widget.color),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              widget.pokemon_data['type'][0],
                              style: GoogleFonts.poppins(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  color: widget.typecolor),
                            ),
                            Text(
                              'Species',
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[600]),
                            )
                          ],
                        ),
                        Container(
                          width: 2,
                          height: 60,
                          color: Colors.grey,
                        ),
                        Column(
                          children: [
                            Text(
                              widget.pokemon_data['height'],
                              style: GoogleFonts.poppins(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  color: widget.typecolor),
                            ),
                            Text(
                              'Height',
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[600]),
                            )
                          ],
                        ),
                        Container(
                          width: 2,
                          height: 60,
                          color: Colors.grey,
                        ),
                        Column(
                          children: [
                            Text(
                              widget.pokemon_data['weight'],
                              style: GoogleFonts.poppins(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  color: widget.typecolor),
                            ),
                            Text(
                              'Weight',
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[600]),
                            )
                          ],
                        ),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Weakness',
                                  style: GoogleFonts.poppins(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600,
                                      color: widget.typecolor),
                                ),
                                Text(
                                  widget.pokemon_data['weaknesses'].join(" , "),
                                  style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey[600]),
                                )
                              ],
                            )
                          ],
                        ))
                  ],
                ),
              )),
            ),
          ),
          Positioned(
            right: 0,
            top: 100,
            child: Container(
                width: 200,
                height: 200,
                child: Image(image: Image.asset('images/pokeball.png').image)),
          ),
          Positioned(
            right: -100,
            top: 130,
            left: 0,
            child: Hero(
              tag: widget.heroTag,
              child: Container(
                  width: 200,
                  height: 300,
                  child: CachedNetworkImage(
                    imageUrl: widget.pokemon_data['img'],
                    fit: BoxFit.fitHeight,
                    placeholder: (context, url) => Container(
                      width: 200,
                      height: 300,
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
                  )),
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: Text(widget.pokemon_data["name"],
                style: GoogleFonts.poppins(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
          Positioned(
            top: 110,
            left: 20,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  color: widget.typecolor,
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Center(
                  child: Text(widget.pokemon_data["type"].join(", "),
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
