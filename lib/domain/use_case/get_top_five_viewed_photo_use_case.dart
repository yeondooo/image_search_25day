import 'package:image_search_25day/core/result.dart';
import 'package:image_search_25day/domain/model/photo.dart';
import 'package:image_search_25day/domain/repository/photo_repository.dart';

class GetTopFiveViewedPhotoUseCase {
  final PhotoRepository _photoRepository;

  GetTopFiveViewedPhotoUseCase(this._photoRepository);

  Future<Result<List<Photo>>> execute(String query) async {
    try {
      final photos = await _photoRepository.getPhotos(query);
      photos.sort((a, b) => -a.views.compareTo(b.views));
      return Result.success(photos.take(5).toList());
    } catch (e) {
      return const Result.error('에러가 발생했습니다.');
    }
  }
}
