import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key, required this.image, required this.onClicked})
      : super(key: key);
  final File image;
  final ValueChanged<ImageSource> onClicked;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Center(
      child: Stack(
        children: [
          buildImage(context),
          Positioned(bottom: 0, right: 4, child: buildEditIcon(color))
        ],
      ),
    );
  }

  buildImage(BuildContext context) {
    final imagePath = this.image.path;
    final image = imagePath.contains('https://')
        ? NetworkImage(imagePath)
        : FileImage(File(imagePath));

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image as ImageProvider,
          fit: BoxFit.cover,
          width: 160,
          height: 160,
          child: GestureDetector(
            onTap: () async {
              final source = await showImageSource(context);
              if (source == null) return;
              onClicked(source);
            },
          ),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => Container(
    height: 45,
    width: 45,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: color,
      border: Border.all(width: 2, color: Colors.white)
    ),
    child: Center(child: Icon(Icons.camera_enhance, color: Colors.white,),),
  );

}

Future<ImageSource?> showImageSource(BuildContext context) async {
  if (Platform.isIOS) {
    return showCupertinoModalPopup<ImageSource>(
        context: context,
        builder: (context) => CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
                onPressed:()=>Navigator.of(context).pop(ImageSource.camera),
                child: Row(children: const [
                  Icon(Icons.camera_alt),
                  SizedBox(width: 10),
                  Text('Chụp ảnh')
                ],)),
            CupertinoActionSheetAction(
                onPressed: () =>
                    Navigator.of(context).pop(ImageSource.gallery),
                child: Row(children: const [
                  Icon(Icons.image),
                  SizedBox(width: 10),
                  Text('Chọn ảnh từ thư viện')
                ],)),
          ],
        ));
  }else{
    return showModalBottomSheet(
        context: context,
        builder: (context)=>Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Chụp ảnh'),
              onTap: ()=>Navigator.of(context).pop(ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Chọn ảnh từ thư viện'),
              onTap: ()=>Navigator.of(context).pop(ImageSource.gallery),
            )
          ],
        )
    );
  }
}