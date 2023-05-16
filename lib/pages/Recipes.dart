import 'package:efood/controllers/recipes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class RecipesWidget extends StatefulWidget {
  const RecipesWidget({Key? key}) : super(key: key);

  @override
  _RecipesWidgetState createState() => _RecipesWidgetState();
}

class _RecipesWidgetState extends State<RecipesWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  RecipeController recipeController = Get.find();
  List<Map<dynamic, dynamic>> recs = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      getRecipes();
    });
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  getRecipes() async {
    await recipeController.getRecipes().then((value) => {
          setState(() {
            recs = recipeController.recipes;
            print("aaaaa ${recs[0]}");
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 30, 0, 0),
                  child: Text(
                    'Mis Listas',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      color: Color(0xFF368C72),
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: recs
                            .firstWhereOrNull((element) => true)
                            ?.keys
                            .map((e) {
                          String recName = e;
                          // ignore: non_constant_identifier_names
                          List<Text> NameAndIngredients = [
                            Text(
                              "$recName \n",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )
                          ];
                          NameAndIngredients.addAll(recipeController
                              .getIngredients(recName)
                              .keys
                              .map((ing) {
                            return Text(ing);
                          }).toList());
                          return GridTile(
                              child: InkWell(
                            onTap: () {
                              recipeController.curRec = e;
                              Navigator.pushNamed(context, "/recipedetails");
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    width: 3,
                                  ),
                                ),
                                child: Column(
                                  children: NameAndIngredients,
                                )),
                          ));
                        }).toList() ??
                        [],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 130,
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color(0xFF368C72),
                          border: Border.all(
                            color: const Color(0xFF368C72),
                          ),
                        ),
                        child: const Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/homepage");
                      },
                      child: Container(
                        width: 130,
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color(0xFF368C72),
                          border: Border.all(
                            color: const Color(0xFF368C72),
                          ),
                        ),
                        child: const Icon(
                          Icons.all_inbox_sharp,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/user");
                      },
                      child: Container(
                        width: 130,
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color(0xFF368C72),
                          border: Border.all(
                            color: const Color(0xFF368C72),
                          ),
                        ),
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
