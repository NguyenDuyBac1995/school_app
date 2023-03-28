import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class GridImage extends StatelessWidget {
  const GridImage({Key? key, required this.image,this.padding = 6}) : super(key: key);
  final List<String> image;
  final double padding;

  Uint8List convertBase64Image(String base64String) {
    return Base64Decoder().convert(base64String.split(',').last);
  }
  
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - padding;
    return buildImageGrid (image, width, context);
  }

  Widget buildImageGrid(List<String> image, double width, BuildContext context) {
    switch (image.length){
      case 0:
        return const SizedBox();
      case 1:
        return _buildOneImage(image[0], width, context);
      case 2:
        return _buildTwoImage(image, width, context);
      case 3:
        return _buildThreeImage(image,width,context);
      case 4:
        return _buildFourImage(image, width, context);
      case 5:
        return _buildFiveImage(image, width, context);
      default:
        return _buildMultiImage(image, width, context);
    }
  }

  Padding _buildPadding() => Padding(
    padding: EdgeInsets.only(left: padding, top: padding),
  );

  Widget _buildOneImage(String image, double width, BuildContext context) {
    return GestureDetector(
      onTap: ()=>navigateToPhotoPage([image],0, context) ,
      child: AspectRatio(
        aspectRatio: 3/2,
        child: Image.memory(base64Decode(image), fit: BoxFit.cover,),
      ),
    );
  }

  Widget _buildTwoImage(List<String> image, double width, BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(child: AspectRatio(
          aspectRatio: 1/1,
          child: Image.memory(
            base64Decode(image[0]), fit: BoxFit.cover,),
        ),),
        _buildPadding(),
        Expanded(child: AspectRatio(
          aspectRatio: 1/1,
          child: Image.memory(
            base64Decode(image[1]), fit: BoxFit.cover,),
        ),),
      ],
    );
  }

  Widget _buildThreeImage(List<String> image, double width, BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(child: AspectRatio(
            aspectRatio: 1/1,
            child: Image.memory(
              base64Decode(image[0]), fit: BoxFit.cover,),
          ),),
          Expanded(child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: AspectRatio(
                aspectRatio: 1/1,
                child: Image.memory(
                  base64Decode(image[1]), fit: BoxFit.cover,),
              )),
              _buildPadding(),
              Expanded(child: AspectRatio(
                aspectRatio: 1/1,
                child: Image.memory(
                  base64Decode(image[2]), fit: BoxFit.cover,),
              ))
            ],))
        ],
      ),
    );
  }

  Widget _buildFourImage(List<String> image, double width, BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(child: AspectRatio(
                aspectRatio: 1/1,
                child: Image.memory(
                  base64Decode(image[0]), fit: BoxFit.cover,),
              )),
              _buildPadding(),
              Expanded(child: AspectRatio(
                aspectRatio: 1/1,
                child: Image.memory(
                  base64Decode(image[1]), fit: BoxFit.cover,),
              ))
            ],),
          _buildPadding(),
          Row(
            children: [
              Expanded(child: AspectRatio(
                aspectRatio: 1/1,
                child: Image.memory(
                  base64Decode(image[2]), fit: BoxFit.cover,),
              )),
              _buildPadding(),
              Expanded(child: AspectRatio(
                aspectRatio: 1/1,
                child: Image.memory(
                  base64Decode(image[3]), fit: BoxFit.cover,),
              ))
            ],)
        ],
      ),
    );
  }

  Widget _buildFiveImage(List<String> image, double width, BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(child: AspectRatio(
                aspectRatio: 1/1,
                child: Image.memory(
                  base64Decode(image[0]), fit: BoxFit.cover,),
              )),
              _buildPadding(),
              Expanded(child: AspectRatio(
                aspectRatio: 1/1,
                child: Image.memory(
                  base64Decode(image[1]), fit: BoxFit.cover,),
              ))
            ],),
          _buildPadding(),
          Row(
            children: [
              Expanded(child: AspectRatio(
                aspectRatio: 1/1,
                child: Image.memory(
                  base64Decode(image[2]), fit: BoxFit.cover,),
              )),
              _buildPadding(),
              Expanded(child: AspectRatio(
                aspectRatio: 1/1,
                child: Image.memory(
                  base64Decode(image[3]), fit: BoxFit.cover,),
              )),
              _buildPadding(),
              Expanded(child: AspectRatio(
                aspectRatio: 1/1,
                child: Image.memory(
                  base64Decode(image[4]), fit: BoxFit.cover,),
              ))
            ],)
        ],
      ),
    );
  }

  Widget _buildMultiImage(List<String> image, double width, BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(child: AspectRatio(
              aspectRatio: 1/1,
              child: Image.memory(
                base64Decode(image[0]), fit: BoxFit.cover,),
            )),
            _buildPadding(),
            Expanded(child: AspectRatio(
              aspectRatio: 1/1,
              child: Image.memory(
                base64Decode(image[1]), fit: BoxFit.cover,),
            ))
          ],),
        _buildPadding(),
        Row(
          children: [
            Expanded(child: AspectRatio(
              aspectRatio: 1/1,
              child: Image.memory(
                base64Decode(image[2]), fit: BoxFit.cover,),
            )),
            _buildPadding(),
            Expanded(child: AspectRatio(
              aspectRatio: 1/1,
              child: Image.memory(
                base64Decode(image[3]), fit: BoxFit.cover,),
            )),
            _buildPadding(),
            Expanded(child: AspectRatio(
              aspectRatio: 1/1,
              child: Stack(
                children: [
                  Image.memory(
                    base64Decode(image[4]), fit: BoxFit.cover,),
                  Container(
                    constraints: const BoxConstraints.expand(),
                    decoration: BoxDecoration(
                      color: Colors.black12.withOpacity(0.3),
                    ),
                    child: Center(
                      child: Text('+${image.length - 5}',
                        style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                    ),
                  )
                ],
              ),
            ))
          ],)
      ],
    );
  }

  void navigateToPhotoPage(
      List<String> image, int index , BuildContext context
      ){}
}
