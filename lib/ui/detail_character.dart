import 'package:flutter/material.dart';
import 'package:genshin_character/model/data_character.dart';

class DetailCharacter extends StatefulWidget {
  const DetailCharacter({super.key, required this.character});
  final DataCharacter character;

  @override
  State<DetailCharacter> createState() => _DetailCharacterState();
}

class _DetailCharacterState extends State<DetailCharacter> {

  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var isLandscape = width > height; // Detect if the screen is landscape

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Background Image
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  widget.character.background_card,
                  height: isLandscape ? height * 0.35 : 300,
                  fit: BoxFit.cover,
                ),
              ),
              
              Positioned(
                top: 10,
                left: 1,
                child: SafeArea(
                  child: IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    }, 
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                      )
                  ),
                ) 
              ),
          
              Positioned(
                top: 90,
                left: 20,
                child: Text(
                  widget.character.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white
                  ),
                )
              ),
          
              Positioned(
                top: 140,
                left: 20,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                      top: 4.0,
                      bottom: 4.0,
                    ),
                    child: Text(
                      widget.character.nation,
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black26
                  ),
                ),
              ),
          
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(isLandscape ? 30 : 20),
                  topRight: Radius.circular(isLandscape ? 30 : 20),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
          
                    SizedBox(
                      height: 35,
                    ),
                    // Character Description
                    Text(
                      widget.character.description,
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 16),
                    ),
            
                    SizedBox(height: 30),
            
                    // Row for Character Status
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Element'
                          ),
                        ),
            
                        Expanded(
                          child: Text(
                            widget.character.element,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    
                    SizedBox(height: 10),
            
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'Weapon'
                          ),
                        ),
            
                        Expanded(
                          child: Text(
                            widget.character.weapon,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
            
                    SizedBox(height: 10),
            
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Gender'
                          ),
                        ),
            
                        Expanded(
                          child: Text(
                            widget.character.gender,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
            
                    SizedBox(
                      height: 10,
                    ),
            
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'Rarity'
                          ),
                        ),
                        Expanded(
                          child: Text(
                            widget.character.rarity.toString(),
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          
              Positioned(
                top: (height * 0.18),
                left: (width / 2) - 100,
                child: Image.network(
                  widget.character.image_character,
                  height: 200,
                  fit: BoxFit.fitHeight,
                )
              )
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: isFavorite ? Colors.red : null,
        ),
      ),
    );
  }
}
