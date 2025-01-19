import 'package:dartz/dartz.dart';
import '../entities/item.dart';
import '../repositories/item_repository.dart';

class FetchItemsUseCase {
  final ItemRepository repository;

  FetchItemsUseCase(this.repository);

  Future<Either<String, List<Item>>> call() async {
    return await repository.fetchItems();
  }
}