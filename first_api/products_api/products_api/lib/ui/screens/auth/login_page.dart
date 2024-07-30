import 'package:flutter/material.dart';
import 'package:products_api/data/services/auth_services/login_service.dart';
import '../products_screen/products_screen.dart';
import 'widgets/auth_text.dart';
import 'widgets/custom_button.dart';
import 'widgets/forgot_password.dart';
import 'widgets/login_fields.dart';
import 'widgets/title_and_subtitle.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController loginEmailController;
  late final TextEditingController loginPasswordController;
  late final LoginService loginService;

  bool loading = false;

  final SnackBar loginSnackBar = const SnackBar(
    backgroundColor: Colors.red,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20))),
    padding: EdgeInsets.all(20),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(20),
    content: Text('email or password is incorrect'),
  );

  @override
  void initState() {
    loginEmailController = TextEditingController();
    loginPasswordController = TextEditingController();
    loginService = LoginService();
    super.initState();
  }

  @override
  void dispose() {
    loginEmailController.dispose();
    loginPasswordController.dispose();
    super.dispose();
  }

  void _goToHomePage() => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const ProductsScreen(),
        ),
      );

  Future<bool> get _isLogged => loginService.checkLogin(
      loginEmailController.text, loginPasswordController.text);

  void _checkLoginCredentials() async {
    loading = true;
    setState(() {});
    if (await _isLogged) {
      _goToHomePage();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(loginSnackBar);
    }
    loading = false;
    setState(() {});
  }

  // eve.holt@reqres.in

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TitleAndSubtitle(
              title: 'Login here',
              subTitle: 'Welcome back you\'ve ben missed!',
            ),
            const SizedBox(height: 45),
            LoginFields(
              loginEmailController: loginEmailController,
              loginPasswordController: loginPasswordController,
            ),
            const SizedBox(height: 25),
            const ForgotPassword(),
            const SizedBox(height: 25),
            CustomButton(
              loading: loading,
              buttonName: 'Sign in',
              onPressed: () => _checkLoginCredentials(),
            ),
            const SizedBox(height: 34),
            const AuthText(authText: 'Create new account'),
          ],
        ),
      ),
    );
  }
}
