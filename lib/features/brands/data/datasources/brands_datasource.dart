import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:telefonchu/features/brands/data/models/brand.dart';
import 'package:telefonchu/features/brands/domain/entities/brand_entity.dart';

abstract class BrandsDataSource {
  Future loadBrands();
  Future<BrandModel> addBrand(BrandModel brand);
  Future<BrandModel> updateBrands(BrandModel updatedBrand);
  Future<void> deleteBrand(String docID);
}

class BrandsDataSourceImpl extends BrandsDataSource {
  final FirebaseFirestore firestore;
  BrandsDataSourceImpl(this.firestore);
  @override
  Future<List<Brand>> loadBrands() async {
    final data = await firestore.collection('brand').get();
    

    return data.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
  }

  @override
  Future<void> deleteBrand(String docID) async {
    await firestore.collection('brand').doc(docID).delete();

    return;
  }

  @override
  Future<BrandModel> updateBrands(BrandModel updatedBrand) async {
    await firestore.collection('brand').doc(updatedBrand.docId).update(updatedBrand.toMap());

    return updatedBrand;
  }

  @override
  Future<BrandModel> addBrand(BrandModel brand) async {
    await firestore.collection('brand').add(brand.toMap());

    return brand;
  }
}
