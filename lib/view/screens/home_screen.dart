import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/app_route.dart';
import '../../constant/constant.dart';
import '../../controller/home_controller.dart';
import '../widgets/error_message.dart';
import '../widgets/movie_listing.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);
  static const route = AppRoute.home;
  static GetPage page = GetPage(
      name: HomeScreen.route,
      page: HomeScreen.new,
      preventDuplicates: true,
      binding: BindingsBuilder.put(() => HomeController()));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: GetBuilder<HomeController>(
          builder: (_) =>
              controller.selectedIndex.value == 0 ? dashBoard() : myShow(),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'My Show',
              ),
            ],
            currentIndex: controller.selectedIndex.value,
            selectedItemColor: Colors.amber,
            onTap: controller.onItemTapped,
          ),
        ),
      ),
    );
  }

  Widget dashBoard() {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (controller.isAnyError.value) {
        return ErrorMessage(
          message: controller.errorMessage,
          isDialogueShow: true,
          func: () {
            controller.getMovieList();
          },
          funcTitle: 'Try again',
        );
      }

      return CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            floating: true,
            pinned: true,
            snap: false,
            centerTitle: false,
            title: const Text(
              'CHALCHITR',
              style: TextStyle(
                fontSize: 25,
                letterSpacing: 1.1,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  onPressed: () async {
                    await auth.signOut();

                    Get.offAllNamed(AppRoute.login);
                  },
                  icon: const Icon(Icons.logout_rounded),
                ),
              )
            ],
            bottom: AppBar(
              backgroundColor: Colors.black,
              title: InkWell(
                onTap: () {
                  Get.toNamed(AppRoute.search);
                },
                child: Container(
                    width: double.infinity,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(width: 0.5, color: Colors.white)),
                    child: Row(
                      children: const [
                        SizedBox(width: 10),
                        Icon(Icons.search),
                        SizedBox(width: 10),
                        Text(
                          'Search movies',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 18),
                        ),
                      ],
                    )),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              List.generate(
                controller.movies.length,
                (index) => MovieListing(
                  result: controller.movies[index],
                ),
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget myShow() {
    return Column(
      children: [
        const Center(child: Text('My Show')),
        ...controller.moviesData.map((e) => ListTile(
                  leading:
                      Text((controller.moviesData.indexOf(e) + 1).toString()),
                  title: Text(e['movieId'].toString()),
                  subtitle: Text(e['title'] ?? ''),
                )) ??
            [],
        if (controller.moviesData.isEmpty)
          const Padding(
            padding: EdgeInsets.only(top: 400),
            child: Center(child: Text('No Show Booked')),
          ),
      ],
    );
  }
}
