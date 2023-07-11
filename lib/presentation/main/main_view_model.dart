import 'package:flutter/material.dart';
import 'package:pixa_bay_intermediate/domain/use_case/get_top_five_most_viewd_images_use_case.dart';
import 'package:pixa_bay_intermediate/presentation/main/main_state.dart';

class MainViewModel with ChangeNotifier {
  final GetTopFiveMostViewdImagesUseCase _getTopFiveMostViewdImagesUseCase;

  MainViewModel(this._getTopFiveMostViewdImagesUseCase);
  MainState _state = const MainState();

  MainState get state => _state;

  void fetchImages(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
        photos: await _getTopFiveMostViewdImagesUseCase.execute(query),
        isLoading: false);
    notifyListeners();
  }
}
