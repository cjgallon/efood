import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuickProductWidget extends StatefulWidget {
  const QuickProductWidget({
    Key? key,
    String? name,
    String? description,
  })  : this.name = name ?? 'Item name',
        this.description = description ?? 'Item description',
        super(key: key);

  final String name;
  final String description;

  @override
  _QuickProductWidgetState createState() => _QuickProductWidgetState();
}

class _QuickProductWidgetState extends State<QuickProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color(0xFFa7e9d1),
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                  child: Icon(
                    Icons.delete_outline,
                    color: Color(0xFF369c72),
                    size: 20,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                            fontFamily:
                                GoogleFonts.getFont('Raleway').fontFamily,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.height * 0.02,
                          ),
                        ),
                        Text(
                          widget.description,
                          style: TextStyle(
                            fontFamily:
                                GoogleFonts.getFont('Raleway').fontFamily,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.015,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF369c72),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
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
