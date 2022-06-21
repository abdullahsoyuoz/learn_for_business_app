import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_for_business_app/Controller/extension.dart';
import 'package:learn_for_business_app/Model/dummy_course.dart';
import 'package:learn_for_business_app/View/Style/color.dart';
import 'package:learn_for_business_app/View/Widget/customappbar.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:video_player/video_player.dart';

class MyCourseDetailPage extends StatefulWidget {
  const MyCourseDetailPage({Key key, this.data}) : super(key: key);
  final MyCourse data;

  @override
  State<MyCourseDetailPage> createState() => _MyCourseDetailPageState();
}

class _MyCourseDetailPageState extends State<MyCourseDetailPage> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
          ..setLooping(true)
          ..addListener(() {})
          ..initialize().whenComplete(() {
            setState(() {});
          })
          ..play()
        // ..initialize().then((_) {
        //   setState(() {});
        // })
        ;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> initializeVideo() async {}

  @override
  Widget build(BuildContext context) {
    GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();
    return OrientationBuilder(builder: (context, orientation) {
      return Scaffold(
        key: scaffoldKey,
        appBar: orientation == Orientation.portrait
            ? customAppBar(context, 'Derslerim')
            : const PreferredSize(
                preferredSize: Size.fromHeight(0), child: SizedBox()),
        body: SizedBox.expand(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _controller.value.isInitialized
                  ? Column(
                      children: [
                        // TODO: BUNU FULLSCREEN ICIN KULLANDIM. KALDIRACAKSAN:
                        // 50.SATIR -> ORIENTATIONBUILDER
                        // 68.SATIR ITIBAREN IC-ICE OLAN CONSTBOX-CENTER
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: orientation == Orientation.portrait
                                ? context.width / _controller.value.aspectRatio
                                : context.height,
                          ),
                          child: Center(
                            child: AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  VideoPlayer(_controller),
                                  _ControlsOverlay(
                                    controller: _controller,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : SizedBox(
                      width: context.width,
                      child: Center(
                        child: SizedBox(
                          width: context.width * 0.2,
                          height: 200,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppColor.greenDark,
                            ),
                          ),
                        ),
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Text(
                  widget.data.course.title,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        'Kurstaki konumunuz',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Expanded(
                      child: LinearProgressBar(
                        currentStep: 76,
                        maxSteps: 100,
                        progressType: LinearProgressBar
                            .progressTypeLinear, // Use Linear progress
                        progressColor: AppColor.greenDark,
                        backgroundColor: AppColor.greenLight,
                        minHeight: 20,
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(
                    top: 30, left: 20, right: 20, bottom: 120),
                itemCount: widget.data.course.contents.length,
                itemBuilder: (_, index) {
                  final content = widget.data.course.contents[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Material(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(20),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Text(
                                    content,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )),
                                  const FaIcon(FontAwesomeIcons.chevronRight,
                                      color: Colors.grey, size: 20)
                                ],
                              ),
                              const Divider(
                                height: 20,
                              ),
                              const Text('14 dk'),
                            ],
                          ),
                        )),
                  );
                },
              )
            ],
          ),
        )),
      );
    });
  }
}

class _ControlsOverlay extends StatefulWidget {
  const _ControlsOverlay({Key key, this.controller}) : super(key: key);
  final VideoPlayerController controller;

  @override
  State<_ControlsOverlay> createState() => _ControlsOverlayState();
}

class _ControlsOverlayState extends State<_ControlsOverlay> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: widget.controller.value.isPlaying
              ? const SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: const Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                      semanticLabel: 'Play',
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            widget.controller.value.isPlaying
                ? widget.controller.pause()
                : widget.controller.play();
            setState(() {});
          },
        ),
      ],
    );
  }
}
