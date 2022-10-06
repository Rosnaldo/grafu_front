import 'package:flutter/material.dart';
import 'package:grafu/components/screener/index.dart';
import 'package:grafu/module/welcome/barbecue_clip_path.dart';
import 'package:grafu/module/welcome/house_clip_path.dart';
import 'package:grafu/styles/button.dart';
import 'package:grafu/styles/color.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<WelcomePage> createState() => WelcomePageState();
}

class WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Screener(
          children: [
            const SizedBox(height: 30.0),
            SizedBox(
              width: double.maxFinite,
              height: 340.0,
              child: TabBarView(controller: tabController, children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ClipPath(
                        clipper: HouseClipPath(),
                        child: Image.asset('assets/house.jpg'),
                      ),
                    ),
                    const Text(
                      'Bem vindo à Grafu',
                      style: TextStyle(
                          color: mainStrongText,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ClipPath(
                        clipper: BarbecueClipPath(),
                        child: Image.asset('assets/barbecue.jpg'),
                      ),
                    ),
                    const Text(
                      'Conheça pessoas de qualidade',
                      style: TextStyle(
                          color: mainStrongText,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700),
                    ),
                    const Text(
                      'escolhidas',
                      style: TextStyle(
                          color: mainStrongText,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700),
                    ),
                    const Text(
                      'pelos seus amigos',
                      style: TextStyle(
                          color: mainStrongText,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ClipPath(
                      clipper: BarbecueClipPath(),
                      child: Image.asset('assets/pool.jpg'),
                    ),
                  ),
                  const Text(
                    'Faça seus próprios eventos',
                    style: TextStyle(
                        color: mainStrongText,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700),
                  ),
                ]),
              ]),
            ),
            TabBar(
              isScrollable: true,
              controller: tabController,
              labelColor: const Color.fromRGBO(156, 122, 88, 1),
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: mainBackGround,
                  width: 4.0,
                  style: BorderStyle.solid,
                ),
              ),
              overlayColor: MaterialStateProperty.all(mainBackGround),
              unselectedLabelColor: mainBackGroundDark,
              tabs: const [
                Tab(text: '____'),
                Tab(text: '____'),
                Tab(text: '____'),
              ],
              labelStyle: const TextStyle(fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 45.0),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child:
                  MainPinkButton(onPressed: () async {}, text: 'Fazer Login'),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: MainPinkButton(
                  onPressed: () async {}, text: 'Vizitar Evento'),
            )
          ],
        ),
      ),
    );
  }
}
