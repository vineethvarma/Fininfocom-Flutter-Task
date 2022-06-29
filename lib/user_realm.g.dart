// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_realm.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Users extends _Users with RealmEntity, RealmObject {
  Users(
    String name,
    int age,
    String city,
  ) {
    RealmObject.set(this, 'name', name);
    RealmObject.set(this, 'age', age);
    RealmObject.set(this, 'city', city);
  }

  Users._();

  @override
  String get name => RealmObject.get<String>(this, 'name') as String;
  @override
  set name(String value) => throw RealmUnsupportedSetError();

  @override
  int get age => RealmObject.get<int>(this, 'age') as int;
  @override
  set age(int value) => RealmObject.set(this, 'age', value);

  @override
  String get city => RealmObject.get<String>(this, 'city') as String;
  @override
  set city(String value) => RealmObject.set(this, 'city', value);

  @override
  Stream<RealmObjectChanges<Users>> get changes =>
      RealmObject.getChanges<Users>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObject.registerFactory(Users._);
    return const SchemaObject(Users, 'Users', [
      SchemaProperty('name', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('age', RealmPropertyType.int),
      SchemaProperty('city', RealmPropertyType.string),
    ]);
  }
}
