import 'package:mobx/mobx.dart';

part 'login_repository_store.g.dart';

class LoginRepositoryStore = _LoginRepositoryStore with _$LoginRepositoryStore;

//The store class

abstract class _LoginRepositoryStore with Store {
  @observable
  bool isLogedin = false;

  @computed
  bool get isLogin => isLogedin;
}
