import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:efood/components/defaultProducts.dart';

class ReminderWidget extends StatefulWidget {
  const ReminderWidget({Key? key}) : super(key: key);

  @override
  _ReminderWidgetState createState() => _ReminderWidgetState();
}

class _ReminderWidgetState extends State<ReminderWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: const AlignmentDirectional(1, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.136,
                    height: 53.4,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(width: 1, color: Colors.transparent),
                    ),
                    child: IconButton(
                      color: Colors.transparent,
                      icon: const Icon(
                        Icons.close,
                        color: Color(0xFF7B7B7B),
                        size: 30,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                  ),
                ),
                Text(
                  'RECORDATORIOS',
                  style: TextStyle(
                    fontFamily: GoogleFonts.getFont('Inter').fontFamily,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF72D67E),
                    fontSize: MediaQuery.of(context).size.height * 0.04,
                  ),
                ),
                Text(
                  '¿Con cuántos días de anticipación le gustaría \n recibir un recordatorio de que sus articulos\n están a punto de caducar?',
                  textAlign: TextAlign.start,
                  maxLines: 3,
                  style: TextStyle(
                    fontFamily: GoogleFonts.getFont('Inter').fontFamily,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.calendar_today_rounded,
                            color: Color(0xFF72D67E),
                            size: 24,
                          ),
                          Container(
                            width: 180,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFFA6A6A6),
                                width: 2,
                              ),
                              borderRadius: const BorderRadius.all(Radius.zero),
                            ),
                            margin: const EdgeInsetsDirectional.fromSTEB(
                                12, 4, 12, 4),
                            child: DropdownButton(
                              items: List<DropdownMenuItem<int>>.generate(30,
                                  (int index) {
                                return DropdownMenuItem<int>(
                                  value: index + 1,
                                  child: Text('${index + 1}'),
                                );
                              }),
                              onChanged: ((val) => setState(() {})),
                              hint: const Text('Seleccione un valor...'),
                              underline: Container(),
                              elevation: 2,
                            ),
                          )
                        ],
                      ),
                      Text(
                        '(Escoja una opción del menú desplegable)',
                        style: TextStyle(
                          fontFamily: GoogleFonts.getFont('Inter').fontFamily,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.height * 0.018,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: Color(0xFF7B7B7B),
                ),
                const Text(
                  '¿A que hora le gustaría recibir la notificación?',
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 57.9,
                  decoration: BoxDecoration(),
                  child: Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.watch_later,
                          color: Color.fromARGB(100, 114, 214, 126),
                          size: 30,
                        ),
                        onPressed: () async {},
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: TextButton(
                    onPressed: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (bottomSheetContext) {
                          return GestureDetector(
                            onTap: () => FocusScope.of(context)
                                .requestFocus(_unfocusNode),
                            child: Padding(
                              padding:
                                  MediaQuery.of(bottomSheetContext).viewInsets,
                              child: DefaultProductsWidget(),
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(100, 114, 214, 126)),
                      shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                      minimumSize: MaterialStateProperty.all(
                        const Size(150, 50),
                      ),
                    ),
                    child: const Text(
                      'Guardar',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
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
