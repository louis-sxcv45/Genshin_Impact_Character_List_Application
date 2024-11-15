import 'package:flutter/material.dart';
import 'package:genshin_character/model/data_character.dart';
import 'package:genshin_character/ui/detail_character.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({required this.characterList, super.key});
  
  final List<DataCharacter> characterList;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<DataCharacter> _characterSearch = [];

  @override
  void initState() {
    super.initState();
    _characterSearch = widget.characterList;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    bool isLandscape = width > height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        backgroundColor: Colors.blueAccent,
        automaticallyImplyLeading: false
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                onChanged: (value) {
                  setState(() {
                    _characterSearch = widget.characterList
                      .where((character) => character.name
                          .toLowerCase()
                          .contains(value.toLowerCase())
                      )
                      .toList();
                  });
                },
              ),
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
              itemCount: _characterSearch.length,
              itemBuilder: (context, index) {
                final DataCharacter character = _characterSearch[index];
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
                            width: isLandscape ? width * 0.15 : width * 0.28,
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
                            width: isLandscape ? width * 0.1 : null,
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
                    // Pass the selected character to the DetailCharacter screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailCharacter(character: character);
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
    );
  }
}
