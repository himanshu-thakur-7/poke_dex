import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:poke_dex/Pokemon.dart';
class Details extends StatelessWidget {
  final Pokemon pokemon;

  bodyWidget(BuildContext context)=>Stack(
    children: <Widget>[
      Positioned(
        height: MediaQuery.of(context).size.height/1.5,
        width: MediaQuery.of(context).size.width -20,
        left: 10.0,
        top: MediaQuery.of(context).size.height *0.1,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 90.0,
              ),
              Text(pokemon.name,style: TextStyle(fontSize: 35.0,fontWeight: FontWeight.bold),),
              Text('Height: ${pokemon.height}',style: (TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),),
              Text('Weight: ${pokemon.weight}',style: (TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),),
              Text('Types',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: pokemon.type.map((t) => FilterChip(backgroundColor: Colors.amber,label: Text(t,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),), onSelected: (b){}) ).toList(),
              ),
              Text('Weakness',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26),),
              Wrap(
                direction: Axis.horizontal,

               spacing: 10.0,
               // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: pokemon.weaknesses.map((t) => FilterChip(backgroundColor: Colors.red,label: Text(t,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w400),), onSelected: (b){}) ).toList(),
              ),
              pokemon.nextEvolution == null ?
              Row()
              :Text('Next Evolution',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26),),
              pokemon.nextEvolution == null ?
              Row()
                  : Row(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: pokemon.nextEvolution.map((n) => FilterChip(backgroundColor: Colors.green,label: Text(n.name,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w400),), onSelected: (b){}) ).toList(),
              )


            ],
          ),
        ),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: Hero(
          tag: pokemon.img,
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(pokemon.img)
              )
            ),
          ),
        )
      )
    ],
  );
  Details({this.pokemon});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,

      appBar: AppBar(
      elevation: 0.0,
        backgroundColor: Colors.cyan,
        title: Text(
          pokemon.name,

        ),
      ),
      body: bodyWidget(context),
    );
  }
}
