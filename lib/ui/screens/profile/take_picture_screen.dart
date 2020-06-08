import 'package:bla_bla_car_clone/ui/screens/profile/confirm_picture_screen.dart';
import 'package:bla_bla_car_clone/ui/utils/colors.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class TakePictureScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  const TakePictureScreen({
    Key key,
    @required this.cameras,
  });

  @override
  _TakePictureScreenState createState() => _TakePictureScreenState();
}

class _TakePictureScreenState extends State<TakePictureScreen> {
  int indexCamera;

  // Add two variables to the state class to store the CameraController and
  // the Future.
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    indexCamera = 0;
    _initializeCamera();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  void _initializeCamera() {
    setState(
      () {
        // To display the current output from the camera,
        // create a CameraController.
        _controller = CameraController(
          // Get a specific camera from the list of available cameras.
          widget.cameras[indexCamera],
          // Define the resolution to use.
          ResolutionPreset.medium,
        );

        // Next, initialize the controller. This returns a Future.
        _initializeControllerFuture = _controller.initialize();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return Stack(
              children: <Widget>[
                CameraPreview(
                  _controller,
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        if (widget.cameras.length > 1) {
                          if (indexCamera + 1 == widget.cameras.length) {
                            indexCamera = 0;
                          } else {
                            indexCamera++;
                          }

                          _initializeCamera();
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ThemeColors.mainColor,
                        ),
                        child: Icon(
                          Icons.switch_camera,
                          size: 36,
                          color: ThemeColors.backgroundColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        // Take the Picture in a try / catch block. If anything goes wrong,
                        // catch the error.
                        try {
                          // Ensure that the camera is initialized.
                          await _initializeControllerFuture;

                          // Construct the path where the image should be saved using the path
                          // package.
                          final path = join(
                            // Store the picture in the temp directory.
                            // Find the temp directory using the `path_provider` plugin.
                            (await getExternalStorageDirectory()).path,
                            '${DateTime.now()}.png',
                          );

                          // Attempt to take a picture and log where it's been saved.
                          await _controller.takePicture(path);

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ConfirmPictureScreen(
                                imagePath: path,
                              ),
                            ),
                          );
                        } catch (e) {
                          // If an error occurs, log the error to the console.
                          print(e);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ThemeColors.mainColor,
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          size: 36,
                          color: ThemeColors.backgroundColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            // Otherwise, display a loading indicator.
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
