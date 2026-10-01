import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int puntosA = 0;
  int puntosB = 0;
  String resultado(){
    if (puntosA > puntosB) {
      return 'Equipo xelaju gana';
    } else if (puntosB > puntosA) {
      return 'Equipo 2 gana';
    } else {
      return 'Empate';
    }
  }
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marcador de Puntos',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Marcador de Puntos'),
        ),
        body: Column(
          
          children: [
            Text(
              resultado(),
              style: TextStyle(fontSize: 20),
            ),
            // equipo 1
            Text(
            'Xelajú',
            style: TextStyle(
              color: puntosA > puntosB
                ? Colors.green
                : puntosA < puntosB
                    ? Colors.red
                    : const Color.fromARGB(255, 133, 129, 129),
  ),
),
              Text(
                puntosA.toString(),
                style: TextStyle(fontSize: 50),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                    setState(() {
                    puntosA++;  

              });
              },
                child: Text('+1'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (puntosA > 0) {
                      puntosA--;
                    }
                  });
                },
                child: Text('-1'),
                
              ),
              
            ],
          ),

          // equipo 2
          Text('equipo 2'
          ,
              style: TextStyle(
              color: puntosB > puntosA ? Colors.green : const Color.fromARGB(255, 133, 129, 129),
          ),
          ),

          Text(
            puntosB.toString(),
            style: TextStyle(fontSize: 50),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    puntosB++;
                  });
                },
                child: Text('+1'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (puntosB > 0) {
                      puntosB--;
                    }
                  });
                },
                child: Text('-1'),
              ),
            ],
          ),

          SizedBox(height: 20),

      ElevatedButton(
        onPressed: () {
        setState(() {
          puntosA = 0;
          puntosB = 0;
    });
  },
  child: Text('Reiniciar'),
),
        ],
        ),
      ),
    );
  }
}