import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../Provider/FireBase/firebase_function.dart';
import '../../Widgets/movieContainerInSearchAndCategoryMovies.dart';
import '../../Widgets/show_new_release.dart';
import '../../Widgets/show_popular_slider.dart';
import '../../Widgets/show_top_rated.dart';
import '../../const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<FirebaseFunctions>(context, listen: false).getTasks();
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
          children: [
            const SizedBox(
              height: 300,
              child: PopularSlider(),
            ),
            const ShowNewRelease(),
            const ShowTopRated(),
            StreamBuilder(
              stream: FirebaseFunctions().getTasks(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text("Some Thing Went Wrong"),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData) {
                  var provider = Provider.of<FirebaseFunctions>(context);
                  provider.myWatchList =
                      snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
                  return const Divider(
                    height: 1,
                    color: Colors.transparent,
                  );
                  ;
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            )
          ],
        )),
        backgroundColor: scaffoldBackground);
  }
}
