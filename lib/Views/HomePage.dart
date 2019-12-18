import 'package:flutter/material.dart';
import 'package:megasena/Models/MegaSena.dart';
import 'package:megasena/Views/HomeController.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomeController hm;
  @override
  Widget build(BuildContext context) {
    hm = new HomeController();

    return SingleChildScrollView(
      child: Container(

        padding: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            Text("Gerador de números!",
            style: TextStyle(fontSize: 25),),
            Divider(),
            StreamBuilder<MegaSena>(
              initialData: MegaSena.Empty(),
              stream: hm.outMegaSena,
              builder: (context, snapshot) {
                MegaSena ms = snapshot.data;
                return Container(
                  padding: EdgeInsets.only(top: 15, right: 40, left: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      _numeroMegaSena(context, ms.numeroUm),
                      _numeroMegaSena(context, ms.numeroDois),
                      _numeroMegaSena(context, ms.numeroTres),
                      _numeroMegaSena(context, ms.numeroQuatro),
                      _numeroMegaSena(context, ms.numeroCinco),
                      _numeroMegaSena(context, ms.numeroSeis),

                    ],
                  ),
                );
              }
            ),
            Divider(),

            SizedBox(
              height: 40,
              width: 40,
            ),
            RaisedButton(
              child: Text("Gerar números!"),
                onPressed: (){
                hm.gerarNumerosAleatorios();
              print("todo função alterar números");
            }),


          ],
        ),
      ),
    );
  }

  Widget _numeroMegaSena(BuildContext context, int numero){
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(colors: [Colors.white, Colors.green
        ]),

      ),
      child: Center(child: Text(numero.toString())),

    );

  }
}
