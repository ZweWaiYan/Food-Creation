import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_creation/modal/detail.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.detailData});

  final Detail detailData;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool? value1 = false;
  Future<void>? _launched;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: SizedBox(
              height: screenHeight * 0.4,
              child: Stack(
                children: [
                  //Detail Image
                  Positioned(
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      width: double.maxFinite,
                      height: screenHeight * 0.5,
                      child: Hero(
                        tag: widget.detailData.idMeal,
                        child: Image.network(
                          widget.detailData.strMealThumb,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  //Detail Title
                  Positioned(
                    bottom: 15.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        child: Text(
                          widget.detailData.strMeal,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //Design between Image and Card
          Positioned(
            left: 0,
            right: 0,
            top: screenHeight * 0.37,
            child: Column(
              children: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        margin: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(offset: Offset(2, 2), blurRadius: 3)
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              barrierDismissible:
                                  false, // Prevents closing the dialog by clicking outside
                              builder: (context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  elevation: 16,
                                  child: Container(
                                    margin: const EdgeInsets.all(20),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text('Ingredient Lists',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                        const SizedBox(height: 18),
                                        SizedBox(
                                            height: 450,
                                            child: ListView(
                                              shrinkWrap: true,
                                              children: [
                                                IngredientTile(
                                                    ingredientData: widget
                                                        .detailData
                                                        .strIngredient1),
                                                IngredientTile(
                                                    ingredientData: widget
                                                        .detailData
                                                        .strIngredient2),
                                                IngredientTile(
                                                    ingredientData: widget
                                                        .detailData
                                                        .strIngredient3),
                                                IngredientTile(
                                                    ingredientData: widget
                                                        .detailData
                                                        .strIngredient4),
                                                IngredientTile(
                                                    ingredientData: widget
                                                        .detailData
                                                        .strIngredient5),
                                                IngredientTile(
                                                    ingredientData: widget
                                                        .detailData
                                                        .strIngredient6),
                                                IngredientTile(
                                                    ingredientData: widget
                                                        .detailData
                                                        .strIngredient7),
                                                IngredientTile(
                                                    ingredientData: widget
                                                        .detailData
                                                        .strIngredient8),
                                                IngredientTile(
                                                    ingredientData: widget
                                                        .detailData
                                                        .strIngredient9),
                                                IngredientTile(
                                                    ingredientData: widget
                                                        .detailData
                                                        .strIngredient10),
                                                IngredientTile(
                                                    ingredientData: widget
                                                        .detailData
                                                        .strIngredient11),
                                                IngredientTile(
                                                    ingredientData: widget
                                                        .detailData
                                                        .strIngredient12),
                                                IngredientTile(
                                                    ingredientData: widget
                                                        .detailData
                                                        .strIngredient13),
                                                IngredientTile(
                                                    ingredientData: widget
                                                        .detailData
                                                        .strIngredient14),
                                                IngredientTile(
                                                    ingredientData: widget
                                                        .detailData
                                                        .strIngredient15),
                                                IngredientTile(
                                                    ingredientData: widget
                                                        .detailData
                                                        .strIngredient16),
                                                IngredientTile(
                                                    ingredientData: widget
                                                        .detailData
                                                        .strIngredient17),
                                                IngredientTile(
                                                    ingredientData: widget
                                                        .detailData
                                                        .strIngredient18),
                                                IngredientTile(
                                                    ingredientData: widget
                                                        .detailData
                                                        .strIngredient19),
                                                IngredientTile(
                                                    ingredientData: widget
                                                        .detailData
                                                        .strIngredient20),
                                              ],
                                            )),
                                        const SizedBox(height: 20),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(); // Close the dialog
                                          },
                                          child: const Text('Close'),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    height: 40,
                                    width: 40,
                                    child:
                                        Image.asset('assets/ingredient.png')),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'To see Ingredients',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _launched = _launchInBrowserView(
                                Uri.parse(widget.detailData.strYoutube));
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 1),
                          width: 45,
                          height: 45,
                          child: Image.asset('assets/youtube.png'),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(
                  color: Colors.black,
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, right: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(offset: Offset(2, 2), blurRadius: 3)
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: Image.asset('assets/area.png')),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  widget.detailData.strArea,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(right: 20, left: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(offset: Offset(2, 2), blurRadius: 3)
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: Image.asset('assets/category.png')),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  widget.detailData.strCategory,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Instructions',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: InstructionTextWidget(
                      text: widget.detailData.strInstructions),
                ),
                FutureBuilder<void>(future: _launched, builder: _launchStatus),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IngredientTile extends StatefulWidget {
  const IngredientTile({super.key, required this.ingredientData});

  final String? ingredientData;

  @override
  State<IngredientTile> createState() => _IngredientTileState();
}

class _IngredientTileState extends State<IngredientTile> {
  bool value1 = false;
  @override
  Widget build(BuildContext context) {
    return widget.ingredientData == ""
        ? const SizedBox.shrink()
        : CheckboxListTile(
            title: Text(widget.ingredientData.toString()),
            controlAffinity: ListTileControlAffinity.leading,
            value: value1,
            onChanged: (bool? value) {
              setState(() {
                value1 = value!; // Updated here
              });
            },
          );
  }
}

Future<void> _launchInBrowserView(Uri url) async {
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}

Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
  if (snapshot.hasError) {
    return Text('Error: ${snapshot.error}');
  } else {
    return const Text('');
  }
}

Widget _ingredientList(String ingredientData) {
  return Container();
}

class InstructionTextWidget extends StatefulWidget {
  final String text;

  const InstructionTextWidget({super.key, required this.text});

  @override
  _InstructionTextWidgetState createState() => _InstructionTextWidgetState();
}

class _InstructionTextWidgetState extends State<InstructionTextWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _isExpanded
            ? SizedBox(
                height: 250,
                child: SingleChildScrollView(
                  child: Text(
                    widget.text,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              )
            : Text(
                widget.text,
                style: const TextStyle(fontSize: 16),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 20.0),
            child: Text(
              _isExpanded ? 'See less' : 'See more',
              style: const TextStyle(color: Colors.blue, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
