// // To parse this JSON data, do
// //
// //     final producttypecl = producttypeclFromJson(jsonString);

// import 'dart:convert';

// List<Producttypecl> producttypeclFromJson(String str) =>
//     List<Producttypecl>.from(
//         json.decode(str).map((x) => Producttypecl.fromJson(x)));

// String producttypeclToJson(List<Producttypecl> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Producttypecl {
//   int catId;
//   String catType;
//   dynamic prodimage;
//   //Color? typecardclr;

//   Producttypecl({
//     required this.catId,
//     required this.catType,
//     this.prodimage,
//     //this.typecardclr,
//   });

//   factory Producttypecl.fromJson(Map<String, dynamic> json) => Producttypecl(
//         catId: json["CAT_ID"],
//         catType: json["CAT_TYPE"],
//         prodimage: json["PRODIMAGE"],
//       );

//   Map<String, dynamic> toJson() => {
//         "CAT_ID": catId,
//         "CAT_TYPE": catType,
//         "PRODIMAGE": prodimage,
//       };
// }

// // To parse this JSON data, do
// //
// //     final productCategory = productCategoryFromJson(jsonString);

// List<ProductCategory> productCategoryFromJson(String str) =>
//     List<ProductCategory>.from(
//         json.decode(str).map((x) => ProductCategory.fromJson(x)));

// String productCategoryToJson(List<ProductCategory> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class ProductCategory {
//   int prodCateId;
//   String prodCateName;
//   String? prodImage;
//   int prodCatType;

//   ProductCategory({
//     required this.prodCateId,
//     required this.prodCateName,
//     this.prodImage,
//     required this.prodCatType,
//   });

//   factory ProductCategory.fromJson(Map<String, dynamic> json) =>
//       ProductCategory(
//         prodCateId: json["PROD_CATE_ID"],
//         prodCateName: json["PROD_CATE_NAME"],
//         prodImage: json["PROD_IMAGE"],
//         prodCatType: json["PROD_CAT_TYPE"],
//       );

//   Map<String, dynamic> toJson() => {
//         "PROD_CATE_ID": prodCateId,
//         "PROD_CATE_NAME": prodCateName,
//         "PROD_IMAGE": prodImage,
//         "PROD_CAT_TYPE": prodCatType,
//       };
// }

// // To parse this JSON data, do
// //
// //     final product = productFromJson(jsonString);

// List<Product> productFromJson(String str) =>
//     List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

// String productToJson(List<Product> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Product {
//   int prodId;
//   String prodName;
//   dynamic prodImage;

//   Product({
//     required this.prodId,
//     required this.prodName,
//     this.prodImage,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//         prodId: json["PROD_ID"],
//         prodName: json["PROD_NAME"],
//         prodImage: json["PROD_IMAGE"],
//       );

//   Map<String, dynamic> toJson() => {
//         "PROD_ID": prodId,
//         "PROD_NAME": prodName,
//         "PROD_IMAGE": prodImage,
//       };
// }
// // // To parse this JSON data, do
// // //
// // //     final productBatch = productBatchFromJson(jsonString);

// // List<ProductBatch> productBatchFromJson(String str) => List<ProductBatch>.from(
// //     json.decode(str).map((x) => ProductBatch.fromJson(x)));

// // String productBatchToJson(List<ProductBatch> data) =>
// //     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// // class ProductBatch {
// //   int thProdId;
// //   int thNo;
// //   String? prodBrCode;
// //   double prodMrp;
// //   double prodTotalSalesPrice;
// //   String? expiryDate;

// //   ProductBatch({
// //     required this.thProdId,
// //     required this.thNo,
// //     required this.prodBrCode,
// //     required this.prodMrp,
// //     required this.prodTotalSalesPrice,
// //     this.expiryDate,
// //   });

// //   factory ProductBatch.fromJson(Map<String, dynamic> json) => ProductBatch(
// //         thProdId: json["TH_PROD_ID"],
// //         thNo: json["TH_NO"],
// //         prodBrCode: json["PROD_BR_CODE"],
// //         prodMrp: json["PROD_MRP"],
// //         prodTotalSalesPrice: json["PROD_TOTAL_SALES_PRICE"],
// //         expiryDate: json["EXPIRY_DATE"],
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "TH_PROD_ID": thProdId,
// //         "TH_NO": thNo,
// //         "PROD_BR_CODE": prodBrCode,
// //         "PROD_MRP": prodMrp,
// //         "PROD_TOTAL_SALES_PRICE": prodTotalSalesPrice,
// //         "EXPIRY_DATE": expiryDate
// //       };
// // }

// class KeyValuePair {
//   String key;
//   String value;
//   KeyValuePair(this.key, this.value);
//   Map<String, dynamic> toJson() => {
//         'key': key,
//         'value': value,
//       };
// }
// // To parse this JSON data, do
// //
// //     final productItems = productItemsFromJson(jsonString);


// List<ProductItems> productItemsFromJson(String str) => List<ProductItems>.from(json.decode(str).map((x) => ProductItems.fromJson(x)));

// String productItemsToJson(List<ProductItems> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class ProductItems {
//     int slNo;
//     int id;
//     String name;
//     String? code;
//     String? barcode;
//     String? prodField1;
//     String? prodField2;
//     String? prodField3;
//     String? prodField4;
//     String? prodField5;
//     String? description;
//     int? categoryId;
//     int? typeId;
//     String? brand;
//     String? supplier;
//     String? alias;
//     double? stock;
//     String? unit;
//     String? secunit;
//     DateTime? expiryDate;
//     double? tax;
//     double? purchaseRate;
//     double? cost;
//     double? minMrp;
//     double? mrp;
//     double? salesPrice1;
//     double? salesPriceTaxable1;
//     double? salesPrice2;
//     double? salesPriceTaxable2;
//     double? salesPrice3;
//     double? salesPriceTaxable3;
//     double? salesPrice4;
//     double? salesPriceTaxable4;
//     double? salesPrice5;
//     double? salesPriceTaxable5;
//     double? salesPrice6;
//     double? salesPriceTaxable6;
//     int thNo;
//     String? prodImage;

//     ProductItems({
//         required this.slNo,
//         required this.id,
//         required this.name,
//         this.code,
//         this.barcode,
//         this.prodField1,
//         this.prodField2,
//         this.prodField3,
//         this.prodField4,
//         this.prodField5,
//         this.description,
//         this.categoryId,
//         this.typeId,
//         this.brand,
//         this.supplier,
//         this.alias,
//         this.stock,
//         this.unit,
//         this.secunit,
//         this.expiryDate,
//         this.tax,
//         this.purchaseRate,
//         this.cost,
//         this.minMrp,
//         this.mrp,
//         this.salesPrice1,
//         this.salesPriceTaxable1,
//         this.salesPrice2,
//         this.salesPriceTaxable2,
//         this.salesPrice3,
//         this.salesPriceTaxable3,
//         this.salesPrice4,
//         this.salesPriceTaxable4,
//         this.salesPrice5,
//         this.salesPriceTaxable5,
//         this.salesPrice6,
//         this.salesPriceTaxable6,
//         required this.thNo,
//         this.prodImage,
//     });

//     factory ProductItems.fromJson(Map<String, dynamic> json) => ProductItems(
//         slNo: json["SlNo"],
//         id: json["ID"],
//         name: json["NAME"],
//         code: json["CODE"],
//         barcode: json["BARCODE"],
//         prodField1: json["PROD_FIELD1"],
//         prodField2: json["PROD_FIELD2"],
//         prodField3: json["PROD_FIELD3"],
//         prodField4: json["PROD_FIELD4"],
//         prodField5: json["PROD_FIELD5"],
//         description: json["DESCRIPTION"],
//         categoryId: json["CATEGORY_ID"],
//         typeId: json["TYPE_ID"],
//         brand: json["BRAND"],
//         supplier: json["SUPPLIER"],
//         alias: json["ALIAS"],
//         stock: json["STOCK"]?.toDouble(),
//         unit: json["UNIT"],
//         secunit: json["SECUNIT"],
//         expiryDate: json["EXPIRY_DATE"] == null ? null : DateTime.parse(json["EXPIRY_DATE"]),
//         tax: json["TAX"]?.toDouble(),
//         purchaseRate: json["PURCHASE_RATE"]?.toDouble(),
//         cost: json["COST"]?.toDouble(),
//         minMrp: json["MIN_MRP"]?.toDouble(),
//         mrp: json["MRP"]?.toDouble(),
//         salesPrice1: json["SALES_PRICE_1"]?.toDouble(),
//         salesPriceTaxable1: json["SALES_PRICE_TAXABLE_1"]?.toDouble(),
//         salesPrice2: json["SALES_PRICE_2"]?.toDouble(),
//         salesPriceTaxable2: json["SALES_PRICE_TAXABLE_2"]?.toDouble(),
//         salesPrice3: json["SALES_PRICE_3"]?.toDouble(),
//         salesPriceTaxable3: json["SALES_PRICE_TAXABLE_3"]?.toDouble(),
//         salesPrice4: json["SALES_PRICE_4"]?.toDouble(),
//         salesPriceTaxable4: json["SALES_PRICE_TAXABLE_4"]?.toDouble(),
//         salesPrice5: json["SALES_PRICE_5"]?.toDouble(),
//         salesPriceTaxable5: json["SALES_PRICE_TAXABLE_5"]?.toDouble(),
//         salesPrice6: json["SALES_PRICE_6"]?.toDouble(),
//         salesPriceTaxable6: json["SALES_PRICE_TAXABLE_6"]?.toDouble(),
//         thNo: json["TH_NO"],
//         prodImage: json["PROD_IMAGE"],
//     );

//     Map<String, dynamic> toJson() => {
//         "SlNo": slNo,
//         "ID": id,
//         "NAME": name,
//         "CODE": code,
//         "BARCODE": barcode,
//         "PROD_FIELD1": prodField1,
//         "PROD_FIELD2": prodField2,
//         "PROD_FIELD3": prodField3,
//         "PROD_FIELD4": prodField4,
//         "PROD_FIELD5": prodField5,
//         "DESCRIPTION": description,
//         "CATEGORY_ID": categoryId,
//         "TYPE_ID": typeId,
//         "BRAND": brand,
//         "SUPPLIER": supplier,
//         "ALIAS": alias,
//         "STOCK": stock,
//         "UNIT": unit,
//         "SECUNIT": secunit,
//         "EXPIRY_DATE": expiryDate?.toIso8601String(),
//         "TAX": tax,
//         "PURCHASE_RATE": purchaseRate,
//         "COST": cost,
//         "MIN_MRP": minMrp,
//         "MRP": mrp,
//         "SALES_PRICE_1": salesPrice1,
//         "SALES_PRICE_TAXABLE_1": salesPriceTaxable1,
//         "SALES_PRICE_2": salesPrice2,
//         "SALES_PRICE_TAXABLE_2": salesPriceTaxable2,
//         "SALES_PRICE_3": salesPrice3,
//         "SALES_PRICE_TAXABLE_3": salesPriceTaxable3,
//         "SALES_PRICE_4": salesPrice4,
//         "SALES_PRICE_TAXABLE_4": salesPriceTaxable4,
//         "SALES_PRICE_5": salesPrice5,
//         "SALES_PRICE_TAXABLE_5": salesPriceTaxable5,
//         "SALES_PRICE_6": salesPrice6,
//         "SALES_PRICE_TAXABLE_6": salesPriceTaxable6,
//         "TH_NO": thNo,
//         "PROD_IMAGE": prodImage,
//     };
// }


// // To parse this JSON data, do
// //
// //     final getUserid = getUseridFromJson(jsonString);

// List<GetUserid> getUseridFromJson(String str) =>
//     List<GetUserid>.from(json.decode(str).map((x) => GetUserid.fromJson(x)));

// String getUseridToJson(List<GetUserid> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class GetUserid {
//   String key;
//   String value;

//   GetUserid({
//     required this.key,
//     required this.value,
//   });

//   factory GetUserid.fromJson(Map<String, dynamic> json) => GetUserid(
//         key: json["Key"],
//         value: json["Value"],
//       );

//   Map<String, dynamic> toJson() => {
//         "Key": key,
//         "Value": value,
//       };
// }
// // To parse this JSON data, do
// //
// //     final tableSettings = tableSettingsFromJson(jsonString);

// List<TableSettings> tableSettingsFromJson(String str) =>
//     List<TableSettings>.from(
//         json.decode(str).map((x) => TableSettings.fromJson(x)));

// String tableSettingsToJson(List<TableSettings> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class TableSettings {
//   String fields;
//   String headers;
//   String ascDesc;
//   String mandatory;

//   TableSettings({
//     required this.fields,
//     required this.headers,
//     required this.ascDesc,
//     required this.mandatory,
//   });

//   factory TableSettings.fromJson(Map<String, dynamic> json) => TableSettings(
//         fields: json["FIELDS"],
//         headers: json["HEADERS"],
//         ascDesc: json["ASC_DESC"],
//         mandatory: json["MANDATORY"],
//       );

//   Map<String, dynamic> toJson() => {
//         "FIELDS": fields,
//         "HEADERS": headers,
//         "ASC_DESC": ascDesc,
//         "MANDATORY": mandatory,
//       };
// }
// // To parse this JSON data, do
// //
// //     final selectedbatch = selectedbatchFromJson(jsonString);

// Selectedbatch selectedbatchFromJson(String str) => Selectedbatch.fromJson(json.decode(str));

// String selectedbatchToJson(Selectedbatch data) => json.encode(data.toJson());

// class Selectedbatch {
//     int thProdId;
//     int thNo;

//     Selectedbatch({
//         required this.thProdId,
//         required this.thNo,
//     });

//     factory Selectedbatch.fromJson(Map<String, dynamic> json) => Selectedbatch(
//         thProdId: json["TH_PROD_ID"],
//         thNo: json["TH_NO"],
//     );

//     Map<String, dynamic> toJson() => {
//         "TH_PROD_ID": thProdId,
//         "TH_NO": thNo,
//     };
// }

// // To parse this JSON data, do
// //
// //     final fivefield = fivefieldFromJson(jsonString);


// List<Fivefield> fivefieldFromJson(String str) => List<Fivefield>.from(json.decode(str).map((x) => Fivefield.fromJson(x)));

// String fivefieldToJson(List<Fivefield> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Fivefield {
//     String? field1;
//     String? field2;
//     String? field3;
//     String? field4;
//     String? field5;

//     Fivefield({
//         this.field1,
//         this.field2,
//         this.field3,
//         this.field4,
//         this.field5,
//     });

//     factory Fivefield.fromJson(Map<String, dynamic> json) => Fivefield(
//         field1: json["FIELD1"],
//         field2: json["FIELD2"],
//         field3: json["FIELD3"],
//         field4: json["FIELD4"],
//         field5: json["FIELD5"],
//     );

//     Map<String, dynamic> toJson() => {
//         "FIELD1": field1,
//         "FIELD2": field2,
//         "FIELD3": field3,
//         "FIELD4": field4,
//         "FIELD5": field5,
//     };
// }

