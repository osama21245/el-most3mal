import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elmostaml/models/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../products/repositories/product_repositories.dart';

StateNotifierProvider<ViewPostsController, bool> communityControllerProvider =
    StateNotifierProvider<ViewPostsController, bool>((ref) {
  final productRepository = ProductRepository(
      auth: FirebaseAuth.instance, firestore: FirebaseFirestore.instance);
  return ViewPostsController(
    productRepository: ProductRepository(
        auth: FirebaseAuth.instance, firestore: FirebaseFirestore.instance),
    ref: ref,
  );
});

final viewPostsProvider = StreamProvider(
    (ref) => ref.watch(communityControllerProvider.notifier).searchCommunity());

class ViewPostsController extends StateNotifier<bool> {
  final ProductRepository _productRepository;
  final Ref _ref;

  ViewPostsController({
    required ProductRepository productRepository,
    required Ref ref,
  })  : _productRepository = productRepository,
        _ref = ref,
        super(false);

  Stream<List<ProductModel>> searchCommunity() {
    return _productRepository.getProductsStream3();
  }
}
