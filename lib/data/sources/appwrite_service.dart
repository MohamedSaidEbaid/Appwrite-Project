import 'package:appwrite/appwrite.dart';
import 'package:appwrite_project/constants/api_constants.dart';
import '../models/item_model.dart';

class AppwriteService {
  final Databases _database;

  AppwriteService(this._database);

  Future<List<ItemModel>> fetchItems() async {
    try {
      // Fetch response data from database
      final response = await _database.listDocuments(
        databaseId: ApiConstants.databaseId,
        collectionId: ApiConstants.collectionId,
      );


      if (response.documents.isEmpty) {
        return [];
      }
      // Parse the response into a list of ItemModel objects
      return response.documents
          .map((doc) => ItemModel.fromJson(doc.data))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch items: $e');
    }
  }
}
