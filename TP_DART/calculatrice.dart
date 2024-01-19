import 'package:flutter/material.dart';

void main() {
  runApp(CalculatriceApp());
}

class CalculatriceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculatrice',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatricePage(),
    );
  }
}

class CalculatricePage extends StatefulWidget {
  @override
  _CalculatricePageState createState() => _CalculatricePageState();
}

class _CalculatricePageState extends State<CalculatricePage> {
  TextEditingController premierNombreController = TextEditingController();
  TextEditingController deuxiemeNombreController = TextEditingController();
  TextEditingController resultatController = TextEditingController();
  String operation = '+';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculatrice'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: premierNombreController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Premier Nombre'),
    
            ),
            DropdownButton<String>(
              value: operation,
              onChanged: (String? value) {
                setState(() {
                  operation = value!;
                });
              },
              items: ['+', '-', '*', '/'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            TextField(
              controller: deuxiemeNombreController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Deuxième Nombre'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculerResultat,
              child: Text('Calculer'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: resultatController,
              readOnly: true,
              decoration: InputDecoration(labelText: 'Résultat'),
            ),
          ],
        ),
      ),
    );
  }

  void calculerResultat() {
    double premierNombre = double.tryParse(premierNombreController.text) ?? 0.0;
    double deuxiemeNombre = double.tryParse(deuxiemeNombreController.text) ?? 0.0;

    double resultat;
    switch (operation) {
      case '+':
        resultat = premierNombre + deuxiemeNombre;
        break;
      case '-':
        resultat = premierNombre - deuxiemeNombre;
        break;
      case '*':
        resultat = premierNombre * deuxiemeNombre;
        break;
      case '/':
        resultat = premierNombre / deuxiemeNombre;
        break;
      default:
        resultat = 0.0;
    }

    setState(() {
      resultatController.text = resultat.toString();
    });
  }
}
