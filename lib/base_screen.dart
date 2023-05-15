import 'package:flutter/material.dart';
import 'package:industrial_project/pages/home.dart';
import 'package:industrial_project/pages/production_page.dart';
import 'package:industrial_project/widgets/drawer.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  double index = 0;
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(microseconds: 50)).then((value) =>
    setState((){index = pageController.page!;}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posição atual: Linha B"),
        elevation: 0,
      ),
      body: Row(
        children: [
          CustomDrawer(
            (e){
              pageController.jumpToPage(e);
              setState((){index = pageController.page!;});
            },
            index,
          ),
          Expanded(
            flex: 3,
            child: PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                //const HomeScreen(),
                const Production(),
                Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.grey[900],
                    title: const Text('Paradas'),
                  ),
                ),
                Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.grey[900],
                    title: const Text('Indicador OEE'),
                  ),
                ),
                Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.grey[900],
                    title: const Text('Produtos'),
                  ),
                ),
                Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.grey[900],
                    title: const Text('Máquinas'),
                  ),
                ),
                Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.grey[900],
                    title: const Text('Tipo de Paradas'),
                  ),
                ),
                Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.grey[900],
                    title: const Text('Conceito OEE'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}