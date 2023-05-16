import 'package:efood/controllers/recipes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditRecipeWidget extends StatefulWidget {
  const EditRecipeWidget({Key? key}) : super(key: key);

  @override
  _EditRecipeWidgetState createState() => _EditRecipeWidgetState();
}

class _EditRecipeWidgetState extends State<EditRecipeWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  final bool value = true;
  final RecipeController recipeController = Get.find();
  Map<String, bool> checks = {};
  String? recipeName;
  List<Widget> ingredients = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      recipeName = recipeController.curRec;
      recipeController.getIngredients(recipeName!).forEach((key, value) {
        checks.addAll({"$key": false});
        ingredients.add(Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  StatefulBuilder(
                    builder: (context, setState) {
                      return Checkbox(
                        value: checks["$key"],
                        onChanged: (newval) async {
                          setState(() {
                            checks["$key"] = newval!;
                          });
                        },
                      );
                    },
                  ),
                  Text("$key")
                ],
              ),
              Text("$value")
            ],
          ),
        ));
      });
    });
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Align(
            alignment: const AlignmentDirectional(0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1, 0),
                  child: IconButton(
                    icon: const Icon(
                      Icons.chevron_left_outlined,
                      color: Color(0xFF368C72),
                      size: 30,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                          child: Text(
                            '$recipeName',
                            style: const TextStyle(
                              fontFamily: 'Raleway',
                              color: Color(0xFF368C72),
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: const [
                            Text(
                              'Ingrediente',
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                color: Color(0xFF9D9D9D),
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0.85, 0),
                                child: Text(
                                  'Cantidad',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    color: Color(0xFF9D9D9D),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        child: Column(
                          children: ingredients,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
