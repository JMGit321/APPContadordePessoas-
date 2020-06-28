import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Contador de pessoas", //variavel de valor interno
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people=0;
  String infotext="Pode entrar!";
  void _addPeople(int delta){
    setState(() {//atualiza a tela
      if(_people<10)
        _people+=delta;
    });
  }
  void _remPeople(int delta){
    setState(() {//atualiza a tela
      if(_people>0 )
        _people+=delta;
    });
  }
  void text(){
    setState(() {
      if(_people==10){
        infotext = "Não pode entrar mais ninguem";
      }else if(_people==0){
        infotext = "Não pode sair mais ninguem";
      }else{
        infotext="Pode entrar!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(//pra por imagem
      children: <Widget>[
        Image.asset('images/original.jpg',
          fit: BoxFit.cover,//Preenche a tela com imagem completa
          height: 1000,//Sem isso nao funciona
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_people",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,//eixo principal
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child:  FlatButton(
                    highlightColor: Colors.white,//cor quando clica
                    child: Text(
                      "+1",
                      style: TextStyle(fontSize: 40,color: Colors.white),
                    ),
                    onPressed: (){
                      _addPeople(1);
                      text();
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: FlatButton(
                    highlightColor: Colors.white,
                    child: Text(
                      "-1",
                      style: TextStyle(fontSize: 40,color: Colors.white),
                    ),
                    onPressed: (){
                      _remPeople(-1);
                      text();
                    },
                  ),
                ),

              ],
            ),

            Text(
              "$infotext",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 30,fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ],

    );
  }
}
