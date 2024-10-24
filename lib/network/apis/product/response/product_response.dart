import 'package:norrenberger_assesment/network/net_utils/enums/currency.dart';
import 'package:norrenberger_assesment/network/net_utils/enums/productID.dart';

class ProductResponse {
  List<Result>? result;

  ProductResponse({
    this.result,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      ProductResponse(
        result: json["result"] == null
            ? []
            : List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );
}

class Result {
  int? id;
  String? productId;
  String? productName;
  Currency? currency;
  String? description;
  int? minWithrawal;
  int? minFund;
  String? features;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<SubProduct>? subProduct;

  Result({
    this.id,
    this.productId,
    this.productName,
    this.currency,
    this.description,
    this.minWithrawal,
    this.minFund,
    this.features,
    this.createdAt,
    this.updatedAt,
    this.subProduct,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        productId: json["product_id"],
        productName: json["product_name"],
        currency: (json["currency"] as String?).jsonCurrency,
        description: json["description"],
        minWithrawal: json["minWithrawal"],
        minFund: json["minFund"],
        features: json["features"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.tryParse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.tryParse(json["updatedAt"]),
        subProduct: json["sub_product"] == null
            ? []
            : List<SubProduct>.from(
                json["sub_product"]!.map((x) => SubProduct.fromJson(x))),
      );
}

class SubProduct {
  int? id;
  ProductID? productId;
  String? title;
  String? description;
  Currency? currency;
  String? minWithrawal;
  String? minFund;
  String? features;
  DateTime? createdAt;
  DateTime? updatedAt;

  SubProduct({
    this.id,
    this.productId,
    this.title,
    this.description,
    this.currency,
    this.minWithrawal,
    this.minFund,
    this.features,
    this.createdAt,
    this.updatedAt,
  });

  factory SubProduct.fromJson(Map<String, dynamic> json) => SubProduct(
        id: json["id"],
        productId: (json["product_id"] as String?).jsonProductID,
        title: json["title"],
        description: json["description"],
        currency: (json["currency"] as String?).jsonCurrency,
        minWithrawal: json["minWithrawal"],
        minFund: json["minFund"],
        features: json["features"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.tryParse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.tryParse(json["updatedAt"]),
      );
}
