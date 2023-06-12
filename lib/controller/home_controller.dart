import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:movie_booking_system/services/database/get_storate_local_db.dart';

import '../model/movies.dart';
import '../services/api/api_services.dart';

class HomeController extends GetxController {
  final ApiServices apiServices = ApiServices();

  final RxList<Results> _movies = RxList();

  RxList<Results> get movies => _movies;
  RxBool isLoading = false.obs;
  RxBool isAnyError = false.obs;
  RxBool isSearching = false.obs;
  String errorMessage = '';
  @override
  void onInit() async {
    super.onInit();
    getMovieList();
    getBookedMovies();
  }

  RxInt selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;

    update();
  }

  List<Map<String, dynamic>> moviesData = [];
  getBookedMovies() {
    moviesData = getMovies;
    if (kDebugMode) {
      print(moviesData);
    }
  }

  // Get movie List
  Future<void> getMovieList() async {
    isLoading.value = true;
    Data data = await apiServices.movieList();

    if (!data.isSuccess) {
      errorMessage = data.message;
      isAnyError.value = !data.isSuccess;
      Get.snackbar('Error', errorMessage);
      isLoading.value = false;
      return;
    }
    _movies.value = data.data;

    isLoading.value = false;
  }
}
