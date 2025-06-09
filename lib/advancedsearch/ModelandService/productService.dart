// // ignore: file_names

// import 'dart:convert';
// import 'dart:io';

// import 'package:http/http.dart' as http;

// import 'productitemModels.dart';
// import 'package:path_provider/path_provider.dart';

// // ignore: camel_case_types
// class product_fetch_services {
//   static String string_url = "https://localhost:44390/";
//   static Future<List<Producttypecl>> getproducttype(
//     String connectionString,
//   ) async {
//     try {
//       var url = Uri.parse(
//         "https://localhost:44390/itemview/api/GetProductTypeMaster?connectionstring=$connectionString",
//       );
//       var client = http.Client();
//       var response = await client.get(url);

//       if (response.statusCode == 200) {
//         final List<Producttypecl> producttypelist = producttypeclFromJson(
//           response.body,
//         );
//         return producttypelist;
//       } else {
//         return [];
//       }
//     } catch (e) {
//       //  shareTextFile(e.toString());
//       return [];
//     }
//   }

//   static Future<List<ProductCategory>> getallproductcategory(
//     String connectionString,
//   ) async {
//     try {
//       var url = Uri.parse(
//         "${string_url}itemview/api/GetProallCategoryMaster?connectionstring=$connectionString",
//       );
//       var client = http.Client();
//       var response = await client.get(url);

//       if (response.statusCode == 200) {
//         final List<ProductCategory> productcategorylist =
//             productCategoryFromJson(response.body);

//         return productcategorylist;
//       } else {
//         return [];
//       }
//     } catch (e) {
//       //    shareTextFile(e.toString());
//       return [];
//     }
//   }

//   // static Future<void> getdatafromwinforms() async {
//   //   try {
//   //     var url = Uri.parse("${MainApp.string_url}api/getdatafromwinforms");
//   //     var client = http.Client();
//   //     var response = await client.get(url);

//   //     if (response.statusCode == 200) {
//   //       List<GetUserid> data = getUseridFromJson(response.body);
//   //       MainApp.user_id = data[0].value;
//   //     } else {
//   //       print("Status code:${response.statusCode}");
//   //     }
//   //   } catch (e) {
//   //     print(e);
//   //   }
//   // }
//   static Future<List<TableSettings>> gettablesettings(
//     String sales,
//     int userid,
//     String connectionString,
//   ) async {
//     try {
//       var url = Uri.parse(
//         "${string_url}itemview/api/GetSettingsMaster?sales=$sales&userid=$userid&connectionstring=$connectionString",
//       );
//       print(url);
//       var client = http.Client();
//       var response = await client.get(url);
//       if (response.statusCode == 200) {
//         final List<TableSettings> settingslist = tableSettingsFromJson(
//           response.body,
//         );
//         return settingslist;
//       } else {
//         return [];
//       }
//     } catch (e) {
//       //   shareTextFile(e.toString());
//       return [];
//     }
//   }
//   // static Future<List<ProductCategory>> getproductcategory(int typeid) async {
//   //   try {
//   //     var url = Uri.parse(
//   //         "${MainApp.string_url}api/GetProductCategoryMaster?typeid=$typeid");
//   //     var client = http.Client();
//   //     var response = await client.get(url);

//   //     if (response.statusCode == 200) {
//   //       final List<ProductCategory> productcategorylist =
//   //           productCategoryFromJson(response.body);
//   //       return productcategorylist;
//   //     } else {
//   //       return [];
//   //     }
//   //   } catch (e) {
//   //     return [];
//   //   }
//   // }

//   // static Future<List<Product>> getproduct(int catid) async {
//   //   try {
//   //     var url =
//   //         Uri.parse("${MainApp.string_url}api/GetProductMaster?catid=$catid");
//   //     var client = http.Client();
//   //     var response = await client.get(url);

//   //     if (response.statusCode == 200) {
//   //       final List<Product> productlist = productFromJson(response.body);
//   //       return productlist;
//   //     } else {
//   //       return [];
//   //     }
//   //   } catch (e) {
//   //     return [];
//   //   }
//   // }

//   // static Future<List<ProductBatch>> getproductBatch(int productid) async {
//   //   try {
//   //     var url = Uri.parse(
//   //         "${MainApp.string_url}api/GetProductBatchMaster?productid=$productid");
//   //     var client = http.Client();
//   //     var response = await client.get(url);

//   //     if (response.statusCode == 200) {
//   //       final List<ProductBatch> productbatchlist =
//   //           productBatchFromJson(response.body);
//   //       return productbatchlist;
//   //     } else {
//   //       return [];
//   //     }
//   //   } catch (e) {
//   //     return [];
//   //   }
//   // }

//   static Future<List<ProductItems>> getproductf(
//     int cid,
//     String connectionString,
//     String type,
//   ) async {
//     try {
//       var url = Uri.parse(
//         "${string_url}itemview/api/GetProductSP?by='Customer'&cid=$cid&connectionstring=$connectionString&salestype=$type",
//       );
//       var client = http.Client();
//       var response = await client.get(url);
//       if (response.statusCode == 200) {
//         final List<ProductItems> producttlist = productItemsFromJson(
//           response.body,
//         );
//         //print( producttlist.length);
//         return producttlist;
//       } else {
//         return [];
//       }
//     } catch (e) {
//       //   shareTextFile(e.toString());
//       print(e);
//       return [];
//     }
//   }

//   static Future<List<Fivefield>> getfivefield(String connectionString) async {
//     try {
//       var url = Uri.parse(
//         "${string_url}itemview/api/GetFiveField?connectionstring=$connectionString",
//       );
//       var client = http.Client();
//       var response = await client.get(url);
//       if (response.statusCode == 200) {
//         final List<Fivefield> producttlist = fivefieldFromJson(response.body);
//         return producttlist;
//       } else {
//         return [];
//       }
//     } catch (e) {
//       //    shareTextFile(e.toString());
//       print(e);
//       return [];
//     }
//   }

//   static Future<void> sendDataToWinForms(
//     List<Map<String, String>> dataToSend,
//     String popupId,
//   ) async {
//     try {
//       var url = Uri.parse(
//         "${string_url}senddatatowinformsItem?popupId=$popupId",
//       );
//       List<List<KeyValuePair>> keyValuePairs = convertToKeyValuePairs(
//         dataToSend,
//       );
//       var body = jsonEncode(keyValuePairs);
//       var response = await http.post(
//         url,
//         body: body,
//         headers: {'Content-Type': 'application/json'},
//       );
//       if (response.statusCode == 200) {
//         print('Data sent to WinForms response:${response.body}');
//         await notifyWinFormsToClose(popupId);
//       } else {
//         //   shareTextFile("Response:${response.statusCode}:${response.body}");
//         print('Error sending data to WinForms: ${response.statusCode}');
//       }
//     } catch (e) {
//       //    shareTextFile(e.toString());
//     }
//   }

//   static Future<List<Map<String, String>>> fetchDataFromWinForms(
//     String popupId,
//   ) async {
//     try {
//       var url = Uri.parse(
//         "${string_url}getdatafromwinformsItem?popupId=$popupId",
//       );
//       print(url);
//       print("1111111111111111111111111111111111111111111111111111111111111");

//       var response = await http.get(url);
//       print(url);
//       print(response.body);
//       if (response.statusCode == 200) {
//         List<dynamic> responseBody = jsonDecode(response.body);
//         List<Map<String, String>> parsedData =
//             responseBody.map((item) {
//               return Map<String, String>.from(item);
//             }).toList();
//         return parsedData;
//       } else {
//         //  shareTextFile("Response:${response.statusCode}:${response.body}");
//         return Future.error("Failed to fetch data");
//       }
//     } catch (e) {
//       print(e);
//       //   shareTextFile(e.toString());

//       return Future.error("$e");
//     }
//   }

//   static Future<void> notifyWinFormsToClose(String popupId) async {
//     final response = await http.get(
//       Uri.parse("${string_url}/notifyclosewebview2Item?popupId=$popupId"),
//     );
//     if (response.statusCode == 200) {
//       print('WinForms notified to close WebView');
//     } else {
//       print('Error notifying WinForms to close WebView');
//     }
//   }

//   static Future<void> shareTextFile(String errormsg) async {
//     try {
//       final directory = await getApplicationDocumentsDirectory();
//       final file = File('${directory.path}/error_log.txt');
//       if (await file.exists()) {
//         String contents = await file.readAsString();
//         await file.writeAsString(
//           "${DateTime.now()}::$errormsg\n\n$contents",
//           mode: FileMode.write,
//         );
//       } else {
//         await file.writeAsString(errormsg);
//       }
//     } catch (e) {
//       print("Error saving file: $e");
//     }
//   }
// }

// List<List<KeyValuePair>> convertToKeyValuePairs(List<dynamic> mappedListAll) {
//   //List<KeyValuePair> selectedProductValues = [];
//   List<List<KeyValuePair>> productlist = [];
//   for (var item in mappedListAll) {
//     List<KeyValuePair> productDetails = [];
//     item.forEach((key, value) {
//       if (value != null) {
//         productDetails.add(KeyValuePair(key, value.toString()));
//       }
//     });
//     productlist.add(productDetails);
//   }
//   return productlist;
// }
