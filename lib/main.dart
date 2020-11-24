import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:poke_dex/details.dart';
import 'dart:convert';
import 'Pokemon.dart';
import 'package:poke_dex/Pokemon.dart';
void main()=> runApp(MaterialApp(
  title: 'PokeDex',
  home: HomePage(),
  debugShowCheckedModeBanner: false,
));
class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var url = 'https://raw.githubusercontent.com/Biuni/PokemonGo-Pokedex/master/pokedex.json';


  Pokehub pokehub;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchData();
  }
  fetchData() async{
   http.Response res = await http.get(url);
  var decodedJson=jsonDecode( res.body);

  pokehub = Pokehub.fromJson(decodedJson);
  setState(() {

  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'PokeDex',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30.0
      ),
          ),
        ),
        backgroundColor: Colors.cyan,

      ),
      body:
          pokehub == null ?

          Center(
            child: CircularProgressIndicator(),
          ):
          GridView.count(crossAxisCount: 2,children: pokehub.pokemon.map((poke) => Padding(
        padding: const EdgeInsets.all(2.0),
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Details(pokemon: poke,)));
          },
          child: Hero(
            tag: poke.img,
            child: Card(
              elevation: 3.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(poke.img),

                      )
                    ),
                  ),
                  Text(
                    poke.name,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )).toList(),
          )
    );
  }
}
