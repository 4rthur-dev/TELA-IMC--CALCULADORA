import 'package:flutter/material.dart';
import 'calculadora.dart';
import 'imc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto Matemático',

      debugShowCheckedModeBanner: false,

      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.blueAccent),
      ),
      home: const MyHomePage(title: 'App Math'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.blueAccent,

        title: Text("Calculos Matemáticos"),

        foregroundColor: Colors.white,
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Icon(
                Icons.calculate,
                size: 100,
                color: Colors.blueAccent,
            ),
            const Text(
              'Escolha uma das opções abaixo:',
               style: TextStyle(
                 fontSize: 19,
                 fontWeight: FontWeight.bold,
               ),
            ),
            
            //Espaçamento entre o texto e o botao(calculadora)
            const SizedBox(
              height: 26,
            ),
            
            //Botão Calculadora
             ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Calculadora(),
                      ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  //Largura e altura
                  fixedSize: const Size(350, 50),
                  //Arredondar botão
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)
                  )
                ),
                child: Text("Calculadora")
            ),

            //Espaçamento entre os dois botões
            const SizedBox(height: 28),

            //Botao calculo de IMC
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CalcularIMC()
                      ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  //Largura e altura
                  fixedSize: const Size(350, 50),
                  //Arredondar botão
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)
                  )
                ),
                child: Text("Cálculo IMC"))
          ],
        ),
      ),

    );
  }
}
