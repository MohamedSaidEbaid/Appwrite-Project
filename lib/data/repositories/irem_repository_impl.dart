import 'package:dartz/dartz.dart';

import '../../domain/entities/item.dart';
import '../../domain/repositories/item_repository.dart';
import '../sources/appwrite_service.dart';


class ItemRepositoryImpl implements ItemRepository {
  final AppwriteService _appwriteService;

  ItemRepositoryImpl(this._appwriteService);

  @override
  Future<Either<String, List<Item>>> fetchItems() async {
    try {
      final items = await _appwriteService.fetchItems();
      return Right(items
          .map((itemModel) => Item(
          id: itemModel.id,
          title: itemModel.title,
          description: itemModel.description))
          .toList());
    } catch (e) {
      return Left('Error fetching items: $e');
    }
  }
}
