import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:telefonchu/features/models/data/models/model_model.dart';

import '../../domain/entities/model_entity.dart';

abstract class ModelsDataSource {
  Future<List<ModelModel>> loadModels(String brandID);
  Future<ModelModel> addModel(Map<String, dynamic> modelJson);
  Future<Model> update(String docId, Map<String, dynamic> modelJson);
  Future<ModelModel> loadModel(String docID);
  Future<void> removeModel(String docID);
}

class ModelsDataSourceImpl extends ModelsDataSource {
  final FirebaseFirestore firestore;
  ModelsDataSourceImpl(this.firestore);
  @override
  Future<List<ModelModel>> loadModels(String brandID) async {
    final data = await firestore.collection('model').where('brand_id', isEqualTo: brandID).get();

    return data.docs.map((e) => ModelModel.fromSnapshot(e)).toList();
  }

  @override
  Future<ModelModel> addModel(Map<String, dynamic> modelJson) async {
    final data = await firestore.collection('model').add(modelJson);

    return ModelModel.fromSnapshot((await data.get()));
  }

  @override
  Future<void> removeModel(String docID) async {
    await firestore.collection('model').doc(docID).delete();

    return;
  }

  @override
  Future<Model> update(String docId, Map<String, dynamic> modelJson) async {
    await firestore.collection('model').doc(docId).update(modelJson);

    return ModelModel.fromMap(modelJson);
  }

  @override
  Future<ModelModel> loadModel(String docID) async {
    final data = await firestore.collection('model').doc(docID).get();

    return ModelModel.fromSnapshot(data);
  }
}
