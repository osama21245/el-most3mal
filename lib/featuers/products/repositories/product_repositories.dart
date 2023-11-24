import 'package:elmostaml/core/faliure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:elmostaml/models/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/constants/firebase_constants.dart';

class ProductRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  ProductRepository({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
  })  : _auth = auth,
        _firestore = firestore;

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);
  final CollectionReference _product =
      FirebaseFirestore.instance.collection('product2');

  Future<Either> addProduct(ProductModel productModel) async {
    try {
      return right(_product.doc(productModel.id).set(productModel.toMap()));
    } on FirebaseException catch (e) {
      throw e;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Stream<List<ProductModel>> getProductsStream() {
    return FirebaseFirestore.instance.collection('product').snapshots().map(
        (event) => event.docs
            .map((e) => ProductModel.fromMap(e.data() as Map<String, dynamic>))
            .toList());
  }

  Stream<List<ProductModel>> getProductsStream3() {
    return _product.snapshots().map((event) {
      List<ProductModel> Communies = [];
      for (var doc in event.docs) {
        Communies.add(ProductModel.fromMap(doc.data() as Map<String, dynamic>));
      }
      return Communies;
    });
  }

  // Future<ProductModel> getproducts2() async {
  //   DocumentSnapshot doc = await _product.doc().get();
  //   return ProductModel.fromMap(doc.data() as Map<String, dynamic>);
  // }
}
