import 'package:flutter/material.dart';
import 'package:youtube/Api.dart';
import 'package:youtube/CustomSearchDelegate.dart';
import 'package:youtube/telas/Biblioteca.dart';
import 'package:youtube/telas/EmAlta.dart';
import 'package:youtube/telas/Inicio.dart';
import 'package:youtube/telas/Inscricao.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {



  int _indiceAtual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {



    List<Widget> telas = [
      Inicio(_resultado),
      EmAlta(),
      Inscricao(),
      Biblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
          //opacity: 1
        ),
        backgroundColor: Colors.white,
        title: Image.asset("images/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: <Widget>[

          IconButton(
              icon: Icon(Icons.search),
              onPressed: () async{
                String res = await showSearch(context: context, delegate: CustomSearchDelegate());
                setState(() {
                  _resultado = res;
                });
              },
          ),

//          IconButton(
//            icon: Icon(Icons.videocam),
//            onPressed: (){
//              print("acao: videocam");
//            },
//          ),
//
//
//             IconButton(
//             icon: Icon(Icons.account_circle),
//            onPressed: (){
//            print("acao: conta");
//            },
//          ),


        ],
      ) ,
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
          //o type é mudadado pra shifting quando tem mais de 4 bottom navigation bar item
        // o type shifting muda de cor da navigation bar de acordo com o background color do item selecionado da navbar
          currentIndex: _indiceAtual,
          onTap: (indice){
            setState(() {
              _indiceAtual = indice;
              print(indice);
            });
          },
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.red,
          items: [
            BottomNavigationBarItem(
              title: Text("Início"),
              icon: Icon(Icons.home)
            ),
            BottomNavigationBarItem(
                title: Text("Em alta"),
                icon: Icon(Icons.whatshot)
            ),
            BottomNavigationBarItem(
                title: Text("Inscrições"),
                icon: Icon(Icons.subscriptions)
            ),
            BottomNavigationBarItem(
                title: Text("Biblioteca"),
                icon: Icon(Icons.folder)
            ),
          ]
      ),
    );
  }
}
