import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final List<String> samplePhrases = [
  'Rwahoze ari akabari: Imaramatsiko ku rusengero rw\'akataraboneka rwa Remera ruzatwara arenga Miliyari',
  'Benshi bankuyemo gushidikanya: Pr Hesron Byilingiro yavuze icyatuma ubuzima bwawe buba burebure',
  'Minisitiri muri Perezidansi Judith Uwizeye, Umuyobozi Mukuru wa RGB, Dr Usta Kayitesi n’Umuyobozi w’Umujyi wa Kigali',
  'Uwemera Imana akwiye kubetinga?',
  'Bibiliya ntabwo icira urubanza ku buryo bw’umwihariko umukino w’amafaranga, gukina umukino wo gutega, cyangwa gukina umukino wa tombola.',
  'Ibyanditswe Byera nabyo bidushishikariza kwirinda ibishuko byo gushaka ‘gukira vuba’ (Imigani 13:11; 23:5; Umubwiriza 5:10).',
  'Icyo gihe, gutanga amafaranga ku bindi bintu, ntibivuze ko ari umukino w’amafaranga. Amafaranga ntagomba gusesagurwa.',
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final fifthScreenHeight = screenHeight * 0.23;
    final ninthScreenHeight = screenHeight * 0.09;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF7F7F7),
        appBar: AppBar(
          title: const Text(
            'Itabaza',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Handle menu icon press
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Handle search icon press
              },
            ),
          ],
          centerTitle: true,
          backgroundColor: Colors.black,
          // leading: Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Image.asset(
          //     'assets/images/itabaza1.jpg',
          //     height: 36,
          //     width: 100,
          //   ),
          // ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 2.0,
                  left: 2.0,
                  right: 2.0,
                ),
                child: SizedBox(
                  height: fifthScreenHeight,
                  child: Image.asset(
                    'assets/images/itabaza3.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: ninthScreenHeight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Flexible(
                        flex: 1,
                        child: Text(
                          "Itabaza Health",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Text(
                          "Itabaza TV",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  final randomPhrase =
                      samplePhrases[Random().nextInt(samplePhrases.length)];
                  final date = DateTime.now().subtract(Duration(days: index));
                  final formattedDate =
                      '${date.year.toString().padLeft(4, '0')}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}';

                  return Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            randomPhrase,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Published: ${formattedDate.toString()}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
