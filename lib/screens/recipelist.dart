import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recipe_app/services/recipeService.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({super.key});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  var _recipeList = [];
  String title = '';
  String image = '';
  String description = '';
  String error = '';
  String recipe = '';
  final int _recipeCount = 0;

  Future<bool> updateRecipe(int recipeId, Object updateBody) async {
    updateBody = json.encode(updateBody);
    Map updateStatus =
        jsonDecode(await RecipeService.patch("/recipes/$recipeId", updateBody));
    print(updateStatus);
    if (updateStatus["status"] == "success") {
      print("recipe updated");
      print(updateStatus);
      return true;
    }

    setState(() {
      error = 'something went wrong';
    });
    return false;
  }

  Future<bool> createRecipe(
      String title, String image, String description) async {
    Map recipeStatus = jsonDecode(await RecipeService.post("/recipes", {
      "title": title,
      "image": image,
      "description": description,
    }));
    print(recipeStatus);
    if (recipeStatus["status"] == 'success') {
      print("recipe created");
      print(recipeStatus);
      return true;
    }

    setState(() {
      error = 'Something went wrong';
    });
    return false;
  }

  void deleteRecipe({int recipeID = 0}) async {
    try {
      print(recipeID);
      final response = await RecipeService.delete('/recipes/$recipeID');
      // final jsonData = jsonDecode(response)['data']['recipes'];

      print(response);
      print('deleted successfully');

      setState(() {});
    } catch (err) {}
  }

  void getRecipeList() async {
    try {
      final response = await RecipeService.get(endpoint: '/recipes');
      final jsonData = jsonDecode(response)['data']['recipes'];
      print(response);

      setState(() {
        _recipeList = jsonData;
      });
    } catch (err) {}
  }

  void editRecipe(Map<String, dynamic> recipe) async {
    showDialogWithFields(recipe: recipe, operation: "UPDATE");
  }

  @override
  void initState() {
    super.initState();
    getRecipeList();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Recipe Menu'),
          backgroundColor: const Color.fromARGB(255, 255, 175, 14),
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Recipe List',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w500)),
                  Container(
                    width: 150,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        border: Border.all(
                            color: const Color.fromARGB(255, 231, 229, 229))),
                    child: const Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'search..',
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.all(0.0),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                          size: 20,
                        ),
                        prefixIconConstraints:
                            BoxConstraints(maxHeight: 20, minWidth: 25),
                      ),
                    )),
                  )
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: _recipeList.length,
              itemBuilder: (context, i) {
                final recipe = _recipeList[i];
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      child: Stack(
                        children: [
                          Card(
                            child: ListTile(
                                leading: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(45)),
                                    height: 100.0,
                                    width: 100.0, // fixed width and height
                                    child: Image.network('${recipe['image']}')),
                                title: Text('${recipe['title']}'),
                                subtitle: Text('${recipe['description']}'),
                                trailing: PopupMenuButton(
                                  itemBuilder: (context) {
                                    return [
                                      PopupMenuItem(
                                        value: 'edit',
                                        child: TextButton(
                                            onPressed: () {
                                              editRecipe(recipe);
                                            },
                                            child: const Text('Edit')),
                                      ),
                                      PopupMenuItem(
                                        value: 'delete',
                                        child: TextButton(
                                            onPressed: () {
                                              deleteRecipe(
                                                  recipeID: recipe['id']);
                                              getRecipeList();
                                            },
                                            child: const Text('Delete')),
                                      )
                                    ];
                                  },
                                  onSelected: (String value) {},
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 255, 175, 14),
            onPressed: () {
              showDialogWithFields(operation: "CREATE");
            },
            child: const Icon(Icons.add)));
  }

  void showDialogWithFields(
      {Map<String, dynamic> recipe = const {}, operation = ""}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: const Text('edit Recipe'),
            content: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Form(
                child: Column(children: <Widget>[
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      initialValue: findAltText(
                          model: recipe, fieldName: "title", altText: " "),
                      onChanged: (value) {
                        setState(() {
                          error = "";
                          title = value;
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: 'title',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      initialValue: findAltText(
                          model: recipe, fieldName: "image", altText: " "),
                      onChanged: (value) {
                        setState(() {
                          error = "";
                          image = value;
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: 'image',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      initialValue: findAltText(
                          model: recipe,
                          fieldName: "description",
                          altText: " "),
                      onChanged: (value) {
                        setState(() {
                          error = "";
                          description = value;
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: 'description',
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () async {
                  if (operation == "CREATE") {
                    if (await createRecipe(
                      title,
                      image,
                      description,
                    )) {
                      Navigator.pop(context);
                      getRecipeList();
                    }
                  } else if (operation == "UPDATE") {
                    await updateRecipe(recipe['id'], {
                      'title': title,
                      'image': image,
                      'description': description
                    });
                    Navigator.pop(context);
                    getRecipeList();
                  }
                },
                child: const Text('update Recipe'),
              ),
            ],
          );
        });
  }

  String findAltText(
      {Map<String, dynamic> model = const {},
      String fieldName = "",
      String altText = "Alt Text"}) {
    if (model[fieldName] == null) {
      return altText;
    }
    return model[fieldName];
  }
}
