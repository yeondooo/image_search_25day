import 'package:image_search_25day/data/dto/pixabay_result_dto.dart';
import 'package:image_search_25day/domain/model/photo.dart';

extension ToPhoto on Hits {
  Photo toPhoto() {
    return Photo(
      id: id,
      url: webformatURL,
      views: views,
    );
  }
}
