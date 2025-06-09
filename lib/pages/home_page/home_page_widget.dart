// library;

// import '/flutter_flow/flutter_flow_icon_button.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'home_page_model.dart';
// export 'home_page_model.dart';

// class HomePageWidget extends StatefulWidget {
//   final IconData icon;
//   final String? textstring;
//   final String? hintstring;

//   const HomePageWidget({super.key, this.icon = Icons.person, this.textstring, this.hintstring});

//   static String routeName = 'HomePage';
//   static String routePath = '/homePage';

//   @override
//   State<HomePageWidget> createState() => _HomePageWidgetState();
// }

// class _HomePageWidgetState extends State<HomePageWidget> {
//   late HomePageModel _model;

//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => HomePageModel());

//     _model.textController ??= TextEditingController();
//     _model.textFieldFocusNode ??= FocusNode();
//   }

//   @override
//   void dispose() {
//     _model.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//         FocusManager.instance.primaryFocus?.unfocus();
//       },

//       child: SafeArea(
//         top: true,
//         child: Padding(
//           padding: EdgeInsets.all(24.0),
//           child: Container(
//             width: 200.0,
//             height: 55.0,
//             decoration: BoxDecoration(
//               color: FlutterFlowTheme.of(context).secondaryBackground,
//             ),
//             child: Material(
//               color: Colors.transparent,
//               elevation: 3.0,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: Container(
//                 width: 500.0,
//                 decoration: BoxDecoration(
//                   color: FlutterFlowTheme.of(context).info,
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         color: FlutterFlowTheme.of(context).secondary,
//                         borderRadius: BorderRadius.circular(12.0),
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Icon(
//                             widget.icon,
//                             color: FlutterFlowTheme.of(context).info,
//                             size: 24.0,
//                           ),
//                           Expanded(
//                             child: Container(
//                               width: 200.0,
//                               child: TextFormField(
//                                 controller: _model.textController,
//                                 focusNode: _model.textFieldFocusNode,
//                                 autofocus: false,
//                                 obscureText: false,
//                                 decoration: InputDecoration(
//                                   isDense: true,
//                                   labelStyle: FlutterFlowTheme.of(
//                                     context,
//                                   ).labelMedium.override(
//                                     font: GoogleFonts.inter(
//                                       fontWeight:
//                                           FlutterFlowTheme.of(
//                                             context,
//                                           ).labelMedium.fontWeight,
//                                       fontStyle:
//                                           FlutterFlowTheme.of(
//                                             context,
//                                           ).labelMedium.fontStyle,
//                                     ),
//                                     letterSpacing: 0.0,
//                                     fontWeight:
//                                         FlutterFlowTheme.of(
//                                           context,
//                                         ).labelMedium.fontWeight,
//                                     fontStyle:
//                                         FlutterFlowTheme.of(
//                                           context,
//                                         ).labelMedium.fontStyle,
//                                   ),
//                                   hintText: widget.hintstring,
//                                   hintStyle: FlutterFlowTheme.of(
//                                     context,
//                                   ).labelMedium.override(
//                                     font: GoogleFonts.inter(
//                                       fontWeight:
//                                           FlutterFlowTheme.of(
//                                             context,
//                                           ).labelMedium.fontWeight,
//                                       fontStyle:
//                                           FlutterFlowTheme.of(
//                                             context,
//                                           ).labelMedium.fontStyle,
//                                     ),
//                                     letterSpacing: 0.0,
//                                     fontWeight:
//                                         FlutterFlowTheme.of(
//                                           context,
//                                         ).labelMedium.fontWeight,
//                                     fontStyle:
//                                         FlutterFlowTheme.of(
//                                           context,
//                                         ).labelMedium.fontStyle,
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                       color: Color(0x00000000),
//                                       width: 1.0,
//                                     ),
//                                     borderRadius: BorderRadius.circular(12.0),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                       color: Color(0x00000000),
//                                       width: 1.0,
//                                     ),
//                                     borderRadius: BorderRadius.circular(12.0),
//                                   ),
//                                   errorBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                       color: FlutterFlowTheme.of(context).error,
//                                       width: 1.0,
//                                     ),
//                                     borderRadius: BorderRadius.circular(12.0),
//                                   ),
//                                   focusedErrorBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                       color: FlutterFlowTheme.of(context).error,
//                                       width: 1.0,
//                                     ),
//                                     borderRadius: BorderRadius.circular(12.0),
//                                   ),
//                                   filled: true,
//                                   fillColor:
//                                       FlutterFlowTheme.of(
//                                         context,
//                                       ).secondaryBackground,
//                                   contentPadding: EdgeInsets.all(10.0),
//                                 ),
//                                 style: FlutterFlowTheme.of(
//                                   context,
//                                 ).bodyMedium.override(
//                                   font: GoogleFonts.inter(
//                                     fontWeight:
//                                         FlutterFlowTheme.of(
//                                           context,
//                                         ).bodyMedium.fontWeight,
//                                     fontStyle:
//                                         FlutterFlowTheme.of(
//                                           context,
//                                         ).bodyMedium.fontStyle,
//                                   ),
//                                   letterSpacing: 0.0,
//                                   fontWeight:
//                                       FlutterFlowTheme.of(
//                                         context,
//                                       ).bodyMedium.fontWeight,
//                                   fontStyle:
//                                       FlutterFlowTheme.of(
//                                         context,
//                                       ).bodyMedium.fontStyle,
//                                 ),
//                                 cursorColor:
//                                     FlutterFlowTheme.of(context).primaryText,
//                                 validator: _model.textControllerValidator
//                                     .asValidator(context),
//                               ),
//                             ),
//                           ),
//                           FlutterFlowIconButton(
//                             borderRadius: 8.0,
//                             buttonSize: 40.0,
//                             fillColor: FlutterFlowTheme.of(context).secondary,
//                             icon: Icon(
//                               Icons.arrow_drop_down_sharp,
//                               color: FlutterFlowTheme.of(context).info,
//                               size: 24.0,
//                             ),
//                             onPressed: () {
//                               print('IconButton pressed ...');
//                             },
//                           ),
//                           FlutterFlowIconButton(
//                             borderRadius: 8.0,
//                             buttonSize: 40.0,
//                             fillColor: FlutterFlowTheme.of(context).secondary,
//                             icon: Icon(
//                               Icons.search,
//                               color: FlutterFlowTheme.of(context).info,
//                               size: 24.0,
//                             ),
//                             onPressed: () {
//                               print('IconButton pressed ...');
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                     Row(
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         Expanded(
//                           child: Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(
//                               30.0,
//                               0.0,
//                               0.0,
//                               0.0,
//                             ),
//                             child: Text(
//                               widget.textstring!,
//                               style: FlutterFlowTheme.of(
//                                 context,
//                               ).bodyMedium.override(
//                                 font: GoogleFonts.inter(
//                                   fontWeight:
//                                       FlutterFlowTheme.of(
//                                         context,
//                                       ).bodyMedium.fontWeight,
//                                   fontStyle:
//                                       FlutterFlowTheme.of(
//                                         context,
//                                       ).bodyMedium.fontStyle,
//                                 ),
//                                 fontSize: 10.0,
//                                 letterSpacing: 0.0,
//                                 fontWeight:
//                                     FlutterFlowTheme.of(
//                                       context,
//                                     ).bodyMedium.fontWeight,
//                                 fontStyle:
//                                     FlutterFlowTheme.of(
//                                       context,
//                                     ).bodyMedium.fontStyle,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: Align(
//                             alignment: AlignmentDirectional(1.0, 0.0),
//                             child: Padding(
//                               padding: EdgeInsetsDirectional.fromSTEB(
//                                 0.0,
//                                 0.0,
//                                 5.0,
//                                 0.0,
//                               ),
//                               child: Icon(
//                                 Icons.info_outline,
//                                 color:
//                                     FlutterFlowTheme.of(context).secondaryText,
//                                 size: 14.0,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
