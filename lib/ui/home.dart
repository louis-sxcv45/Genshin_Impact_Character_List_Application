import 'package:flutter/material.dart';
import 'package:genshin_character/model/data_character.dart';
import 'package:genshin_character/ui/detail_character.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSorted = true;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    bool isLandscape = width > height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.025, 
            vertical: height * 0.015,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Character List',
                style: TextStyle(
                  fontSize: width * 0.075,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              SizedBox(height: height * 0.03),
              Container(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed:() {
                    setState(() {
                      if (_isSorted) {
                        characterList.sort((a, b) => a.name.compareTo(b.name),);
                      } else {
                        characterList.sort((a, b) => b.name.compareTo(a.name),);
                      }
                      _isSorted = !_isSorted;
                    });
                  } , 
                  icon: Icon(
                    Icons.sort_by_alpha,
                  )  
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isLandscape ? 3 : 2,
                    crossAxisSpacing: width * 0.02,
                    mainAxisSpacing: height * 0.02,
                    childAspectRatio: isLandscape ? 1.7 : 1.4,
                  ),
                  itemCount: characterList.length,
                  itemBuilder: (context, index) {
                    final DataCharacter character = characterList[index];
                    return GestureDetector(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Background image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(width * 0.02),
                              child: Image.asset(
                                character.background_card,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),

                            // Character image with FractionallySizedBox
                            Positioned(
                              bottom: height * 0.015,
                              right: -width * 0.020,
                              child: Container(
                                width: isLandscape ? width * 0.15 : width * 0.28, // Sesuaikan lebar gambar
                                child: Image.network(
                                  character.image_character,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          
                            // Character name
                            Positioned(
                              top: height * 0.03,
                              left: width * 0.02,
                              right: width * 0.02,
                              child: Text(
                                character.name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: width * 0.03,
                                  color: Colors.white,
                                ),
                              ),
                            ),

                            // Nation text
                            Positioned(
                              left: width * 0.02,
                              child: Container(
                                width: isLandscape? width * 0.1 : null,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(width * 0.05),
                                  color: Colors.black54,
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.02,
                                  vertical: height * 0.005,
                                ),
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    character.nation,
                                    style: TextStyle(
                                      fontSize: width * 0.02,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailCharacter(character: character,);
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
