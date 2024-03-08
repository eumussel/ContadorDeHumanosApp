import 'package:flutter/material.dart';

void main() {
  runApp(ContadorDeHumanosApp());
}

class ContadorDeHumanosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador de Humanos',
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 48,
                ),
              ),
            ),
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Contador de Humanos',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Text(
                    'Desenvolvido por Vinícius Mussel',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Treinamento de DART/Flutter com o Prof. Elias Santos.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: ContadorWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

class ContadorWidget extends StatefulWidget {
  @override
  _ContadorWidgetState createState() => _ContadorWidgetState();
}

class _ContadorWidgetState extends State<ContadorWidget> {
  int quantidade = 0;

  String getFrase() {
    if (quantidade < 0) {
      return 'Você já viu uma quantidade negativa de humanos?';
    } else if (quantidade == 0) {
      return 'Que solidão! Não detectei nenhum humano!';
    } else if (quantidade == 1) {
      return 'Xô, solidão! Detectei $quantidade humano!';
    } else {
      return 'Xô, solidão! Detectei $quantidade humanos!';
    }
  }

  void incrementar() {
    setState(() {
      quantidade++;
    });
  }

  void decrementar() {
    setState(() {
      quantidade--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 16),
            IconButton(
              icon: Icon(Icons.remove, color: Colors.white),
              onPressed: decrementar,
            ),
            SizedBox(width: 8),
            Text(
              quantidade.toString(),
              style: TextStyle(fontSize: 48, color: Colors.white),
            ),
            SizedBox(width: 8),
            IconButton(
              icon: Icon(Icons.add, color: Colors.white),
              onPressed: incrementar,
            ),
            SizedBox(width: 16),
          ],
        ),
        SizedBox(height: 16),
        Text(
          getFrase(),
          style: TextStyle(fontSize: 16, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
