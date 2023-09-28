import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class DonationForm extends StatefulWidget {
  @override
  _DonationFormState createState() => _DonationFormState();
}

class _DonationFormState extends State<DonationForm> {
  final _formKey = GlobalKey<FormState>();
  String _fullName = "";
  String _gender = "Homme"; // Vous pouvez initialiser avec une valeur par défaut
  String _location = "";
  String _phoneNumber = "";
  String _bloodGroup = "A+"; // Vous pouvez initialiser avec une valeur par défaut
  DateTime _donationDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
         
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Don de Sang'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nom complet'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Veuillez entrer votre nom complet';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _fullName = value;
                    });
                  },
                ),
                DropdownButtonFormField(
                  decoration: InputDecoration(labelText: 'Sexe'),
                  value: _gender,
                  items: ['Homme', 'Femme'].map((gender) {
                    return DropdownMenuItem(
                      value: gender,
                      child: Text(gender),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _gender = value!;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Localisation'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Veuillez entrer votre localisation';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _location = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Numéro de téléphone'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Veuillez entrer votre numéro de téléphone';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _phoneNumber = value;
                    });
                  },
                ),
                DropdownButtonFormField(
                  decoration: InputDecoration(labelText: 'Groupe sanguin'),
                  value: _bloodGroup,
                  items: ['A+', 'B+', 'AB+', 'O+', 'A-', 'B-', 'AB-', 'O-']
                      .map((group) {
                    return DropdownMenuItem(
                      value: group,
                      child: Text(group),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _bloodGroup = value!;
                    });
                  },
                ),
                ElevatedButton(
                   
    
                  onPressed: () async {
      if (_formKey.currentState!.validate()) {
        try {
          // Initialize Firebase (make sure this is done at the app startup)
          await Firebase.initializeApp();
    
          // Reference to the "donations" collection in Firebase
          CollectionReference donations = FirebaseFirestore.instance.collection('donations');
    
          // Add a new document with a unique ID
          await donations.add({
            'fullName': _fullName,
            'gender': _gender,
            'location': _location,
            'phoneNumber': _phoneNumber,
            'bloodGroup': _bloodGroup,
            'donationDate': _donationDate,
          });
    
          // Data successfully sent to Firebase
          print('Donation data sent to Firebase');
        } catch (e) {
          // Error occurred while sending data to Firebase
          print('Error sending donation data to Firebase: $e');
        }
      }
      },
                  child: Text('Soumettre'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
