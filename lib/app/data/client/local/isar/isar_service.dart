import 'dart:io' as io;

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter_boilerplate/app/data/client/local/isar/abstract/base_isar_client.dart';

class IsarClient implements BaseIsarClient {
  // IsarClient._();

  late Isar _isar;
  Isar get instance => _isar;

  @override
  Future<IsarClient> create(
    List<CollectionSchema<dynamic>> schemas, {
    String? directory,
    bool? inspector,
  }) async {
    final String dir = directory ?? (await getApplicationDocumentsDirectory()).path;

    _isar = await Isar.open(
      schemas,
      directory: dir,
      inspector: inspector ?? true,
    );

    return this;
  }

  @override
  Future<void> clearAllCollections() async {
    await _isar.writeTxn(() async => await _isar.clear());
  }

  @override
  Future<void> clearCollection<T>() async =>
      await _isar.writeTxn(() async => await _isar.collection<T>().clear());

  @override
  Future<int> saveToCollection<T>(T collection) async => await _isar
      .writeTxn(() async => await _isar.collection<T>().put(collection));

  @override
  Future<void> clearAndSaveToCollection<T>(T collection) async {
    await _isar.writeTxn(() async {
      await _isar.collection<T>().clear();
      await _isar.collection<T>().put(collection);
    });
  }

  @override
  Future<void> saveAllToCollection<T>(List<T> objects) async => await _isar
      .writeTxn(() async => await _isar.collection<T>().putAll(objects));

  @override
  Future<void> clearAndSaveAllToCollection<T>(List<T> objects) async {
    await _isar.writeTxn(() async {
      await _isar.collection<T>().clear();
      await _isar.collection<T>().putAll(objects);
    });
  }

  @override
  Future<bool> deleteFromCollection<T>(int id) async =>
      await _isar.writeTxn(() async => _isar.collection<T>().delete(id));

  @override
  Future<void> deleteFromCollectionByIndex<T>(int id) async =>
      await _isar.writeTxn(() async => _isar.collection<T>().delete(id));

  @override
  Future<T?> getByIndex<T>(int id) async => await _isar.collection<T>().get(id);

  @override
  Future<List<T>> getCollection<T>() async =>
      await _isar.collection<T>().where().findAll();

  @override
  Future<int> getCollectionCount<T>() async =>
      await _isar.collection<T>().count();

  @override
  Future<List<dynamic>> buildCollectionQuery<T>({
    FilterCondition? filterCondition,
    String? sortProperty,
    Sort sortBy = Sort.asc,
  }) async =>
      await _isar
          .collection<T>()
          .buildQuery(
            filter: filterCondition,
            property: sortProperty,
            whereSort: sortBy,
          )
          .findAll();
}
