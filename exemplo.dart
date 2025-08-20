import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  CircleAvatar criaAvatar(String foto) {
    return CircleAvatar(radius: 50, backgroundImage: NetworkImage(foto));
  }

  Container criaLinha(
    String coluna1,
    String coluna2,
    IconData? icone,
    tamanho,
    cor,
  ) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(coluna1, style: GoogleFonts.rampartOne(fontSize: 32)),
          Text(coluna2, style: GoogleFonts.quicksand(fontSize: 32)),
          Icon(icone, size: tamanho, color: cor),
          Padding(padding: EdgeInsets.all(10.0)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(16.0)),
              criaAvatar(
                'https://i.ytimg.com/vi/q4JQz2z2-mc/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLC1EpwYwHNBjheVU2nRmQ4VlePRTA',
              ),
              SizedBox(height: 25.0, child: Divider(color: Colors.orange)),
              criaLinha('Dragão:', 'Banguela', null, null, null),
              SizedBox(
                height: 60.0,
                width: 170.0,
                child: Divider(color: Colors.orange),
              ),
              criaLinha('Ataque:', '75', Icons.offline_bolt, 40, Colors.blue),
              SizedBox(
                height: 60.0,
                width: 170.0,
                child: Divider(color: Colors.orange),
              ),
              criaLinha(
                'Velocidade:',
                '20',
                Icons.speed,
                50,
                Colors.deepOrangeAccent,
              ),
              SizedBox(
                height: 60.0,
                width: 170.0,
                child: Divider(color: Colors.orange),
              ),
              criaLinha('Fogo:', '50', Icons.fireplace, 50, Colors.redAccent),
            ],
          ),
        ),
      ),
    );
  }
}
