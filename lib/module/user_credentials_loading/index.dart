import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:grafu/store/user_credetials_loading_store/state.dart';
import 'package:grafu/store/user_credetials_loading_store/store.dart';

class UserCredentialsLoadingPage extends StatefulWidget {
  const UserCredentialsLoadingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<UserCredentialsLoadingPage> createState() =>
      UserCredentialsLoadingPageState();
}

class UserCredentialsLoadingPageState
    extends State<UserCredentialsLoadingPage> {
  final store = Modular.get<UserCredentialsLoadingStore>();

  @override
  void initState() {
    super.initState();
    store.fetch();
  }

  Widget buildGrafuText() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Align(
              alignment: Alignment.center,
              child: Text('Grafu!!'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRedirectPages(_, UserCredentialsLoadingState state, __) {
    if (state is LoadingUserCredentialsLoadingState) {
      return buildGrafuText();
    }

    if (state is ErrorUserCredentialsLoadingState) {
      return Center(
        child: Text(state.message),
      );
    }

    if (state is SuccessUserCredentialsLoadingState) {
      Modular.to.navigate('/principal/');
    }

    return buildGrafuText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MaterialApp(
        home: ValueListenableBuilder<UserCredentialsLoadingState>(
          valueListenable: store,
          builder: buildRedirectPages,
        ),
      ),
    );
  }
}
