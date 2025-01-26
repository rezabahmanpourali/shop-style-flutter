import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/auth/screens/login_enter_number_screen.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/statemanagment/global_controller.dart';
import 'package:shop_style/onboard_screen/content/content.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // فایل لوکالیزیشن

class OnbordScreen extends StatefulWidget {
  const OnbordScreen({super.key});

  @override
  State<OnbordScreen> createState() => _OnbordScreenState();
}

class _OnbordScreenState extends State<OnbordScreen> {
  int currentIndex = 0;
  PageController? _controller;
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    _videoController = VideoPlayerController.asset('assets/videos/barber.mp4')
      ..initialize().then((_) {
        setState(() {
          _videoController.play(); // Play video after loading
        });
      })
      ..setLooping(true);
  }

  @override
  void dispose() {
    _controller?.dispose();
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    List<ContentOnboard> contents = getContents(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<GlobalController>(
        builder: (context, globallController, child) {
          return Directionality(
            textDirection: globallController.language == 'fa' ||
                    globallController.language == 'ar'
                ? TextDirection.rtl
                : TextDirection.ltr,
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: contents.length,
                    onPageChanged: (int index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SizedBox(
                            height: globallController.language == 'fa' ||
                                    globallController.language == 'ar'
                                ? height * 0.1
                                : height * 0.0,
                          ),
                          Container(
                            width: double.infinity,
                            height: globallController.language == 'fa' ||
                                    globallController.language == 'ar'
                                ? height * 0.5
                                : height * 0.42,
                            //    SizedBox(
                            //   height: globallController.language == 'fa' ||
                            //           globallController.language == 'ar'
                            //       ? height * 0.1
                            //       : height * 0.0,
                            // ),
                            child: VideoPlayer(_videoController),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          if (globallController.language == 'en' ||
                              globallController.language == 'tr') ...[
                            Padding(
                              padding: EdgeInsets.only(
                                  left: width * 0.01, right: width * 0.01),
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                children: [
                                  Text(
                                    textAlign: TextAlign.center,
                                    contents[index].title3,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(fontSize: 32),
                                  ),
                                  Text(
                                    textAlign: TextAlign.center,
                                    contents[index].title2,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(fontSize: 32),
                                  ),
                                  Text(
                                    textAlign: TextAlign.center,
                                    contents[index].title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(fontSize: 32),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              contents[index].title4,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontSize: 32),
                            ),
                          ],
                          if (globallController.language == 'fa' ||
                              globallController.language == 'ar') ...[
                            Padding(
                              padding: EdgeInsets.only(
                                  left: width * 0.01, right: width * 0.01),
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                children: [
                                  Text(
                                    textAlign: TextAlign.center,
                                    contents[index].title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(fontSize: 32),
                                  ),
                                  Text(
                                    textAlign: TextAlign.center,
                                    contents[index].title2,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(fontSize: 32),
                                  ),
                                  Text(
                                    textAlign: TextAlign.center,
                                    contents[index].title3,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(fontSize: 32),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              contents[index].title4,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontSize: 32),
                            ),
                          ],
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              Text(
                                textAlign: TextAlign.center,
                                contents[index].discription,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(fontSize: 20),
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                contents[index].discription2,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsetsDirectional.only(bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      contents.length,
                      (index) => buildDot(index, context),
                    ),
                  ),
                ),
                currentIndex == contents.length - 1
                    ? GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const LoginEnterNumberPhoneScreen(),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 22),
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: AppColors.purpleOpacity,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!.getAppointmentNow,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller?.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        },
                        child: Container(
                          margin: const EdgeInsetsDirectional.only(bottom: 20),
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(
                            color: AppColors.purpleOpacity,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_forward,
                            color: AppColors.white2,
                          ),
                        ),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }

  AnimatedContainer buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? AppColors.purpleOpacity : Colors.grey,
      ),
    );
  }
}
