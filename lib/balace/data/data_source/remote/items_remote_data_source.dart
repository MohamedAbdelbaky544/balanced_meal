import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

abstract class ItemsRemoteDataSource {
  Future<QuerySnapshot<Map>> getVegetable();
  Future<QuerySnapshot<Map>> getCarbs();

  Future<QuerySnapshot<Map>> getMeat();
}

@LazySingleton(as: ItemsRemoteDataSource)
class ItemsRemoteDataSourceImpl implements ItemsRemoteDataSource {
  final storage = FirebaseFirestore.instance;

  @override
  Future<QuerySnapshot<Map>> getVegetable() {
    return storage.collection('vegetable').get();
  }

  @override
  Future<QuerySnapshot<Map>> getCarbs() {
    return storage.collection('carb').get();
  }

  @override
  Future<QuerySnapshot<Map>> getMeat() {
    return storage.collection('meat ').get();
  }
}
