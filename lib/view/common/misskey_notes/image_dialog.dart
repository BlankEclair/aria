import 'dart:math';

import 'package:flutter/material.dart';
import 'package:miria/view/common/misskey_notes/network_image.dart';

class ImageDialog extends StatefulWidget {
  final List<String> imageUrlList;
  final int initialPage;

  const ImageDialog({
    super.key,
    required this.imageUrlList,
    required this.initialPage,
  });

  @override
  State<StatefulWidget> createState() => ImageDialogState();
}

class ImageDialogState extends State<ImageDialog> {
  var scale = 1.0;
  late final pageController = PageController(initialPage: widget.initialPage);
  var verticalDragX = 0.0;
  var verticalDragY = 0.0;
  int? listeningId;
  final TransformationController _transformationController =
      TransformationController();

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        verticalDragX = 0;
        verticalDragY = 0;
        listeningId = null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.transparent,
        titlePadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        actionsPadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.zero,
        content: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned.fill(
                  child: Listener(
                      onPointerDown: (event) {
                        if (listeningId != null) {
                          setState(() {
                            verticalDragX = 0;
                            verticalDragY = 0;
                          });
                          listeningId = null;
                          return;
                        }
                        if (scale != 1.0) return;
                        listeningId = event.pointer;
                      },
                      onPointerMove: (event) {
                        if (listeningId != null) {
                          setState(() {
                            verticalDragX += event.delta.dx;
                            verticalDragY += event.delta.dy;
                          });
                        }
                      },
                      onPointerUp: (event) {
                        final angle =
                            (atan2(verticalDragY, verticalDragX).abs() /
                                pi *
                                180);
                        if (listeningId != null &&
                            verticalDragY.abs() > 10 &&
                            (angle > 60 && angle < 120)) {
                          Navigator.of(context).pop();
                        } else {
                          listeningId = null;
                        }
                      },
                      child: GestureDetector(
                          onDoubleTapDown: (details) {
                            listeningId = null;
                            if (scale != 1.0) {
                              _transformationController.value =
                                  Matrix4.identity();
                              scale = 1.0;
                            } else {
                              final position = details.localPosition;
                              _transformationController
                                  .value = Matrix4.identity()
                                ..translate(-position.dx * 2, -position.dy * 2)
                                ..scale(3.0);
                              scale = 3.0;
                            }
                          },
                          child: Transform.translate(
                            offset: Offset(verticalDragX, verticalDragY),
                            child: PageView(
                              controller: pageController,
                              physics: scale == 1.0
                                  ? const ScrollPhysics()
                                  : const NeverScrollableScrollPhysics(),
                              children: [
                                for (final url in widget.imageUrlList)
                                  ScaleNotifierInteractiveViewer(
                                    imageUrl: url,
                                    controller: _transformationController,
                                    onScaleChanged: (scaleUpdated) =>
                                        setState(() {
                                      scale = scaleUpdated;
                                    }),
                                  ),
                              ],
                            ),
                          )))),
              Positioned(
                right: 10,
                top: 10,
                child: RawMaterialButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    constraints:
                        const BoxConstraints(minWidth: 0, minHeight: 0),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: EdgeInsets.zero,
                    fillColor: Theme.of(context)
                        .scaffoldBackgroundColor
                        .withAlpha(200),
                    shape: const CircleBorder(),
                    child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Icon(Icons.close,
                            color: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.color
                                ?.withAlpha(200)))),
              ),
            ],
          ),
        ));
  }
}

class ScaleNotifierInteractiveViewer extends StatefulWidget {
  final String imageUrl;
  final TransformationController controller;
  final void Function(double) onScaleChanged;

  const ScaleNotifierInteractiveViewer({
    super.key,
    required this.imageUrl,
    required this.controller,
    required this.onScaleChanged,
  });

  @override
  State<StatefulWidget> createState() => ScaleNotifierInteractiveViewerState();
}

class ScaleNotifierInteractiveViewerState
    extends State<ScaleNotifierInteractiveViewer> {
  var scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.height * 0.95,
        child: InteractiveViewer(
          // ピンチイン・ピンチアウト終了後の処理
          transformationController: widget.controller,
          onInteractionEnd: (details) {
            scale = widget.controller.value.getMaxScaleOnAxis();
            widget.onScaleChanged(scale);
          },
          child: NetworkImageView(
            url: widget.imageUrl,
            type: ImageType.image,
          ),
        ));
  }
}