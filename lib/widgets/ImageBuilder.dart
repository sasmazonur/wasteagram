
import 'package:flutter/material.dart';
import 'package:wasteagram2/models/FoodWastePost.dart';

//Image Builder. Circular Progress Indicator used for waiting time
class ImageBuild extends StatelessWidget {
  const ImageBuild({
    Key key,
    @required this.singlePost,
  }) : super(key: key);

  final FoodWastePost singlePost;

  @override
  Widget build(BuildContext context) {
    return Image.network(
    
      singlePost.url,
      scale: 0.5,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes
                    : null,
              ),
            );
          },
    );
  }
}