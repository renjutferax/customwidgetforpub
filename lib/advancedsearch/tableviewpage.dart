// library;

// import 'dart:convert';
// import 'dart:core';

// import 'package:flutter/material.dart';
// import 'package:my_custom_widgets/advancedsearch/ModelandService/productService.dart';
// import 'ModelandService/productitemModels.dart';
// import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

// class TableViewPage extends StatefulWidget {
//   final String popupId;
//   final int user_id;
//   final String searchdata;
//   final String sales;
//   final String connectionstring;
//   final String salestype;

//   TableViewPage(this.popupId,
//   this.user_id,
//   this.searchdata,
//   this.sales,
//   this.connectionstring,
//   this.salestype
//    );

//   @override
//   State<TableViewPage> createState() => _TableViewPageState();
// }

// class _TableViewPageState extends State<TableViewPage> {
//   final stopwatch = Stopwatch()..start();
//   late bool _pageloaded = false;
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   Color primaryclr = const Color.fromARGB(255, 12, 22, 55);
//   Color pclr = const Color.fromARGB(255, 52, 66, 104);
//   Color prclr = const Color.fromARGB(12, 22, 55, 255);
//   Color cardclr = const Color.fromARGB(255, 255, 255, 255);
//   Color selectedcardclr = const Color.fromARGB(255, 120, 140, 180);
//   final TextEditingController _searchController = TextEditingController();
//   final FocusNode _focusNode = FocusNode();
//   final ItemScrollController _typescrollController = ItemScrollController();
//   final ItemScrollController _categorycrollController = ItemScrollController();
//   final ItemScrollController _itemcrollController = ItemScrollController();
//   final TextEditingController _itemsearchController = TextEditingController();
//   late FocusNode _searchFocusNode;
//   //0,230,255
//   //Color cardclr = Color.fromARGB(255, 228,233,239);
//   //228,233,239
//   //Color.fromARGB(255, 225, 237, 255);

//   bool _isloded = false;
//   int _iscategoryloded = 0;
//   int _isproductloded = 0;
//   int _isBatchloded = 0;

//   int selctedtypecardindex = 0;
//   int categorytypecardindex = 0;
//   int nametypecardindex = 0;
//   int batchardthindex = -1;

//   ValueNotifier<List<Map<String, bool>>> batchtablerows = ValueNotifier([]);
//   // int typeid = -1;
//   // int catid = -1;
//   // int nameid = -1;
//   // int batchid = -1;
//   List<ProductItems> splistbatchandname = [];
//   List<ProductItems> searchappear = [];
//   ValueNotifier<List<ProductItems>> filterbatchandname =
//       ValueNotifier<List<ProductItems>>([]);

//   List<Producttypecl> producttypeli = [];
//   List<Producttypecl> filteredproducttype = [];
//   final Map<int, ValueNotifier<Color>> typecardColors = {};

//   List<ProductCategory> productcategory = [];
//   List<ProductCategory> allproductcategory = [];
//   List<ProductCategory> filteredcategory = [];
//   final ValueNotifier<List<ProductCategory>> productCategoryNotifier =
//       ValueNotifier<List<ProductCategory>>([]);
//   final Map<int, ValueNotifier<Color>> categorycardColors = {};

//   List<Product> product = [];
//   List<Product> allproduct = [];
//   List<Product> filterproduct = [];
//   final ValueNotifier<List<Product>> productNameNotifier =
//       ValueNotifier<List<Product>>([]);
//   final Map<int, ValueNotifier<Color>> namecardColors = {};

//   List<ProductItems> productbatch = [];
//   List<ProductItems> allproductbatch = [];
//   List<ProductItems> filterproductbatch = [];
//   final ValueNotifier<List<ProductItems>> productBatchNotifier =
//       ValueNotifier<List<ProductItems>>([]);
//   ProductItems pb = ProductItems(
//     thNo: -1,
//     slNo: 0,
//     id: 0,
//     name: '',
//     categoryId: 0,
//     typeId: 0,
//   );
//   String connectionString = "";
//   String sales = "";
//   String salestype = "";
//   String imageurl =
//       "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";

//   @override
//   void initState() {
//     super.initState();

//     _searchFocusNode = FocusNode();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _searchFocusNode.requestFocus();
//     });
//     _getvaluesfromforms().then((voi) {
//       batchtablerows.value = tempbatchrows;
//       fetchproducttype().then((value) {
//         // stopwatch.stop();
//         // print('Execution time: ${stopwatch.elapsedMilliseconds} ms');
//         tablesetiingsdetails();
//       });
//     });
//     //final stopwatch = Stopwatch()..start();
//   }

//   @override
//   void dispose() {
//     _searchFocusNode.dispose();
//     _itemsearchController.dispose();
//     super.dispose();
//   }

//   List<Map<String, bool>> tempbatchrows = [
//     //{"SlNo": false},
//     {"ID": false},
//     //{"NAME": false},
//     {"CODE": false},
//     {"BARCODE": false},
//     {"PGS_FIELD1": false},
//     {"PGS_FIELD2": false},
//     {"PGS_FIELD3": false},
//     {"PGS_FIELD4": false},
//     {"PGS_FIELD5": false},
//     {"DESCRIPTION": false},
//     {"CATEGORY ID": false},
//     {"TYPE ID": false},
//     {"BRAND": false},
//     {"SUPPLIER": false},
//     {"ALIAS": false},
//     {"STOCK": false},
//     {"UNIT": false},
//     {"2ND UNIT": false},
//     {"EXPIRY DATE": false},
//     {"TAX": false},
//     {"PURCHASE RATE": false},
//     {"COST": false},
//     {"Min.MRP": false},
//     {"MRP": false},
//     {"SALES PRICE 1": false},
//     {"SALES PRICE TAXABLE 1": false},
//     {"SALES PRICE 2": false},
//     {"SALES PRICE TAXABLE 2": false},
//     {"SALES PRICE 3": false},
//     {"SALES PRICE TAXABLE 3": false},
//     {"SALES PRICE 4": false},
//     {"SALES PRICE TAXABLE 4": false},
//     {"SALES PRICE 5": false},
//     {"SALES PRICE TAXABLE 5": false},
//     {"SALES PRICE 6": false},
//     {"SALES PRICE TAXABLE 6": false},
//   ];
//   Fivefield ff = Fivefield();
//   int cust_id = 0;
//   Future<void> _getvaluesfromforms() async {
//     try {
//       List<Map<String, String>> data = await product_fetch_services
//           .fetchDataFromWinForms(widget.popupId);

//       for (var item in data) {
//         if (item["Key"] == "user_id" && item["Value"] != null) {
//           cust_id = int.parse(item["Value"]!);
//         }
//         if (item["Key"] == "searchdata" && item["Value"] != null) {
//           if (item["Value"]!.isNotEmpty) {
//             _itemsearchController.text = item["Value"]!;
//           }
//         }
//         if (item["Key"] == "sales" && item["Value"] != null) {
//           if (item["Value"]!.isNotEmpty) {
//             sales = item["Value"]!;
//           }
//         }
//         if (item["Key"] == "connectionstring" && item["Value"] != null) {
//           if (item["Value"]!.isNotEmpty) {
//             connectionString = item["Value"]!;
//           }
//         }
//         if (item["Key"] == "salestype" && item["Value"] != null) {
//           if (item["Value"]!.isNotEmpty) {
//             salestype = item["Value"]!;
//           }
//         }
//       }
//       if (connectionString == '') {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Error occurred', style: TextStyle(fontSize: 16.0)),
//             behavior: SnackBarBehavior.floating,
//             showCloseIcon: true,
//           ),
//         );
//       }
//       connectionString = connectionString.replaceAll("+", "%2B");
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Error occurred', style: TextStyle(fontSize: 16.0)),
//           behavior: SnackBarBehavior.floating,
//           showCloseIcon: true,
//         ),
//       );
//       //  product_fetch_services.shareTextFile("Error: $e");
//     }
//   }

//   Future<void> fetchproducttype() async {
//     //product_fetch_services.getdatafromwinforms();
//     //SP Load
//     await product_fetch_services
//         .getproductf(cust_id, connectionString, salestype)
//         .then((value) {
//           splistbatchandname = value;
//         });
//     // print('SP Execution time: ${stopwatch.elapsedMilliseconds} ms');
//     //Type Load
//     await product_fetch_services.getproducttype(connectionString).then((value) {
//       producttypeli = value;
//       filteredproducttype = value;
//       if (producttypeli.isNotEmpty) {
//         producttypeli.insert(0, Producttypecl(catId: -1, catType: "ALL"));
//       }
//     });
//     for (int i = 0; i < producttypeli.length; i++) {
//       if (i == 0) {
//         typecardColors[i] = ValueNotifier<Color>(selectedcardclr);
//       } else {
//         typecardColors[i] = ValueNotifier<Color>(cardclr);
//       }
//     }
//     setState(() {
//       _isloded = true;
//       _pageloaded = true;
//       // print('Product type Execution time: ${stopwatch.elapsedMilliseconds} ms');
//     });
//     //category load
//     await product_fetch_services.getallproductcategory(connectionString).then((
//       value,
//     ) {
//       allproductcategory = value;
//       productcategory = value;
//       if (productcategory.length > 1) {
//         productcategory.insert(
//           0,
//           ProductCategory(prodCateId: -1, prodCateName: "ALL", prodCatType: -1),
//         );
//       }
//       _iscategoryloded = 2;
//       filteredcategory = value;
//     });
//     for (int i = 0; i < productcategory.length; i++) {
//       if (i == 0) {
//         categorycardColors[i] = ValueNotifier<Color>(selectedcardclr);
//       } else {
//         categorycardColors[i] = ValueNotifier<Color>(cardclr);
//       }
//     }
//     productCategoryNotifier.value = productcategory;
//     // print('Category Execution time: ${stopwatch.elapsedMilliseconds} ms');

//     _isproductloded = 1;
//     productNameNotifier.value = [];

//     //Item Load
//     ProductCategory prdtemp = ProductCategory(
//       prodCateId: -1,
//       prodCateName: '',
//       prodCatType: -1,
//     );
//     replaceProductName(prdtemp);
//     _filterList(_itemsearchController.text, 3);
//     // print('Item Execution time: ${stopwatch.elapsedMilliseconds} ms');
//   }

//   Future<void> replaceProductCategories(int typeid) async {
//     productcategory = [];
//     _iscategoryloded = 1;
//     productCategoryNotifier.value = [];
//     if (typeid == -1) {
//       productcategory = allproductcategory;
//       // if (productcategory.length > 1) {
//       //   productcategory.insert(
//       //       0,
//       //       ProductCategory(
//       //           prodCateId: -1, prodCateName: "ALL", prodCatType: -1));
//       // }
//       filteredcategory = productcategory;
//       _iscategoryloded = 2;
//     } else {
//       for (var categ in allproductcategory) {
//         if (categ.prodCatType == typeid) {
//           productcategory.add(categ);
//         }
//       }
//       if (productcategory.length > 1) {
//         productcategory.insert(
//           0,
//           ProductCategory(prodCateId: -1, prodCateName: "ALL", prodCatType: -1),
//         );
//       }
//       filteredcategory = productcategory;
//       _iscategoryloded = 2;
//     }
//     for (int i = 0; i < productcategory.length; i++) {
//       categorycardColors[i] = ValueNotifier<Color>(cardclr);
//     }
//     productCategoryNotifier.value = productcategory;
//   }

//   Future<void> replaceProductName(ProductCategory cate) async {
//     _isproductloded = 1;
//     productNameNotifier.value = [];
//     if (cate.prodCateId == -1) {
//       product = [];

//       //print(splistbatchandname.length);
//       for (ProductCategory catele in productcategory) {
//         //print(catele.prodCateId);
//         List<int> clist = [];
//         for (var ele in splistbatchandname) {
//           //print(ele.categoryId);
//           if (catele.prodCateId == ele.categoryId) {
//             if (!clist.contains(ele.id)) {
//               Product tempprod = Product(
//                 prodId: ele.id,
//                 prodName: ele.name,
//                 prodImage: ele.prodImage,
//               );
//               product.add(tempprod);
//               clist.add(ele.id);
//             }
//           }
//         }
//         //if (catele.prodCateId != -1) {
//         // await product_fetch_services.getproduct(ele.prodCateId).then((value) {
//         //   product.addAll(value);
//         // });
//         //}

//         allproduct = product;
//       }

//       filterproduct = product;
//       _isproductloded = 2;
//     } else {
//       product = [];
//       List<int> clist = [];
//       for (var ele in splistbatchandname) {
//         if (cate.prodCateId == ele.categoryId) {
//           if (!clist.contains(ele.id)) {
//             Product tempprod = Product(
//               prodId: ele.id,
//               prodName: ele.name,
//               prodImage: ele.prodImage,
//             );
//             product.add(tempprod);
//             clist.add(ele.id);
//             //print(clist);
//           }
//         }
//       }
//       filterproduct = product;
//       _isproductloded = 2;
//     }
//     for (int i = 0; i < product.length; i++) {
//       namecardColors[i] = ValueNotifier<Color>(cardclr);
//     }
//     productNameNotifier.value = product;
//   }

//   Future<void> replaceBatchName(int productid) async {
//     _isBatchloded = 1;
//     productBatchNotifier.value = [];
//     // await product_fetch_services.getproductBatch(productid).then((value) {
//     //   productbatch = value;
//     //   filterproductbatch = value;
//     //   _isBatchloded = 2;
//     // });
//     productbatch = [];
//     for (var ele in splistbatchandname) {
//       if (productid == ele.id) {
//         productbatch.add(ele);
//       }
//       //product.add(value);
//     }
//     filterproductbatch = productbatch;
//     _isBatchloded = 2;
//     productBatchNotifier.value = productbatch;
//   }

//   void _filterList(String query, int cas) {
//     switch (cas) {
//       case 1:
//         setState(() {
//           filteredproducttype =
//               producttypeli
//                   .where(
//                     (producttypeli) => producttypeli.catType
//                         .toLowerCase()
//                         .contains(query.toLowerCase()),
//                   )
//                   .toList();
//         });
//         typecardColors[selctedtypecardindex]!.value = cardclr;
//         break;
//       case 2:
//         filteredcategory =
//             productcategory
//                 .where(
//                   (productcategory) => productcategory.prodCateName
//                       .toLowerCase()
//                       .contains(query.toLowerCase()),
//                 )
//                 .toList();
//         productCategoryNotifier.value = filteredcategory;
//         categorycardColors[categorytypecardindex]!.value = cardclr;
//         break;
//       case 3:
//         filterproduct =
//             product
//                 .where(
//                   (product) => product.prodName.toLowerCase().contains(
//                     query.toLowerCase(),
//                   ),
//                 )
//                 .toList();
//         productNameNotifier.value = filterproduct;
//         namecardColors[nametypecardindex]!.value = cardclr;
//         break;
//       case 4:
//         List<bool> boolValues = getBoolValues();
//         filterproductbatch =
//             productbatch.where((batchitem) {
//               bool matchesQuery = false;

//               void addConditionIfTrue(bool condition, String value) {
//                 if (condition &&
//                     value.isNotEmpty &&
//                     value.toLowerCase() != "null") {
//                   if (value.toLowerCase().contains(query.toLowerCase())) {
//                     matchesQuery = true;
//                   }
//                 }
//               }

//               addConditionIfTrue(boolValues[0], batchitem.id.toString());
//               addConditionIfTrue(boolValues[1], batchitem.code.toString());
//               addConditionIfTrue(boolValues[2], batchitem.barcode.toString());
//               addConditionIfTrue(
//                 boolValues[3],
//                 batchitem.prodField1.toString(),
//               );
//               addConditionIfTrue(
//                 boolValues[4],
//                 batchitem.prodField2.toString(),
//               );
//               addConditionIfTrue(
//                 boolValues[5],
//                 batchitem.prodField3.toString(),
//               );
//               addConditionIfTrue(
//                 boolValues[6],
//                 batchitem.prodField4.toString(),
//               );
//               addConditionIfTrue(
//                 boolValues[7],
//                 batchitem.prodField5.toString(),
//               );
//               addConditionIfTrue(
//                 boolValues[8],
//                 batchitem.description.toString(),
//               );
//               addConditionIfTrue(
//                 boolValues[9],
//                 batchitem.categoryId.toString(),
//               );
//               addConditionIfTrue(boolValues[10], batchitem.typeId.toString());
//               addConditionIfTrue(boolValues[11], batchitem.brand.toString());
//               addConditionIfTrue(boolValues[12], batchitem.supplier.toString());
//               addConditionIfTrue(boolValues[13], batchitem.alias.toString());
//               addConditionIfTrue(boolValues[14], batchitem.stock.toString());
//               addConditionIfTrue(boolValues[15], batchitem.unit.toString());
//               addConditionIfTrue(boolValues[16], batchitem.secunit.toString());
//               addConditionIfTrue(
//                 boolValues[17],
//                 batchitem.expiryDate.toString(),
//               );
//               addConditionIfTrue(boolValues[18], batchitem.tax.toString());
//               addConditionIfTrue(
//                 boolValues[19],
//                 batchitem.purchaseRate.toString(),
//               );
//               addConditionIfTrue(boolValues[20], batchitem.cost.toString());
//               addConditionIfTrue(boolValues[21], batchitem.minMrp.toString());
//               addConditionIfTrue(boolValues[22], batchitem.mrp.toString());
//               addConditionIfTrue(
//                 boolValues[23],
//                 batchitem.salesPrice1.toString(),
//               );
//               addConditionIfTrue(
//                 boolValues[24],
//                 batchitem.salesPriceTaxable1.toString(),
//               );
//               addConditionIfTrue(
//                 boolValues[25],
//                 batchitem.salesPrice2.toString(),
//               );
//               addConditionIfTrue(
//                 boolValues[26],
//                 batchitem.salesPriceTaxable2.toString(),
//               );
//               addConditionIfTrue(
//                 boolValues[27],
//                 batchitem.salesPrice3.toString(),
//               );
//               addConditionIfTrue(
//                 boolValues[28],
//                 batchitem.salesPriceTaxable3.toString(),
//               );
//               addConditionIfTrue(
//                 boolValues[29],
//                 batchitem.salesPrice4.toString(),
//               );
//               addConditionIfTrue(
//                 boolValues[30],
//                 batchitem.salesPriceTaxable4.toString(),
//               );
//               addConditionIfTrue(
//                 boolValues[31],
//                 batchitem.salesPrice5.toString(),
//               );
//               addConditionIfTrue(
//                 boolValues[32],
//                 batchitem.salesPriceTaxable5.toString(),
//               );
//               addConditionIfTrue(
//                 boolValues[33],
//                 batchitem.salesPrice6.toString(),
//               );
//               addConditionIfTrue(
//                 boolValues[34],
//                 batchitem.salesPriceTaxable6.toString(),
//               );

//               return matchesQuery;
//             }).toList();
//         productBatchNotifier.value = filterproductbatch;
//         break;
//       case 5:
//         List<bool> boolValues = getBoolValues();
//         filterbatchandname.value =
//             splistbatchandname.where((batchitem) {
//               bool matchesQuery = false;
//               void addConditionIfTrue(bool condition, String value) {
//                 if (condition && value.isNotEmpty) {
//                   if (value.toLowerCase().contains(query.toLowerCase())) {
//                     matchesQuery = true;
//                   }
//                 }
//               }

//               addConditionIfTrue(boolValues[0], batchitem.id.toString());
//               addConditionIfTrue(boolValues[1], batchitem.code.toString());
//               addConditionIfTrue(true, batchitem.name.toString());
//               addConditionIfTrue(boolValues[2], batchitem.barcode.toString());
//               addConditionIfTrue(
//                 boolValues[3],
//                 batchitem.prodField1.toString(),
//               );
//               addConditionIfTrue(
//                 boolValues[4],
//                 batchitem.prodField2.toString(),
//               );
//               addConditionIfTrue(
//                 boolValues[5],
//                 batchitem.prodField3.toString(),
//               );
//               addConditionIfTrue(
//                 boolValues[6],
//                 batchitem.prodField4.toString(),
//               );
//               addConditionIfTrue(
//                 boolValues[7],
//                 batchitem.prodField5.toString(),
//               );
//               addConditionIfTrue(
//                 boolValues[8],
//                 batchitem.description.toString(),
//               );
//               addConditionIfTrue(
//                 boolValues[9],
//                 batchitem.categoryId.toString(),
//               );
//               addConditionIfTrue(boolValues[10], batchitem.typeId.toString());
//               addConditionIfTrue(boolValues[11], batchitem.brand.toString());
//               addConditionIfTrue(boolValues[12], batchitem.supplier.toString());
//               addConditionIfTrue(boolValues[13], batchitem.alias.toString());
//               addConditionIfTrue(boolValues[14], batchitem.stock.toString());
//               addConditionIfTrue(boolValues[15], batchitem.unit.toString());
//               addConditionIfTrue(boolValues[16], batchitem.secunit.toString());
//               addConditionIfTrue(
//                 boolValues[17],
//                 batchitem.expiryDate.toString(),
//               );
//               addConditionIfTrue(boolValues[18], batchitem.tax.toString());
//               addConditionIfTrue(
//                 boolValues[19],
//                 batchitem.purchaseRate.toString(),
//               );
//               addConditionIfTrue(boolValues[20], batchitem.cost.toString());
//               addConditionIfTrue(boolValues[21], batchitem.minMrp.toString());
//               addConditionIfTrue(boolValues[22], batchitem.mrp.toString());
//               addConditionIfTrue(
//                 boolValues[23],
//                 batchitem.salesPrice1.toString(),
//               );
//               addConditionIfTrue(
//                 boolValues[24],
//                 batchitem.salesPriceTaxable1.toString(),
//               );
//               addConditionIfTrue(
//                 boolValues[25],
//                 batchitem.salesPrice2.toString(),
//               );
//               addConditionIfTrue(
//                 boolValues[26],
//                 batchitem.salesPriceTaxable2.toString(),
//               );
//               addConditionIfTrue(
//                 boolValues[27],
//                 batchitem.salesPrice3.toString(),
//               );
//               addConditionIfTrue(
//                 boolValues[28],
//                 batchitem.salesPriceTaxable3.toString(),
//               );
//               addConditionIfTrue(
//                 boolValues[29],
//                 batchitem.salesPrice4.toString(),
//               );
//               addConditionIfTrue(
//                 boolValues[30],
//                 batchitem.salesPriceTaxable4.toString(),
//               );
//               addConditionIfTrue(
//                 boolValues[31],
//                 batchitem.salesPrice5.toString(),
//               );
//               addConditionIfTrue(
//                 boolValues[32],
//                 batchitem.salesPriceTaxable5.toString(),
//               );
//               addConditionIfTrue(
//                 boolValues[33],
//                 batchitem.salesPrice6.toString(),
//               );
//               addConditionIfTrue(
//                 boolValues[34],
//                 batchitem.salesPriceTaxable6.toString(),
//               );

//               return matchesQuery;
//             }).toList();
//         break;
//     }
//   }

//   List<String> usertable = [];

//   List<bool> getBoolValues() {
//     return tempbatchrows.map((map) => map.values.first).toList();
//   }

//   List<String> batchserach = [];
//   TableSettings temp = TableSettings(
//     fields: '',
//     headers: '',
//     ascDesc: '',
//     mandatory: '',
//   );
//   Future<void> tablesetiingsdetails() async {
//     await product_fetch_services.getfivefield(connectionString).then((value) {
//       //Fivefield el=value[0];
//       for (Fivefield el in value) {
//         Map<String, bool> tp = {el.field1 ?? "PGS_FIELD1": false};
//         tempbatchrows[3] = tp;
//         Map<String, bool> tp1 = {el.field2 ?? "PGS_FIELD2": false};
//         tempbatchrows[4] = tp1;
//         Map<String, bool> tp2 = {el.field3 ?? "PGS_FIELD3": false};
//         tempbatchrows[5] = tp2;
//         Map<String, bool> tp3 = {el.field4 ?? "PGS_FIELD4": false};
//         tempbatchrows[6] = tp3;
//         Map<String, bool> tp4 = {el.field5 ?? "PGS_FIELD5": false};
//         tempbatchrows[7] = tp4;
//       }
//     });
//     await product_fetch_services
//         .gettablesettings(sales, cust_id, connectionString)
//         .then((value) {
//           for (var ele in value) {
//             temp = ele;
//           }
//           usertable = temp.fields.split(',');
//           for (var map in tempbatchrows) {
//             for (var key in map.keys) {
//               if (usertable.contains(key)) {
//                 map[key] = true;
//               }
//             }
//           }
//         });
//   }

//   final ScrollController _horizontalController = ScrollController();
//   //final ScrollController _horizontalController2 = ScrollController();
//   //final ScrollController _verticalController = ScrollController();
//   @override
//   Widget build(BuildContext context) {
//     double pageWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       //appBar: null,
//       key: _scaffoldKey,
//       backgroundColor: const Color.fromARGB(255, 228, 233, 239),
//       body:
//           !_pageloaded
//               ? Center(
//                 child: SizedBox(
//                   width: 40,
//                   height: 40,
//                   child: CircularProgressIndicator(
//                     valueColor: AlwaysStoppedAnimation<Color>(primaryclr),
//                   ),
//                 ),
//               )
//               : Padding(
//                 padding: const EdgeInsets.all(2.0),
//                 child: SizedBox(
//                   height: MediaQuery.of(context).size.height,
//                   width: pageWidth,
//                   child: Table(
//                     border: TableBorder.all(color: Colors.black),
//                     columnWidths: {
//                       0: FlexColumnWidth(
//                         MediaQuery.of(context).size.width * 0.15,
//                       ),
//                       1: FlexColumnWidth(
//                         MediaQuery.of(context).size.width * 0.15,
//                       ),
//                       2: FlexColumnWidth(
//                         MediaQuery.of(context).size.width * 0.20,
//                       ),
//                       3: FlexColumnWidth(
//                         MediaQuery.of(context).size.width * 0.50,
//                       ),
//                     },
//                     children: [
//                       TableRow(
//                         decoration: BoxDecoration(color: primaryclr),
//                         children: [
//                           const TableCell(
//                             child: SizedBox(
//                               height: 50,
//                               child: Center(
//                                 child: Text(
//                                   "Item Type",
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const TableCell(
//                             child: SizedBox(
//                               height: 50,
//                               child: Center(
//                                 child: Text(
//                                   "Item Category",
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const TableCell(
//                             child: SizedBox(
//                               height: 50,
//                               child: Center(
//                                 child: Text(
//                                   "Item Name",
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           TableCell(
//                             child: SizedBox(
//                               height: 50,
//                               child: Center(
//                                 child: Row(
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     const Expanded(
//                                       child: Center(
//                                         child: Text(
//                                           "Item Batch",
//                                           style: TextStyle(
//                                             color: Colors.white,
//                                             fontSize: 14,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     IconButton(
//                                       tooltip: "Search",
//                                       onPressed: () {
//                                         _scaffoldKey.currentState
//                                             ?.openEndDrawer();
//                                       },
//                                       icon: SizedBox(
//                                         width: 16,
//                                         height: 16,
//                                         child: Icon(
//                                           Icons.search,
//                                           color: cardclr,
//                                         ),
//                                       ),
//                                     ),
//                                     const SizedBox(width: 15),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       TableRow(
//                         decoration: const BoxDecoration(color: Colors.white),
//                         children: [
//                           TableCell(
//                             child: Center(
//                               child: SizedBox(
//                                 height: 40,
//                                 child: TextField(
//                                   decoration: const InputDecoration(
//                                     hintText: 'Search...',
//                                     prefixIcon: Icon(Icons.search),
//                                     border: InputBorder.none,
//                                   ),
//                                   onChanged: (value) {
//                                     _filterList(value, 1);
//                                   },
//                                 ),
//                               ),
//                             ),
//                           ),
//                           TableCell(
//                             child: SizedBox(
//                               height: 40,
//                               child: Center(
//                                 child: TextField(
//                                   decoration: const InputDecoration(
//                                     hintText: 'Search...',
//                                     prefixIcon: Icon(Icons.search),
//                                     border: InputBorder.none,
//                                   ),
//                                   onChanged: (value) {
//                                     _filterList(value, 2);
//                                   },
//                                 ),
//                               ),
//                             ),
//                           ),
//                           TableCell(
//                             child: SizedBox(
//                               height: 40,
//                               child: Center(
//                                 child: TextField(
//                                   enableInteractiveSelection: false,
//                                   focusNode: _searchFocusNode,
//                                   controller: _itemsearchController,
//                                   decoration: const InputDecoration(
//                                     hintText: 'Search...',
//                                     prefixIcon: Icon(Icons.search),
//                                     border: InputBorder.none,
//                                   ),
//                                   onChanged: (value) {
//                                     _filterList(value, 3);
//                                   },
//                                 ),
//                               ),
//                             ),
//                           ),
//                           TableCell(
//                             child: SizedBox(
//                               height: 40,
//                               child: Center(
//                                 child: TextField(
//                                   decoration: const InputDecoration(
//                                     hintText: 'Search...',
//                                     prefixIcon: Icon(Icons.search),
//                                     border: InputBorder.none,
//                                   ),
//                                   onChanged: (value) {
//                                     _filterList(value, 4);
//                                   },
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       TableRow(
//                         children: [
//                           TableCell(
//                             child: Container(
//                               padding: const EdgeInsets.all(3),
//                               height: MediaQuery.of(context).size.height * 0.97,
//                               child:
//                                   !_isloded
//                                       ? Center(
//                                         child: SizedBox(
//                                           width: 40,
//                                           height: 40,
//                                           child: CircularProgressIndicator(
//                                             valueColor:
//                                                 AlwaysStoppedAnimation<Color>(
//                                                   primaryclr,
//                                                 ),
//                                           ),
//                                         ),
//                                       )
//                                       : filteredproducttype.isNotEmpty
//                                       ? Padding(
//                                         padding: const EdgeInsets.only(
//                                           bottom: 70,
//                                         ),
//                                         child: ScrollablePositionedList.builder(
//                                           itemScrollController:
//                                               _typescrollController,
//                                           itemCount: filteredproducttype.length,
//                                           itemBuilder: (
//                                             BuildContext context,
//                                             int index,
//                                           ) {
//                                             Producttypecl ptype =
//                                                 filteredproducttype[index];
//                                             return ValueListenableBuilder<
//                                               Color
//                                             >(
//                                               valueListenable:
//                                                   typecardColors[index]!,
//                                               builder: (
//                                                 context,
//                                                 typecolor,
//                                                 child,
//                                               ) {
//                                                 return Card(
//                                                   color: typecolor,
//                                                   child: SizedBox(
//                                                     height: 50,
//                                                     child: ListTile(
//                                                       contentPadding:
//                                                           const EdgeInsets.only(
//                                                             left: 2,
//                                                             right: 2,
//                                                           ),
//                                                       hoverColor: typecolor,
//                                                       splashColor:
//                                                           Colors.transparent,
//                                                       onTap: () {
//                                                         _itemsearchController
//                                                             .text = "";
//                                                         typecardColors[selctedtypecardindex]!
//                                                             .value = cardclr;
//                                                         selctedtypecardindex =
//                                                             index;
//                                                         typecardColors[index]!
//                                                                 .value =
//                                                             selectedcardclr;
//                                                         replaceProductCategories(
//                                                           ptype.catId,
//                                                         );
//                                                         _isproductloded = 0;
//                                                         productNameNotifier
//                                                             .value = [];
//                                                         _isBatchloded = 0;
//                                                         productBatchNotifier
//                                                             .value = [];
//                                                         pb.thNo = -1;
//                                                       },
//                                                       leading: ClipRRect(
//                                                         borderRadius:
//                                                             BorderRadius.circular(
//                                                               5,
//                                                             ),
//                                                         child: Image.memory(
//                                                           base64Decode(
//                                                             ptype.prodimage ??
//                                                                 imageurl,
//                                                           ),
//                                                           width: 30,
//                                                           height: 30,
//                                                           fit: BoxFit.cover,
//                                                         ),
//                                                       ),
//                                                       title: Tooltip(
//                                                         message: ptype.catType,
//                                                         child: Text(
//                                                           ptype.catType,
//                                                           style:
//                                                               const TextStyle(
//                                                                 fontSize: 14,
//                                                               ),
//                                                           overflow:
//                                                               TextOverflow
//                                                                   .ellipsis,
//                                                         ),
//                                                       ),
//                                                       trailing:
//                                                           typecolor ==
//                                                                   selectedcardclr
//                                                               ? SizedBox(
//                                                                 width: 20,
//                                                                 height: 20,
//                                                                 child: Icon(
//                                                                   Icons
//                                                                       .arrow_forward_ios,
//                                                                   color:
//                                                                       primaryclr,
//                                                                 ),
//                                                               )
//                                                               : null,
//                                                     ),
//                                                   ),
//                                                 );
//                                               },
//                                             );
//                                           },
//                                         ),
//                                       )
//                                       : const Center(
//                                         child: Text("No product types"),
//                                       ),
//                             ),
//                           ),
//                           TableCell(
//                             child: Container(
//                               padding: const EdgeInsets.all(3),
//                               height: MediaQuery.of(context).size.height * 0.97,
//                               child: ValueListenableBuilder<
//                                 List<ProductCategory>
//                               >(
//                                 valueListenable: productCategoryNotifier,
//                                 builder: (context, tempproductcategory, child) {
//                                   if (_iscategoryloded == 0) {
//                                     return const Text("");
//                                   } else {
//                                     if (_iscategoryloded == 1) {
//                                       return Center(
//                                         child: SizedBox(
//                                           width: 40,
//                                           height: 40,
//                                           child: CircularProgressIndicator(
//                                             valueColor:
//                                                 AlwaysStoppedAnimation<Color>(
//                                                   primaryclr,
//                                                 ),
//                                           ),
//                                         ),
//                                       );
//                                     } else {
//                                       if (tempproductcategory.isNotEmpty) {
//                                         return Padding(
//                                           padding: const EdgeInsets.only(
//                                             bottom: 60,
//                                           ),
//                                           child: ScrollablePositionedList.builder(
//                                             itemScrollController:
//                                                 _categorycrollController,
//                                             itemCount:
//                                                 tempproductcategory.length,
//                                             itemBuilder: (
//                                               BuildContext context,
//                                               int index,
//                                             ) {
//                                               ProductCategory pcate =
//                                                   tempproductcategory[index];
//                                               return ValueListenableBuilder<
//                                                 Color
//                                               >(
//                                                 valueListenable:
//                                                     categorycardColors[index]!,
//                                                 builder: (
//                                                   context,
//                                                   catecolor,
//                                                   child,
//                                                 ) {
//                                                   return Card(
//                                                     color: catecolor,
//                                                     child: SizedBox(
//                                                       height: 50,
//                                                       child: ListTile(
//                                                         contentPadding:
//                                                             const EdgeInsets.only(
//                                                               left: 2,
//                                                               right: 2,
//                                                             ),
//                                                         hoverColor: catecolor,
//                                                         splashColor:
//                                                             Colors.transparent,
//                                                         selectedColor:
//                                                             selectedcardclr,
//                                                         onTap: () {
//                                                           _itemsearchController
//                                                               .text = "";
//                                                           categorycardColors[categorytypecardindex]!
//                                                               .value = cardclr;
//                                                           categorytypecardindex =
//                                                               index;
//                                                           categorycardColors[index]!
//                                                                   .value =
//                                                               selectedcardclr;
//                                                           replaceProductName(
//                                                             pcate,
//                                                           );
//                                                           _isBatchloded = 0;
//                                                           productBatchNotifier
//                                                               .value = [];
//                                                           pb.thNo = -1;
//                                                         },
//                                                         leading: ClipRRect(
//                                                           borderRadius:
//                                                               BorderRadius.circular(
//                                                                 5,
//                                                               ),
//                                                           child: SizedBox(
//                                                             width: 30,
//                                                             height: 30,
//                                                             child:
//                                                                 pcate.prodImage !=
//                                                                             null &&
//                                                                         pcate
//                                                                             .prodImage!
//                                                                             .isNotEmpty
//                                                                     ? Image.memory(
//                                                                       base64Decode(
//                                                                         pcate
//                                                                             .prodImage!,
//                                                                       ),
//                                                                       fit:
//                                                                           BoxFit
//                                                                               .cover,
//                                                                     )
//                                                                     : Image.memory(
//                                                                       base64Decode(
//                                                                         imageurl,
//                                                                       ),
//                                                                       fit:
//                                                                           BoxFit
//                                                                               .cover,
//                                                                     ),
//                                                           ),
//                                                         ),
//                                                         title: Tooltip(
//                                                           message:
//                                                               pcate
//                                                                   .prodCateName,
//                                                           child: Text(
//                                                             pcate.prodCateName,
//                                                             overflow:
//                                                                 TextOverflow
//                                                                     .ellipsis,
//                                                             style:
//                                                                 const TextStyle(
//                                                                   fontSize: 14,
//                                                                 ),
//                                                           ),
//                                                         ),
//                                                         trailing:
//                                                             catecolor ==
//                                                                     selectedcardclr
//                                                                 ? Visibility(
//                                                                   visible:
//                                                                       catecolor ==
//                                                                       selectedcardclr,
//                                                                   child: SizedBox(
//                                                                     width: 20,
//                                                                     height: 20,
//                                                                     child: Icon(
//                                                                       Icons
//                                                                           .arrow_forward_ios,
//                                                                       color:
//                                                                           primaryclr,
//                                                                     ),
//                                                                   ),
//                                                                 )
//                                                                 : null,
//                                                       ),
//                                                     ),
//                                                   );
//                                                 },
//                                               );
//                                             },
//                                           ),
//                                         );
//                                       } else {
//                                         return const Center(
//                                           child: Text("No product categoryes"),
//                                         );
//                                       }
//                                     }
//                                   }
//                                 },
//                               ),
//                             ),
//                           ),
//                           TableCell(
//                             child: Container(
//                               padding: const EdgeInsets.all(3),
//                               height: MediaQuery.of(context).size.height * 0.97,
//                               child: ValueListenableBuilder<List<Product>>(
//                                 valueListenable: productNameNotifier,
//                                 builder: (context, product, child) {
//                                   if (_isproductloded == 0) {
//                                     return const Text("");
//                                   } else {
//                                     if (_isproductloded == 1) {
//                                       return Center(
//                                         child: SizedBox(
//                                           width: 40,
//                                           height: 40,
//                                           child: CircularProgressIndicator(
//                                             valueColor:
//                                                 AlwaysStoppedAnimation<Color>(
//                                                   primaryclr,
//                                                 ),
//                                           ),
//                                         ),
//                                       );
//                                     } else {
//                                       if (product.isNotEmpty) {
//                                         return Padding(
//                                           padding: const EdgeInsets.only(
//                                             bottom: 60,
//                                           ),
//                                           child: ScrollablePositionedList.builder(
//                                             itemScrollController:
//                                                 _itemcrollController,
//                                             itemCount: product.length,
//                                             itemBuilder: (
//                                               BuildContext context,
//                                               int index,
//                                             ) {
//                                               Product prod = product[index];
//                                               return ValueListenableBuilder<
//                                                 Color
//                                               >(
//                                                 valueListenable:
//                                                     namecardColors[index]!,
//                                                 builder: (
//                                                   context,
//                                                   namecolor,
//                                                   child,
//                                                 ) {
//                                                   return Card(
//                                                     color: namecolor,
//                                                     child: SizedBox(
//                                                       height: 50,
//                                                       child: GestureDetector(
//                                                         onDoubleTap: () {
//                                                           pb.thNo = -1;
//                                                           namecardColors[nametypecardindex]
//                                                               ?.value = cardclr;
//                                                           nametypecardindex =
//                                                               index;
//                                                           namecardColors[index]
//                                                                   ?.value =
//                                                               selectedcardclr;
//                                                           replaceBatchName(
//                                                             prod.prodId,
//                                                           );
//                                                           pb = productbatch[0];
//                                                           okbuttonftn();
//                                                         },
//                                                         child: ListTile(
//                                                           minLeadingWidth: 0,
//                                                           contentPadding:
//                                                               const EdgeInsets.symmetric(
//                                                                 horizontal: 2,
//                                                               ),
//                                                           hoverColor: namecolor,
//                                                           splashColor:
//                                                               Colors
//                                                                   .transparent,
//                                                           onTap: () {
//                                                             pb.thNo = -1;
//                                                             namecardColors[nametypecardindex]
//                                                                     ?.value =
//                                                                 cardclr;
//                                                             nametypecardindex =
//                                                                 index;
//                                                             namecardColors[index]
//                                                                     ?.value =
//                                                                 selectedcardclr;
//                                                             replaceBatchName(
//                                                               prod.prodId,
//                                                             );
//                                                           },
//                                                           leading: ClipRRect(
//                                                             borderRadius:
//                                                                 BorderRadius.circular(
//                                                                   5,
//                                                                 ),
//                                                             child: SizedBox(
//                                                               width: 30,
//                                                               height: 30,
//                                                               child: Image.memory(
//                                                                 base64Decode(
//                                                                   prod.prodImage?.isNotEmpty ??
//                                                                           false
//                                                                       ? prod
//                                                                           .prodImage!
//                                                                       : imageurl,
//                                                                 ),
//                                                                 fit:
//                                                                     BoxFit
//                                                                         .cover,
//                                                               ),
//                                                             ),
//                                                           ),
//                                                           title: Tooltip(
//                                                             message:
//                                                                 prod.prodName,
//                                                             child: Text(
//                                                               prod.prodName,
//                                                               overflow:
//                                                                   TextOverflow
//                                                                       .ellipsis,
//                                                               style:
//                                                                   const TextStyle(
//                                                                     fontSize:
//                                                                         14,
//                                                                   ),
//                                                             ),
//                                                           ),
//                                                           trailing:
//                                                               namecolor ==
//                                                                       selectedcardclr
//                                                                   ? Icon(
//                                                                     Icons
//                                                                         .arrow_forward_ios,
//                                                                     size: 20,
//                                                                     color:
//                                                                         primaryclr,
//                                                                   )
//                                                                   : null,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   );
//                                                 },
//                                               );
//                                             },
//                                           ),
//                                         );
//                                       } else {
//                                         return Center(
//                                           child: Text(
//                                             "No product name ${_itemsearchController.text}",
//                                           ),
//                                         );
//                                       }
//                                     }
//                                   }
//                                 },
//                               ),
//                             ),
//                           ),
//                           TableCell(
//                             child: Scrollbar(
//                               controller: _horizontalController,
//                               thumbVisibility: true,
//                               child: SingleChildScrollView(
//                                 scrollDirection: Axis.horizontal,
//                                 controller: _horizontalController,
//                                 child: Container(
//                                   //width: MediaQuery.of(context).size.width * 2.35,
//                                   padding: const EdgeInsets.all(3),
//                                   child: ValueListenableBuilder<
//                                     List<ProductItems>
//                                   >(
//                                     valueListenable: productBatchNotifier,
//                                     builder: (context, productBatch, child) {
//                                       if (_isBatchloded == 0) {
//                                         return const Text("");
//                                       } else {
//                                         if (_isBatchloded == 1) {
//                                           return Center(
//                                             child: SizedBox(
//                                               width: 40,
//                                               height: 40,
//                                               child: CircularProgressIndicator(
//                                                 valueColor:
//                                                     AlwaysStoppedAnimation<
//                                                       Color
//                                                     >(primaryclr),
//                                               ),
//                                             ),
//                                           );
//                                         } else {
//                                           if (productBatch.isNotEmpty) {
//                                             return ValueListenableBuilder<
//                                               List<Map<String, bool>>
//                                             >(
//                                               valueListenable: batchtablerows,
//                                               builder: (
//                                                 context,
//                                                 visibleColumnsConfig,
//                                                 child,
//                                               ) {
//                                                 bool _notruesinlistcase = false;
//                                                 for (var elem
//                                                     in tempbatchrows) {
//                                                   if (elem.values.first) {
//                                                     _notruesinlistcase = true;
//                                                   }
//                                                 }
//                                                 final visibleColumns =
//                                                     visibleColumnsConfig
//                                                         .where(
//                                                           (column) =>
//                                                               column
//                                                                   .values
//                                                                   .first,
//                                                         )
//                                                         .toList();
//                                                 return _notruesinlistcase
//                                                     ? DataTable(
//                                                       headingRowHeight: 30,
//                                                       dataRowHeight: 30,
//                                                       headingRowColor:
//                                                           WidgetStateColor.resolveWith(
//                                                             (states) =>
//                                                                 primaryclr,
//                                                           ),
//                                                       border: TableBorder.all(
//                                                         width: 1,
//                                                       ),
//                                                       columns:
//                                                           visibleColumns
//                                                               .map(
//                                                                 (
//                                                                   column,
//                                                                 ) => DataColumn(
//                                                                   label: Expanded(
//                                                                     child: Text(
//                                                                       column
//                                                                           .keys
//                                                                           .first,
//                                                                       style: const TextStyle(
//                                                                         color:
//                                                                             Colors.white,
//                                                                         fontSize:
//                                                                             14,
//                                                                       ),
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                               )
//                                                               .toList(),
//                                                       rows:
//                                                           productBatch.map((
//                                                             pbatch,
//                                                           ) {
//                                                             bool selec = false;
//                                                             if (pb.thNo ==
//                                                                 pbatch.thNo) {
//                                                               selec = true;
//                                                             }
//                                                             return DataRow(
//                                                               selected: selec,
//                                                               color:
//                                                                   selec
//                                                                       ? WidgetStateColor.resolveWith(
//                                                                         (
//                                                                           states,
//                                                                         ) =>
//                                                                             selectedcardclr,
//                                                                       )
//                                                                       : WidgetStateColor.resolveWith(
//                                                                         (
//                                                                           states,
//                                                                         ) =>
//                                                                             cardclr,
//                                                                       ),
//                                                               cells:
//                                                                   visibleColumns.map((
//                                                                     column,
//                                                                   ) {
//                                                                     String key =
//                                                                         column
//                                                                             .keys
//                                                                             .first;
//                                                                     String
//                                                                     cellValue;
//                                                                     Map<
//                                                                       String,
//                                                                       String
//                                                                     >
//                                                                     keyToFieldMap = {
//                                                                       tempbatchrows[0]
//                                                                           .keys
//                                                                           .first: (pbatch.id.toString().toLowerCase() !=
//                                                                                       "null" &&
//                                                                                   pbatch.id.toString().isNotEmpty ==
//                                                                                       true
//                                                                               ? pbatch.id.toString()
//                                                                               : "-"),
//                                                                       tempbatchrows[1]
//                                                                           .keys
//                                                                           .first: (pbatch.code?.toString().toLowerCase() !=
//                                                                                       "null" &&
//                                                                                   pbatch.code?.toString().isNotEmpty ==
//                                                                                       true
//                                                                               ? pbatch.code.toString()
//                                                                               : "-"),
//                                                                       tempbatchrows[2]
//                                                                           .keys
//                                                                           .first: (pbatch.barcode?.toString().toLowerCase() !=
//                                                                                       "null" &&
//                                                                                   pbatch.barcode?.toString().isNotEmpty ==
//                                                                                       true
//                                                                               ? pbatch.barcode.toString()
//                                                                               : "-"),
//                                                                       tempbatchrows[3]
//                                                                           .keys
//                                                                           .first: (pbatch.prodField1?.toLowerCase() !=
//                                                                                       "null" &&
//                                                                                   pbatch.prodField1?.isNotEmpty ==
//                                                                                       true
//                                                                               ? pbatch.prodField1!
//                                                                               : "-"),
//                                                                       tempbatchrows[4]
//                                                                           .keys
//                                                                           .first: (pbatch.prodField2?.toLowerCase() !=
//                                                                                       "null" &&
//                                                                                   pbatch.prodField2?.isNotEmpty ==
//                                                                                       true
//                                                                               ? pbatch.prodField2!
//                                                                               : "-"),
//                                                                       tempbatchrows[5]
//                                                                           .keys
//                                                                           .first: (pbatch.prodField3?.toLowerCase() !=
//                                                                                       "null" &&
//                                                                                   pbatch.prodField3?.isNotEmpty ==
//                                                                                       true
//                                                                               ? pbatch.prodField3!
//                                                                               : "-"),
//                                                                       tempbatchrows[6]
//                                                                           .keys
//                                                                           .first: (pbatch.prodField4?.toLowerCase() !=
//                                                                                       "null" &&
//                                                                                   pbatch.prodField4?.isNotEmpty ==
//                                                                                       true
//                                                                               ? pbatch.prodField4!
//                                                                               : "-"),
//                                                                       tempbatchrows[7]
//                                                                           .keys
//                                                                           .first: (pbatch.prodField5?.toLowerCase() !=
//                                                                                       "null" &&
//                                                                                   pbatch.prodField5?.isNotEmpty ==
//                                                                                       true
//                                                                               ? pbatch.prodField5!
//                                                                               : "-"),
//                                                                       tempbatchrows[8]
//                                                                           .keys
//                                                                           .first: (pbatch.description?.toString().toLowerCase() !=
//                                                                                       "null" &&
//                                                                                   pbatch.description?.toString().isNotEmpty ==
//                                                                                       true
//                                                                               ? pbatch.description.toString()
//                                                                               : "-"),
//                                                                       tempbatchrows[9]
//                                                                           .keys
//                                                                           .first: (pbatch.categoryId.toString().toLowerCase() !=
//                                                                                       "null" &&
//                                                                                   pbatch.categoryId.toString().isNotEmpty ==
//                                                                                       true
//                                                                               ? pbatch.categoryId.toString()
//                                                                               : "-"),
//                                                                       tempbatchrows[10]
//                                                                           .keys
//                                                                           .first: (pbatch.typeId.toString().toLowerCase() !=
//                                                                                       "null" &&
//                                                                                   pbatch.typeId.toString().isNotEmpty ==
//                                                                                       true
//                                                                               ? pbatch.typeId.toString()
//                                                                               : "-"),
//                                                                       tempbatchrows[11]
//                                                                           .keys
//                                                                           .first: (pbatch.brand?.toLowerCase() !=
//                                                                                       "null" &&
//                                                                                   pbatch.brand?.isNotEmpty ==
//                                                                                       true
//                                                                               ? pbatch.brand!
//                                                                               : "-"),
//                                                                       tempbatchrows[12]
//                                                                           .keys
//                                                                           .first: (pbatch.supplier?.toLowerCase() !=
//                                                                                       "null" &&
//                                                                                   pbatch.supplier?.isNotEmpty ==
//                                                                                       true
//                                                                               ? pbatch.supplier!
//                                                                               : "-"),
//                                                                       tempbatchrows[13]
//                                                                           .keys
//                                                                           .first: (pbatch.alias?.toLowerCase() !=
//                                                                                       "null" &&
//                                                                                   pbatch.alias?.isNotEmpty ==
//                                                                                       true
//                                                                               ? pbatch.alias!
//                                                                               : "-"),
//                                                                       tempbatchrows[14]
//                                                                           .keys
//                                                                           .first: (pbatch.stock?.toString().toLowerCase() !=
//                                                                                       "null" &&
//                                                                                   pbatch.stock?.toString().isNotEmpty ==
//                                                                                       true
//                                                                               ? pbatch.stock.toString()
//                                                                               : "-"),
//                                                                       tempbatchrows[15]
//                                                                           .keys
//                                                                           .first: (pbatch.unit?.toLowerCase() !=
//                                                                                       "null" &&
//                                                                                   pbatch.unit?.isNotEmpty ==
//                                                                                       true
//                                                                               ? pbatch.unit!
//                                                                               : "-"),
//                                                                       tempbatchrows[16]
//                                                                           .keys
//                                                                           .first: (pbatch.secunit?.toLowerCase() !=
//                                                                                       "null" &&
//                                                                                   pbatch.secunit?.isNotEmpty ==
//                                                                                       true
//                                                                               ? pbatch.secunit!
//                                                                               : "-"),
//                                                                       tempbatchrows[17]
//                                                                           .keys
//                                                                           .first: (pbatch.expiryDate !=
//                                                                                   null
//                                                                               ? pbatch.expiryDate!.toIso8601String()
//                                                                               : "-"),
//                                                                       tempbatchrows[18]
//                                                                           .keys
//                                                                           .first: (pbatch.tax?.toString().toLowerCase() !=
//                                                                                       "null" &&
//                                                                                   pbatch.tax?.toString().isNotEmpty ==
//                                                                                       true
//                                                                               ? pbatch.tax.toString()
//                                                                               : "-"),
//                                                                       tempbatchrows[19]
//                                                                           .keys
//                                                                           .first: (pbatch.purchaseRate?.toString().toLowerCase() !=
//                                                                                       "null" &&
//                                                                                   pbatch.purchaseRate?.toString().isNotEmpty ==
//                                                                                       true
//                                                                               ? pbatch.purchaseRate.toString()
//                                                                               : "-"),
//                                                                       tempbatchrows[20]
//                                                                           .keys
//                                                                           .first: (pbatch.cost?.toString().toLowerCase() !=
//                                                                                       "null" &&
//                                                                                   pbatch.cost?.toString().isNotEmpty ==
//                                                                                       true
//                                                                               ? pbatch.cost.toString()
//                                                                               : "-"),
//                                                                       tempbatchrows[21]
//                                                                           .keys
//                                                                           .first: (pbatch.minMrp?.toString().toLowerCase() !=
//                                                                                       "null" &&
//                                                                                   pbatch.minMrp?.toString().isNotEmpty ==
//                                                                                       true
//                                                                               ? pbatch.minMrp.toString()
//                                                                               : "-"),
//                                                                       tempbatchrows[22]
//                                                                           .keys
//                                                                           .first: (pbatch.mrp?.toString().toLowerCase() !=
//                                                                                       "null" &&
//                                                                                   pbatch.mrp?.toString().isNotEmpty ==
//                                                                                       true
//                                                                               ? pbatch.mrp.toString()
//                                                                               : "-"),
//                                                                       tempbatchrows[23]
//                                                                           .keys
//                                                                           .first: (pbatch.salesPrice1?.toString().toLowerCase() !=
//                                                                                       "null" &&
//                                                                                   pbatch.salesPrice1?.toString().isNotEmpty ==
//                                                                                       true
//                                                                               ? pbatch.salesPrice1.toString()
//                                                                               : "-"),
//                                                                       tempbatchrows[24]
//                                                                           .keys
//                                                                           .first: (pbatch.salesPriceTaxable1?.toString().toLowerCase() !=
//                                                                                       "null" &&
//                                                                                   pbatch.salesPriceTaxable1?.toString().isNotEmpty ==
//                                                                                       true
//                                                                               ? pbatch.salesPriceTaxable1.toString()
//                                                                               : "-"),
//                                                                       tempbatchrows[25]
//                                                                           .keys
//                                                                           .first: (pbatch.salesPrice2?.toString().toLowerCase() !=
//                                                                                       "null" &&
//                                                                                   pbatch.salesPrice2?.toString().isNotEmpty ==
//                                                                                       true
//                                                                               ? pbatch.salesPrice2.toString()
//                                                                               : "-"),
//                                                                       tempbatchrows[26]
//                                                                           .keys
//                                                                           .first: (pbatch.salesPriceTaxable2?.toString().toLowerCase() !=
//                                                                                       "null" &&
//                                                                                   pbatch.salesPriceTaxable2?.toString().isNotEmpty ==
//                                                                                       true
//                                                                               ? pbatch.salesPriceTaxable2.toString()
//                                                                               : "-"),
//                                                                       tempbatchrows[27]
//                                                                           .keys
//                                                                           .first: (pbatch.salesPrice3?.toString().toLowerCase() !=
//                                                                                       "null" &&
//                                                                                   pbatch.salesPrice3?.toString().isNotEmpty ==
//                                                                                       true
//                                                                               ? pbatch.salesPrice3.toString()
//                                                                               : "-"),
//                                                                       tempbatchrows[28]
//                                                                           .keys
//                                                                           .first: (pbatch.salesPriceTaxable3?.toString().toLowerCase() !=
//                                                                                       "null" &&
//                                                                                   pbatch.salesPriceTaxable3?.toString().isNotEmpty ==
//                                                                                       true
//                                                                               ? pbatch.salesPriceTaxable3.toString()
//                                                                               : "-"),
//                                                                       tempbatchrows[29]
//                                                                           .keys
//                                                                           .first: (pbatch.salesPrice4?.toString().toLowerCase() !=
//                                                                                       "null" &&
//                                                                                   pbatch.salesPrice4?.toString().isNotEmpty ==
//                                                                                       true
//                                                                               ? pbatch.salesPrice4.toString()
//                                                                               : "-"),
//                                                                       tempbatchrows[30]
//                                                                           .keys
//                                                                           .first: (pbatch.salesPriceTaxable4?.toString().toLowerCase() !=
//                                                                                       "null" &&
//                                                                                   pbatch.salesPriceTaxable4?.toString().isNotEmpty ==
//                                                                                       true
//                                                                               ? pbatch.salesPriceTaxable4.toString()
//                                                                               : "-"),
//                                                                       tempbatchrows[31]
//                                                                           .keys
//                                                                           .first: (pbatch.salesPrice5?.toString().toLowerCase() !=
//                                                                                       "null" &&
//                                                                                   pbatch.salesPrice5?.toString().isNotEmpty ==
//                                                                                       true
//                                                                               ? pbatch.salesPrice5.toString()
//                                                                               : "-"),
//                                                                       tempbatchrows[32]
//                                                                           .keys
//                                                                           .first: (pbatch.salesPriceTaxable5?.toString().toLowerCase() !=
//                                                                                       "null" &&
//                                                                                   pbatch.salesPriceTaxable5?.toString().isNotEmpty ==
//                                                                                       true
//                                                                               ? pbatch.salesPriceTaxable5.toString()
//                                                                               : "-"),
//                                                                       tempbatchrows[33]
//                                                                           .keys
//                                                                           .first: (pbatch.salesPrice6?.toString().toLowerCase() !=
//                                                                                       "null" &&
//                                                                                   pbatch.salesPrice6?.toString().isNotEmpty ==
//                                                                                       true
//                                                                               ? pbatch.salesPrice6.toString()
//                                                                               : "-"),
//                                                                       tempbatchrows[34]
//                                                                           .keys
//                                                                           .first: (pbatch.salesPriceTaxable6?.toString().toLowerCase() !=
//                                                                                       "null" &&
//                                                                                   pbatch.salesPriceTaxable6?.toString().isNotEmpty ==
//                                                                                       true
//                                                                               ? pbatch.salesPriceTaxable6.toString()
//                                                                               : "-"),
//                                                                     };

//                                                                     cellValue =
//                                                                         keyToFieldMap[key] ??
//                                                                         "-";
//                                                                     return DataCell(
//                                                                       Center(
//                                                                         child: Text(
//                                                                           cellValue,
//                                                                           style: const TextStyle(
//                                                                             fontSize:
//                                                                                 14,
//                                                                           ),
//                                                                           textAlign:
//                                                                               TextAlign.center,
//                                                                         ),
//                                                                       ),
//                                                                       onTap: () {
//                                                                         selec =
//                                                                             true;
//                                                                         pb =
//                                                                             pbatch;
//                                                                         productBatchNotifier.value =
//                                                                             [];
//                                                                         productBatchNotifier.value =
//                                                                             productbatch;
//                                                                       },
//                                                                       onDoubleTap: () {
//                                                                         selec =
//                                                                             true;
//                                                                         pb =
//                                                                             pbatch;
//                                                                         productBatchNotifier.value =
//                                                                             [];
//                                                                         productBatchNotifier.value =
//                                                                             productbatch;

//                                                                         okbuttonftn();
//                                                                       },
//                                                                     );
//                                                                   }).toList(),
//                                                             );
//                                                           }).toList(),
//                                                     )
//                                                     : const Center(
//                                                       child: Text(
//                                                         "Change table settings to view batch details",
//                                                       ),
//                                                     );
//                                               },
//                                             );
//                                           } else {
//                                             return const Center(
//                                               child: Text(
//                                                 "No batch's",
//                                                 textAlign: TextAlign.center,
//                                               ),
//                                             );
//                                           }
//                                         }
//                                       }
//                                     },
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//       endDrawer: Drawer(
//         backgroundColor: const Color.fromARGB(255, 228, 233, 239),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               TextField(
//                 controller: _searchController,
//                 decoration: InputDecoration(
//                   hintText: 'Search...',
//                   border: const OutlineInputBorder(),
//                   prefixIcon: const Icon(Icons.search),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: primaryclr, width: 2.0),
//                   ),
//                 ),
//                 focusNode: _focusNode,
//                 onChanged: (value) {
//                   _filterList(value, 5);
//                 },
//               ),
//               const SizedBox(height: 20),
//               ValueListenableBuilder<List<ProductItems>>(
//                 valueListenable: filterbatchandname,
//                 builder: (context, list, child) {
//                   List<String> mainserach = [];
//                   for (var batchitem in list) {
//                     List<String> tempstring = [];
//                     List<bool> boolValues = getBoolValues();
//                     void addValueIfTrue(bool condition, String value) {
//                       if (condition && value.isNotEmpty) {
//                         if (value.toLowerCase() != "null") {
//                           tempstring.add(value);
//                         }
//                       }
//                     }

//                     addValueIfTrue(boolValues[0], batchitem.id.toString());
//                     addValueIfTrue(true, batchitem.name.toString());
//                     addValueIfTrue(boolValues[1], batchitem.code.toString());
//                     addValueIfTrue(boolValues[2], batchitem.barcode.toString());
//                     addValueIfTrue(
//                       boolValues[3],
//                       batchitem.prodField1.toString(),
//                     );
//                     addValueIfTrue(
//                       boolValues[4],
//                       batchitem.prodField2.toString(),
//                     );
//                     addValueIfTrue(
//                       boolValues[5],
//                       batchitem.prodField3.toString(),
//                     );
//                     addValueIfTrue(
//                       boolValues[6],
//                       batchitem.prodField4.toString(),
//                     );
//                     addValueIfTrue(
//                       boolValues[7],
//                       batchitem.prodField5.toString(),
//                     );
//                     addValueIfTrue(
//                       boolValues[8],
//                       batchitem.description.toString(),
//                     );
//                     addValueIfTrue(
//                       boolValues[9],
//                       batchitem.categoryId.toString(),
//                     );
//                     addValueIfTrue(boolValues[10], batchitem.typeId.toString());
//                     addValueIfTrue(boolValues[11], batchitem.brand.toString());
//                     addValueIfTrue(
//                       boolValues[12],
//                       batchitem.supplier.toString(),
//                     );
//                     addValueIfTrue(boolValues[13], batchitem.alias.toString());
//                     addValueIfTrue(boolValues[14], batchitem.stock.toString());
//                     addValueIfTrue(boolValues[15], batchitem.unit.toString());
//                     addValueIfTrue(
//                       boolValues[16],
//                       batchitem.secunit.toString(),
//                     );
//                     addValueIfTrue(
//                       boolValues[17],
//                       batchitem.expiryDate.toString(),
//                     );
//                     addValueIfTrue(boolValues[18], batchitem.tax.toString());
//                     addValueIfTrue(
//                       boolValues[19],
//                       batchitem.purchaseRate.toString(),
//                     );
//                     addValueIfTrue(boolValues[20], batchitem.cost.toString());
//                     addValueIfTrue(boolValues[21], batchitem.minMrp.toString());
//                     addValueIfTrue(boolValues[22], batchitem.mrp.toString());
//                     addValueIfTrue(
//                       boolValues[23],
//                       batchitem.salesPrice1.toString(),
//                     );
//                     addValueIfTrue(
//                       boolValues[24],
//                       batchitem.salesPriceTaxable1.toString(),
//                     );
//                     addValueIfTrue(
//                       boolValues[25],
//                       batchitem.salesPrice2.toString(),
//                     );
//                     addValueIfTrue(
//                       boolValues[26],
//                       batchitem.salesPriceTaxable2.toString(),
//                     );
//                     addValueIfTrue(
//                       boolValues[27],
//                       batchitem.salesPrice3.toString(),
//                     );
//                     addValueIfTrue(
//                       boolValues[28],
//                       batchitem.salesPriceTaxable3.toString(),
//                     );
//                     addValueIfTrue(
//                       boolValues[29],
//                       batchitem.salesPrice4.toString(),
//                     );
//                     addValueIfTrue(
//                       boolValues[30],
//                       batchitem.salesPriceTaxable4.toString(),
//                     );
//                     addValueIfTrue(
//                       boolValues[31],
//                       batchitem.salesPrice5.toString(),
//                     );
//                     addValueIfTrue(
//                       boolValues[32],
//                       batchitem.salesPriceTaxable5.toString(),
//                     );
//                     addValueIfTrue(
//                       boolValues[33],
//                       batchitem.salesPrice6.toString(),
//                     );
//                     addValueIfTrue(
//                       boolValues[34],
//                       batchitem.salesPriceTaxable6.toString(),
//                     );

//                     String tempstringtoadd = tempstring.join(";");
//                     mainserach.add(tempstringtoadd);
//                   }
//                   return Expanded(
//                     child: ListView.builder(
//                       itemCount: list.length,
//                       itemBuilder: (context, index) {
//                         //tablesetiingsdetails();
//                         final item = list[index];
//                         String tempst = mainserach[index];
//                         return Card(
//                           child: ListTile(
//                             tileColor: primaryclr,
//                             title: Text(
//                               tempst,
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 14,
//                               ),
//                             ),
//                             onTap: () async {
//                               Navigator.pop(context);
//                               if (producttypeli.isNotEmpty) {
//                                 typecardColors[selctedtypecardindex]!.value =
//                                     cardclr;
//                                 if (productcategory.isNotEmpty) {
//                                   categorycardColors[categorytypecardindex]!
//                                       .value = cardclr;
//                                   if (productbatch.isNotEmpty) {
//                                     namecardColors[nametypecardindex]!.value =
//                                         cardclr;
//                                   }
//                                 }
//                               }
//                               int i = -1;
//                               for (var ele in producttypeli) {
//                                 i++;
//                                 if (ele.catId == item.typeId) {
//                                   //print(item.catType);
//                                   selctedtypecardindex = i;
//                                   typecardColors[selctedtypecardindex]!.value =
//                                       selectedcardclr;
//                                   _typescrollController.scrollTo(
//                                     index: i,
//                                     duration: const Duration(milliseconds: 100),
//                                     curve: Curves.easeInOut,
//                                   );
//                                   await replaceProductCategories(
//                                     ele.catId,
//                                   ).then((va) async {
//                                     //catgoryforloop
//                                     int c = -1;
//                                     for (var cat in productcategory) {
//                                       c++;
//                                       if (cat.prodCateId == item.categoryId) {
//                                         categorytypecardindex = c;
//                                         categorycardColors[categorytypecardindex]!
//                                             .value = selectedcardclr;
//                                         _categorycrollController.scrollTo(
//                                           index: c,
//                                           duration: const Duration(
//                                             milliseconds: 100,
//                                           ),
//                                           curve: Curves.easeInOut,
//                                         );
//                                         await replaceProductName(cat).then((
//                                           vale,
//                                         ) async {
//                                           int n = -1;
//                                           for (var prod in product) {
//                                             n++;
//                                             if (item.id == prod.prodId) {
//                                               nametypecardindex = n;
//                                               namecardColors[nametypecardindex]!
//                                                   .value = selectedcardclr;
//                                               _itemcrollController.scrollTo(
//                                                 index: n,
//                                                 duration: const Duration(
//                                                   milliseconds: 100,
//                                                 ),
//                                                 curve: Curves.easeInOut,
//                                               );
//                                               await replaceBatchName(
//                                                 prod.prodId,
//                                               ).then((vaa) {
//                                                 for (var bat in productbatch) {
//                                                   if (productbatch.length ==
//                                                       1) {
//                                                     pb = bat;
//                                                   } else {
//                                                     if (bat.id == item.id &&
//                                                         bat.thNo == item.thNo) {
//                                                       pb = bat;
//                                                     }
//                                                   }
//                                                 }
//                                               });
//                                               productBatchNotifier.value = [];
//                                               productBatchNotifier.value =
//                                                   productbatch;
//                                             }
//                                           }
//                                         });
//                                       }
//                                     }
//                                   });
//                                 }
//                               }
//                               //productbatchupdate
//                               pb = item;
//                               // productbatch = [];
//                               // productbatch.add(pb);
//                               // _isBatchloded = 2;
//                               // if (productbatch.isNotEmpty) {
//                               //   productBatchNotifier.value = productbatch;
//                               // }
//                             },
//                           ),
//                         );
//                       },
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: Stack(
//         children: [
//           ValueListenableBuilder<List<ProductItems>>(
//             valueListenable: productBatchNotifier,
//             builder: (context, productbatch, child) {
//               return Visibility(
//                 visible: productbatch.isNotEmpty,
//                 child: Align(
//                   alignment: Alignment.bottomRight,
//                   child: SizedBox(
//                     width: MediaQuery.of(context).size.width * .10,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         okbuttonftn();
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color.fromARGB(255, 12, 22, 55),
//                         foregroundColor: Colors.white,
//                         shape: const RoundedRectangleBorder(
//                           borderRadius: BorderRadius.zero,
//                         ),
//                       ),
//                       child: const Text("Ok"),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   void okbuttonftn() {
//     if (pb.thNo != -1) {
//       Selectedbatch selecetedb = Selectedbatch(thProdId: pb.id, thNo: pb.thNo);
//       String jsonselected = selectedbatchToJson(selecetedb);

//       List<Map<String, String>> mapdata = [
//         {"TH_PROD_ID": "${pb.id}", "TH_NO": "${pb.thNo}"},
//       ];
//       //product_fetch_services.notifyWinFormsToClose(widget.popupId);
//       product_fetch_services.sendDataToWinForms(mapdata, widget.popupId);
//     } else {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.zero,
//             ),
//             backgroundColor: primaryclr,
//             title: const Text(
//               'Select a batch',
//               style: TextStyle(color: Colors.white),
//             ),
//             content: const Text(
//               'You have to select a batch to go farther',
//               style: TextStyle(color: Colors.white),
//             ),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: const Text('Ok', style: TextStyle(color: Colors.white)),
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }

//   // @override
//   // void dispose() {
//   //   typecardColors.forEach((key, value) => value.dispose());
//   //   categorycardColors.forEach((key, value) => value.dispose());
//   //   namecardColors.forEach((key, value) => value.dispose());
//   //   productCategoryNotifier.dispose();
//   //   productNameNotifier.dispose();
//   //   productBatchNotifier.dispose();
//   //   super.dispose();
//   // }
// }
