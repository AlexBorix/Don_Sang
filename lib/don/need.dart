import 'package:don_sang/don/need_real.dart';
import 'package:flutter/material.dart';
import 'don.dart';

class NeedPage extends StatefulWidget {
  @override
  State<NeedPage> createState() => _NeedPageState();
}

class _NeedPageState extends State<NeedPage> {
  TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Don de Sang App'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Formulaire'),
              Tab(text: 'Hello World'),
            ],
          ),
        ),
        drawer: CustomDrawer(),
        body: TabBarView(
          children: [
            DonPage(),
            NeedRealPage(),
          ],
        ),
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            
            accountName: Text('Nom Utilisateur'),
            accountEmail: Text('utilisateur@email.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person),
            ),
          ),
          ListTile(
            title: Text('Se déconnecter'),
            onTap: () {
              // Mettez ici le code pour gérer la déconnexion
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Supprimer le compte'),
            onTap: () {
              // Mettez ici le code pour gérer la suppression du compte
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Gérer'),
            onTap: () {
              // Mettez ici le code pour gérer le compte utilisateur
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
