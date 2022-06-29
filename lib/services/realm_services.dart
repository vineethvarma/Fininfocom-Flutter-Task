import 'package:realm/realm.dart';
import '../user_realm.dart';

class RealmServices {
  final Configuration _config = Configuration.local([Users.schema]);
  late Realm _realm;

  openRealm() {
    _realm = Realm(_config);
  }

  closeRealm() {
    if (!_realm.isClosed) {
      _realm.close();
    }
  }

  addUserData(String name, int age, String city) {
    openRealm();
    try {
      Users user = Users(name, age, city);
      if (_realm.find<Users>(user.name) == null) {
        _realm.write(() => {_realm.add(user)});
      }
    } catch (error) {
      // print(e);
      return error;
    }
  }


  getUserData() {
    openRealm();
    List<Users> userData = [];
    var cars = _realm.all<Users>();
    for (var value in cars) {
      userData.add(value);
      // print(value);
    }
    return userData;
  }
}
