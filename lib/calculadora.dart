import 'package:flutter/material.dart';
import 'main.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _Calculadora();
}

class _Calculadora extends State<Calculadora> {
  final TextEditingController num1 = TextEditingController();
  final TextEditingController num2 = TextEditingController();

  String resultado = '';

    void limparCampo() {
      double? numero1 = double.tryParse(num1.text);
      double? numero2 = double.tryParse(num2.text);
      num1.clear();
      num2.clear();

      if(numero1 == null || numero2 == null) {
        setState(() {
          resultado = "Nenhum campo preeenchido";
        });
      }
    }

    void calcular(String operacao) {
      double? numero1 = double.tryParse(num1.text);
      double? numero2 = double.tryParse(num2.text);

      if (numero1 == null || numero2 == null) {
        setState(() {
          resultado = "Digite números válidos";
        });
        return;
      }

      double res;

      if(operacao == 'Soma') {
        res = numero1 + numero2;
        setState(() {
          resultado = "O resultado da soma é $res";
        });
      }

      else if(operacao == "Subtração") {
        res = numero1 - numero2;
        setState(() {
          resultado = "O resultado da subtração é $res";
        });
      }

      else if(operacao == "Multiplicar") {
        res = numero1 * numero2;
        setState(() {
          resultado = "O resultado da multiplicação é $res";
        });
      }

      else if(operacao == "Divisão") {

        if(numero2 == 0) {
          setState(() {
            resultado = "O número não pode ser divisivel por zero";
          });
        }
        else {
          res = numero1 / numero2;
          setState(() {
            resultado = "O resultado da divisão é $res";
          });
        }

      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora"),

        backgroundColor: Colors.blueAccent,

        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                const Icon(
                  Icons.calculate_outlined,
                  size: 110,
                  color: Colors.blueAccent,
                ),
                Text(
                  "Insira dois números e escolha uma operação matemática",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                
                //Primeiro input
                TextField(
                  controller: num1,
                  decoration: InputDecoration(
                    labelText: 'Insira um número',
                    prefixIcon: Icon(
                      Icons.looks_one_outlined,
                      color: Colors.grey,),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                    border: OutlineInputBorder()
                  ),
                ),
                
                //Espaçamento entre o primeiro e o segundo input
                const SizedBox(
                  height: 16,
                ),
                
                //Segundo input
                TextField(
                  controller: num2,
                  decoration: InputDecoration(
                    labelText: 'Insira outro número',
                    prefixIcon: Icon(
                      Icons.looks_two_outlined,
                      color: Colors.grey,),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                    border: OutlineInputBorder()
                  ),
                ),
                
                //Espaçamento entre o segundo input e o botao (somar)
                const SizedBox(
                  height: 16,
                ),
                
                //Botão Somar
                ElevatedButton(
                    onPressed: () {
                      calcular('Soma');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      fixedSize: const Size(360, 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                      )
                    ) ,
                    child: Text("Somar"),
                ),

                const SizedBox(
                  height: 16,
                ),

                //Botão Subtração
                ElevatedButton(
                    onPressed: () {
                      calcular('Subtração');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      fixedSize: const Size(360, 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                      )
                    ),
                    child: Text("Subtração"),
                ),

                const SizedBox(
                  height: 16,
                ),

                //Botão Multiplicar
                ElevatedButton(
                    onPressed: () {
                      calcular('Multiplicar');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      fixedSize: const Size(360, 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                      )
                    ),
                    child: Text("Multiplicar"),
                ),

                const SizedBox(
                  height: 16,
                ),

                //Botão Divisão
                ElevatedButton(
                    onPressed: () {
                      calcular('Divisão');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      fixedSize: const Size(360, 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                      )
                    ),
                    child: Text("Divisão"),
                ),

                const SizedBox(
                  height: 16,
                ),
                Text(
                  resultado,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: 16,
                ),

                //Botão limpar os campos
                ElevatedButton(
                    onPressed: () {
                      limparCampo();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blueAccent,
                    ),
                    child: Text("Limpar"),
                )
              ],

      ),
      ),
    );
  }
}

