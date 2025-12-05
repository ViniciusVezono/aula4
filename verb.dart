import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class FlashCard {
  final String verb;
  final String imageUrl;
  final String pastSentence;
  final String presentSentence;
  final String futureSentence;
  final IconData icon;
  final Color iconColor;

  FlashCard({
    required this.verb,
    required this.imageUrl,
    required this.pastSentence,
    required this.presentSentence,
    required this.futureSentence,
    required this.icon,
    required this.iconColor,
  });
}

Card criarFlashCard(FlashCard card) {
  return Card(
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    elevation: 5,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ListTile(
            leading: Icon(card.icon, size: 36, color: card.iconColor),
            title: Text(
              card.verb.toUpperCase(),
              style: GoogleFonts.rampartOne(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
            ),
            subtitle: Text(
              "Conjugação em inglês",
              style: GoogleFonts.quicksand(
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(card.imageUrl),
          ),
          
          const SizedBox(height: 16),
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.history, size: 20, color: Colors.grey),
                  const SizedBox(width: 8),
                  Text(
                    "Passado:",
                    style: GoogleFonts.rampartOne(fontSize: 18),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: Text(
                  card.pastSentence,
                  style: GoogleFonts.quicksand(fontSize: 16),
                ),
              ),
              
              const SizedBox(height: 12),
              
              Row(
                children: [
                  const Icon(Icons.wb_sunny, size: 20, color: Colors.amber),
                  const SizedBox(width: 8),
                  Text(
                    "Presente:",
                    style: GoogleFonts.rampartOne(fontSize: 18),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: Text(
                  card.presentSentence,
                  style: GoogleFonts.quicksand(fontSize: 16),
                ),
              ),
              
              const SizedBox(height: 12),
              
              Row(
                children: [
                  const Icon(Icons.event, size: 20, color: Colors.green),
                  const SizedBox(width: 8),
                  Text(
                    "Futuro:",
                    style: GoogleFonts.rampartOne(fontSize: 18),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: Text(
                  card.futureSentence,
                  style: GoogleFonts.quicksand(fontSize: 16),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          SizedBox(
            width: 250,
            child: Divider(
              color: Colors.grey[400],
              thickness: 1,
            ),
          ),
          
          const SizedBox(height: 8),
          
          ElevatedButton.icon(
            onPressed: () {
            },
            icon: const Icon(Icons.check_circle),
            label: Text(
              "Memorizado",
              style: GoogleFonts.quicksand(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ],
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<FlashCard> flashcards = [
      FlashCard(
        verb: "to eat",
        imageUrl: "https://cdn.pixabay.com/photo/2014/12/21/23/28/recipe-575434_1280.png",
        pastSentence: "Yesterday, I ate pizza.",
        presentSentence: "I eat breakfast every morning.",
        futureSentence: "Tomorrow, I will eat sushi.",
        icon: Icons.restaurant,
        iconColor: Colors.red,
      ),
      FlashCard(
        verb: "to run",
        imageUrl: "https://cdn.pixabay.com/photo/2017/03/07/13/02/thought-2123970_1280.jpg",
        pastSentence: "Last week, I ran 5 kilometers.",
        presentSentence: "I run in the park every day.",
        futureSentence: "Next month, I will run a marathon.",
        icon: Icons.directions_run,
        iconColor: Colors.blue,
      ),
      FlashCard(
        verb: "to study",
        imageUrl: "https://cdn.pixabay.com/photo/2015/07/31/11/45/library-869061_1280.jpg",
        pastSentence: "I studied English yesterday.",
        presentSentence: "I study Flutter every day.",
        futureSentence: "I will study for the exam tomorrow.",
        icon: Icons.school,
        iconColor: Colors.purple,
      ),
      FlashCard(
        verb: "to travel",
        imageUrl: "https://cdn.pixabay.com/photo/2014/07/31/22/50/world-407127_1280.jpg",
        pastSentence: "I traveled to Japan last year.",
        presentSentence: "I travel for work frequently.",
        futureSentence: "I will travel to Europe next summer.",
        icon: Icons.flight_takeoff,
        iconColor: Colors.orange,
      ),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Flashcards de Verbos em Inglês",
            style: GoogleFonts.rampartOne(
              fontSize: 22,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue[800],
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Aprenda verbos em inglês com flashcards!",
                textAlign: TextAlign.center,
                style: GoogleFonts.quicksand(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[700],
                ),
              ),
            ),
            
            SizedBox(
              height: 10,
              width: 300,
              child: Divider(
                color: Colors.blue[200],
                thickness: 2,
              ),
            ),
            
            ...flashcards.map((card) {
              return Column(
                children: [
                  criarFlashCard(card),
                  
                  if (card != flashcards.last)
                    SizedBox(
                      height: 8,
                      width: 300,
                      child: Divider(
                        color: Colors.grey[300],
                        thickness: 1,
                      ),
                    ),
                ],
              );
            }).toList(),
            
            const SizedBox(height: 20),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Total de flashcards: ${flashcards.length}",
                textAlign: TextAlign.center,
                style: GoogleFonts.quicksand(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}