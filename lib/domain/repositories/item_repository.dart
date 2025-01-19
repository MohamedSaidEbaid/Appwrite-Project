import '../entities/item.dart';
import 'package:dartz/dartz.dart';

abstract class ItemRepository {
  Future<Either<String, List<Item>>> fetchItems();
}