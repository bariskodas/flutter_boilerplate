import 'package:isar/isar.dart';

abstract class BaseIsarClient {

   Future<BaseIsarClient> create(
    List<CollectionSchema<dynamic>> schemas, {
    String? directory,
    bool? inspector,
  });

  Future<void> clearAllCollections();

  Future<void> clearCollection<T>();

  Future<int> saveToCollection<T>(T collection);

  Future<void> clearAndSaveToCollection<T>(T collection);

  Future<void> saveAllToCollection<T>(List<T> objects);

  Future<void> clearAndSaveAllToCollection<T>(List<T> objects);

  Future<bool> deleteFromCollection<T>(int id);

  Future<void> deleteFromCollectionByIndex<T>(int id);

  Future<T?> getByIndex<T>(int id);

  Future<List<T>> getCollection<T>();

  Future<int> getCollectionCount<T>();

  Future<List<dynamic>> buildCollectionQuery<T>({
    FilterCondition? filterCondition,
    String? sortProperty,
    Sort sortBy = Sort.asc,
  });
}
