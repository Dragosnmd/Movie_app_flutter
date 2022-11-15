import 'package:mobx/mobx.dart';
import 'package:movie_app/helpers/resource.dart';
import 'package:movie_app/login/login_repository.dart';

part 'login_view_model.g.dart';

class LoginViewModel = LoginViewModelBase with _$LoginViewModel;

abstract class LoginViewModelBase with Store {
  late final LoginRepository repository;

  LoginViewModelBase(this.repository);
  @observable
  bool isLoading = false;

  @computed
  bool get succesLogin => repository.loginSucceed;

  @observable
  String? error;

  @observable
  Resource<bool> login = Resource.initial();

  Future<void> logIn(String username, String password) async {
    login = Resource.loading();
    try {
      login = Resource.success(
          data: (await repository.login(
        username,
        password,
      )));
    } catch (ex) {
      login = Resource.error(error: ex.toString());
    }
  }
}
