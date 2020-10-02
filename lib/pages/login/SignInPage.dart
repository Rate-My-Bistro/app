import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:rate_my_bistro/actions/AuthActions.dart';
import 'package:rate_my_bistro/pages/login/SignInViewModel.dart';
import 'package:rate_my_bistro/state/AppState.dart';
import 'package:rate_my_bistro/theme/ThemeData.dart';

/// Page that handles the SignIn process
///
/// @author Ansgar Sachs <ansgar.sachs@cgm.com>
///
class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new StoreConnector<AppState, SignInViewModel>(
        onInit: (store) {
//          store.dispatch(new ClearErrorsAction());
//          store.dispatch(new CheckTokenAction(
//            // TODO: Implement
//            hasTokenCallback: () {},
//            // TODO: Implement
//            noTokenCallback: () {},
//          ));
        },
        converter: (store) => SignInViewModel.fromStore(store),
        builder: (_, viewModel) => buildContent(viewModel),
      ),
      bottomSheet: Center(
          heightFactor: 1.5,
          child: Text("made with  🧔️/🐻/🐖️  by ansgar",
              style: BistroDesign.theme.textTheme.body1
                  .apply(fontFamily: 'Pacifico'))),
    );
  }

  Widget buildContent(SignInViewModel viewModel) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          SizedBox(height: 80.0),
          Column(
            children: <Widget>[
              Image.asset(
                'assets/logo.png',
                height: 80.0,
              ),
              SizedBox(height: 16.0),
              Text('Rate my Bistro',
                  style: BistroDesign.theme.textTheme.headline.apply(
                      fontFamily: 'Pacifico',
                      color: BistroDesign.colors.kBistroBrown900)),
            ],
          ),
          SizedBox(height: 120.0),
          AccentColorOverride(
            color: BistroDesign.colors.kBistroBrown900,
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              onChanged: (email) {
                viewModel.validateEmail(email);
              },
            ),
          ),
          SizedBox(height: 12.0),
          AccentColorOverride(
            color: BistroDesign.colors.kBistroBrown900,
            child: TextField(
              obscureText: true,
              keyboardType: TextInputType.text,
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              onChanged: (password) {
                viewModel.validatePassword(password);
              },
            ),
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                textTheme: BistroDesign.theme.buttonTheme.textTheme,
                child: Text('CANCEL'),
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7.0)),
                ),
                onPressed: () {
                  _emailController.clear();
                  _passwordController.clear();
                },
              ),
              RaisedButton(
                textTheme: BistroDesign.theme.buttonTheme.textTheme,
                child: Text('LOGIN'),
                elevation: 8.0,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7.0)),
                ),
                onPressed: () {
                  viewModel.login(viewModel.email, viewModel.password);
                  viewModel.navigateToHome();
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}

class AccentColorOverride extends StatelessWidget {
  const AccentColorOverride({Key key, this.color, this.child})
      : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: child,
      data: Theme.of(context).copyWith(
        accentColor: color,
        brightness: Brightness.dark,
      ),
    );
  }
}
