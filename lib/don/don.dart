

// import 'package:don_sang/donRegister/don_form.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class DonPage extends StatefulWidget {
//   @override
//   State<DonPage> createState() => _DonPageState();
// }

// class _DonPageState extends State<DonPage> {
//   TextEditingController _textController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Container(
//             color: Colors.white,
//             child: Column(
//               children: [
//                 TextField(
//                   controller: _textController,
//                   decoration: InputDecoration(
//                     hintText: 'Groupe Sang.......',
//                     suffixIcon: IconButton(
//                       icon: Icon(Icons.clear),
//                       onPressed: () {
//                         setState(() {
//                           _textController.clear();
//                         });
//                       },
//                     ),
//                   ),
//                   onChanged: (text) {
//                     // Mettez ici le code à exécuter lorsque le texte de recherche change.
//                     // Vous pouvez filtrer une liste, effectuer une recherche, etc.
//                   },
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.02,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(
//                       right: MediaQuery.of(context).size.width * 0.75),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => DonationForm()),
//                           );
//                         },
//                         child: Text("Dons"),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.red,
//                         ),
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//         // Afficher les données récupérées depuis Firebase
//         Expanded(
//           child: DonationList(),
//         ),
//       ],
//     );
//   }

//   @override
//   void dispose() {
//     _textController.dispose();
//     super.dispose();
//   }
// }

// class DonationList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: FirebaseFirestore.instance.collection('donations').snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return CircularProgressIndicator();
//         }

//         var donations = snapshot.data!.docs;

//         return ListView.builder(
//           itemCount: donations.length,
//           itemBuilder: (context, index) {
//             var donationData = donations[index].data() as Map<String, dynamic>;

//             return ListTile(
//               title: Text('Nom complet: ${donationData['fullName']}'),
//               subtitle: Text('Groupe sanguin: ${donationData['bloodGroup']}'),
//               // Affichez d'autres données comme le sexe, la localisation, etc. selon vos besoins.
//             );
//           },
//         );
//       },
//     );
//   }
// }


import 'package:don_sang/donRegister/don_form.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DonPage extends StatefulWidget {
  @override
  State<DonPage> createState() => _DonPageState();
}

class _DonPageState extends State<DonPage> {
  TextEditingController _textController = TextEditingController();

  String _searchText = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: 'Groupe Sang.......',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          _textController.clear();
                          _searchText = "";
                        });
                      },
                    ),
                  ),
                  onChanged: (text) {
                    setState(() {
                      _searchText = text;
                    });
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.75),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DonationForm()),
                          );
                        },
                        child: Text("Dons"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        // Afficher les données récupérées depuis Firebase
        Expanded(
          child: DonationList(searchText: _searchText),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}

// class DonationList extends StatelessWidget {
//   final String searchText;

//   DonationList({required this.searchText});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: FirebaseFirestore.instance.collection('donations').snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return CircularProgressIndicator();
//         }

//         var donations = snapshot.data!.docs;

//         // Filtrer les données en fonction du texte de recherche
//         var filteredDonations = donations.where((donation) {
//           var donationData = donation.data() as Map<String, dynamic>;
//           var bloodGroup = donationData['bloodGroup'].toString().toLowerCase();
//           return bloodGroup.contains(searchText.toLowerCase());
//         }).toList();

//         return ListView.builder(
//           itemCount: filteredDonations.length,
//           itemBuilder: (context, index) {
//             var donationData =
//                 filteredDonations[index].data() as Map<String, dynamic>;

//             return ListTile(
//               title: Text('Nom complet: ${donationData['fullName']}'),
//               subtitle: Text('Groupe sanguin: ${donationData['bloodGroup']}'),
//               // Affichez d'autres données comme le sexe, la localisation, etc. selon vos besoins.
//             );
//           },
//         );
//       },
//     );
//   }
// }
class DonationList extends StatelessWidget {
  final String searchText;

  DonationList({required this.searchText});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('donations').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }

        var donations = snapshot.data!.docs;

        // Filtrer les données en fonction du texte de recherche
        var filteredDonations = donations.where((donation) {
          var donationData = donation.data() as Map<String, dynamic>;
          var bloodGroup = donationData['bloodGroup'].toString().toLowerCase();
          return bloodGroup.contains(searchText.toLowerCase());
        }).toList();

        if (filteredDonations.isEmpty) {
          return Center(
            child: Text("Aucun résultat trouvé."),
          );
        }

        return ListView.builder(
          itemCount: filteredDonations.length,
          itemBuilder: (context, index) {
            var donationData =
                filteredDonations[index].data() as Map<String, dynamic>;

            return Container(
              color: Colors.white,
              child: ListTile(
                title: Text('Nom complet: ${donationData['fullName']}'),
                subtitle: Text('Groupe sanguin: ${donationData['bloodGroup']}'),
                // Affichez d'autres données comme le sexe, la localisation, etc. selon vos besoins.
              ),
            );
          },
        );
      },
    );
  }
}

