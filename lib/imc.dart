import 'dart:math';

import 'package:flutter/material.dart';

class CalcularIMC extends StatefulWidget {
  const CalcularIMC({super.key});

  @override
  State<CalcularIMC> createState() => _CalcularIMC();
}

class _CalcularIMC extends State<CalcularIMC> {
  final TextEditingController altura = TextEditingController();
  final TextEditingController peso = TextEditingController();

  String resultado = "";
  double res = 0;


  //Função para limpar os campos
  void limparCampos() {
    double? alt = double.tryParse(altura.text);
    double? pes = double.tryParse(peso.text);
    altura.clear();
    peso.clear();

    if( alt == null || pes == null) {
      setState(() {
        resultado = "Nenhum campo preenchido";
      });
    }
  }

  //Função para o cálculo de altura e peso
  void calcular() {
    double? alt = double.tryParse(altura.text);
    double? pes = double.tryParse(peso.text);

    if(alt == null || pes == null) {
      setState(() {
        resultado = "Dados inválidos. Preencha os campos";
      });
      return;
    }

    //Variavél para o calculo de IMC
    res = pes / (alt * alt);

    if(res < 18.5) {
      setState(() {
        resultado = "Abaixo do peso";
      });
    }
    else if(res > 18.5 && res < 24.9) {
      setState(() {
        resultado = "Peso Nomral";
      });
    }
    else if(res >25.0 && res < 29.9) {
      setState(() {
        resultado = "Sobrepeso";
      });
    }
    else if(res >=30.0) {
      setState(() {
        resultado = "Obesidade";
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cálculo de IMC"),

        backgroundColor: Colors.blueAccent,

        foregroundColor: Colors.white,
      ),

      body: Padding(
          padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  const Icon(
                    Icons.balance_outlined,
                    size: 90,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Informe seu peso e sua altura para calcular o IMC',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //Input altura
                  TextField(
                    controller: altura,
                    decoration: InputDecoration(
                      labelText: 'Altura em metros',
                      prefixIcon: Icon(
                        Icons.height,
                        color: Colors.grey,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.blue, width: 2)
                      )
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  TextField(
                    controller: peso,
                    decoration: InputDecoration(
                      labelText: 'Peso em Kg',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.blue, width: 2)
                      )
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  //Botão calcular que chama a função para o calculo do IMC
                  ElevatedButton(
                      onPressed: () {
                        calcular();
                      },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      fixedSize: const Size(240, 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(14)
                      )
                    ),
                      child: Text("Calcular IMC"),
                  ),

                  const SizedBox(
                    height: 16,
                  ),

                  //Botão limpar os campos recebe a função para limpar os campos
                  ElevatedButton(
                      onPressed: () {
                        limparCampos();
                      },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blueAccent
                    ),
                      child: Text("Limpar"),
                  ),

                  const SizedBox(
                    height: 24,
                  ),

                  Text(
                    textAlign: .center,
                    "$resultado \n\nSEU IMC É: ${res.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
      ),
    );
  }
}