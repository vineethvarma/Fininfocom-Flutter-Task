import 'package:realm/realm.dart';
part 'user_realm.g.dart';

@RealmModel()
class _Users {
  @PrimaryKey()
  late String name;
  late int age;
  late String city;
}
