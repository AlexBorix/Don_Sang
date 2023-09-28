// import 'package:don_sang/don/don.dart';
// import 'package:don_sang/don/need.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized(); 
//   await Firebase.initializeApp();
//   runApp( HomeScreen());
// }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

  
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       theme: ThemeData(        
// //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
// //         useMaterial3: true,
// //       ),
// //       home: const MyHomePage(title: 'Flutter Demo Home Page'),
// //     );
// //   }
// // }

// // class MyHomePage extends StatefulWidget {
// //   const MyHomePage({super.key, required this.title});
// //   final String title;

// //   @override
// //   State<MyHomePage> createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<MyHomePage> {
// //   int _counter = 0;

// //   void _incrementCounter() {
// //     setState(() {
 
// //       _counter++;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
    
    
    
    
    
    
// //     return Scaffold(
// //       appBar: AppBar(
        
        
        
// //         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        
// //         title: Text(widget.title),
// //       ),
// //       body: Center(
        
        
// //         child: Column(
          
          
          
          
          
          
          
          
          
          
          
          
          
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             const Text(
// //               'You have pushed the button this many times:',
// //             ),
// //             Text(
// //               '$_counter',
// //               style: Theme.of(context).textTheme.headlineMedium,
// //             ),
// //           ],
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: _incrementCounter,
// //         tooltip: 'Increment',
// //         child: const Icon(Icons.add),
// //       ), 
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(DonDeSangApp());
// // }

// // class DonDeSangApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Don de Sang App',
// //       theme: ThemeData(
// //         primaryColor: Colors.red, // Couleur principale de votre thème
// //       ),
// //       home: DonationForm(),
// //     );
// //   }
// // }

// // class DonationForm extends StatefulWidget {
// //   @override
// //   _DonationFormState createState() => _DonationFormState();
// // }

// // class _DonationFormState extends State<DonationForm> {
// //   final _formKey = GlobalKey<FormState>();
// //   String _fullName = "";
// //   String _gender = "Homme"; // Vous pouvez initialiser avec une valeur par défaut
// //   String _location = "";
// //   String _phoneNumber = "";
// //   String _bloodGroup = "A+"; // Vous pouvez initialiser avec une valeur par défaut
// //   DateTime _donationDate = DateTime.now();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Don de Sang'),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Form(
// //           key: _formKey,
// //           child: ListView(
// //             children: [
// //               TextFormField(
// //                 decoration: InputDecoration(labelText: 'Nom complet'),
// //                 validator: (value) {
// //                   if (value!.isEmpty) {
// //                     return 'Veuillez entrer votre nom complet';
// //                   }
// //                   return null;
// //                 },
// //                 onChanged: (value) {
// //                   setState(() {
// //                     _fullName = value;
// //                   });
// //                 },
// //               ),
// //               DropdownButtonFormField(
// //                 decoration: InputDecoration(labelText: 'Sexe'),
// //                 value: _gender,
// //                 items: ['Homme', 'Femme'].map((gender) {
// //                   return DropdownMenuItem(
// //                     value: gender,
// //                     child: Text(gender),
// //                   );
// //                 }).toList(),
// //                 onChanged: (value) {
// //                   setState(() {
// //                     _gender = value!;
// //                   });
// //                 },
// //               ),
// //               TextFormField(
// //                 decoration: InputDecoration(labelText: 'Localisation'),
// //                 validator: (value) {
// //                   if (value!.isEmpty) {
// //                     return 'Veuillez entrer votre localisation';
// //                   }
// //                   return null;
// //                 },
// //                 onChanged: (value) {
// //                   setState(() {
// //                     _location = value;
// //                   });
// //                 },
// //               ),
// //               TextFormField(
// //                 decoration: InputDecoration(labelText: 'Numéro de téléphone'),
// //                 validator: (value) {
// //                   if (value!.isEmpty) {
// //                     return 'Veuillez entrer votre numéro de téléphone';
// //                   }
// //                   return null;
// //                 },
// //                 onChanged: (value) {
// //                   setState(() {
// //                     _phoneNumber = value;
// //                   });
// //                 },
// //               ),
// //               DropdownButtonFormField(
// //                 decoration: InputDecoration(labelText: 'Groupe sanguin'),
// //                 value: _bloodGroup,
// //                 items: ['A+', 'B+', 'AB+', 'O+', 'A-', 'B-', 'AB-', 'O-']
// //                     .map((group) {
// //                   return DropdownMenuItem(
// //                     value: group,
// //                     child: Text(group),
// //                   );
// //                 }).toList(),
// //                 onChanged: (value) {
// //                   setState(() {
// //                     _bloodGroup = value!;
// //                   });
// //                 },
// //               ),
// //               ElevatedButton(
// //                 onPressed: () {
// //                   if (_formKey.currentState!.validate()) {
// //                     // Les données du formulaire sont valides, vous pouvez les utiliser ici
// //                     // Par exemple, vous pouvez les envoyer à une API ou les enregistrer localement
// //                     // Pour l'instant, nous affichons simplement les données dans la console.
// //                     print('Nom complet: $_fullName');
// //                     print('Sexe: $_gender');
// //                     print('Localisation: $_location');
// //                     print('Numéro de téléphone: $_phoneNumber');
// //                     print('Groupe sanguin: $_bloodGroup');
// //                     print('Date de don: $_donationDate');
// //                   }
// //                 },
// //                 child: Text('Soumettre'),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

import 'package:don_sang/don/need.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
 
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp();
  runApp(DonDeSangApp());
}

class DonDeSangApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Don de Sang App',
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      
      home: NeedPage(),
    );
  }
}

