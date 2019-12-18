
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:megasena/Models/MegaSena.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:math';

class HomeController extends BlocBase{
  BehaviorSubject<MegaSena> megaSenaBloc = new BehaviorSubject();
  Sink<MegaSena> get inMegaSena => megaSenaBloc.sink;
  Stream<MegaSena> get outMegaSena => megaSenaBloc.stream;

  MegaSena ms;
  gerarNumerosAleatorios(){
    ms = new MegaSena.Empty();

    ms.numeroUm = checarNumeros(1, 15);
    ms.numeroDois = checarNumeros(16, 25);
    ms.numeroTres = checarNumeros(26, 35);
    ms.numeroQuatro = checarNumeros(36, 45);
    ms.numeroCinco = checarNumeros(46, 55);
    ms.numeroSeis = checarNumeros(56, 60);

    inMegaSena.add(ms);
  }

  checarNumeros(int min, int max){
    int numGerado = 0;

    while(numGerado < min){
      numGerado = Random().nextInt(max);
    }
    return numGerado;


  }


  @override
  void dispose() {
    // TODO: implement dispose
  }
}