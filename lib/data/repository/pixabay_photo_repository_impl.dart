import 'package:pixa_bay_intermediate/data/api/pixabay_api.dart';
import 'package:pixa_bay_intermediate/data/mapper/photo_mapper.dart';
import 'package:pixa_bay_intermediate/domain/model/photo.dart';
import 'package:pixa_bay_intermediate/domain/repository/photo_repository.dart';

class PixabayPhotoRepositoryImpl implements PhotoRepository {
  final _api = PixabayApi();
  @override
  Future<List<Photo>> getPhotos(String query) async {
    final resultDto = await _api.getImages(query);

    if (resultDto.hits == null) {
      return [];
    }
    return resultDto.hits!.map((e) => e.toPhoto()).toList();
  }
}
