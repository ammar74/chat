import 'package:chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});
  static String id= 'LoadingScreen';

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(kLogo,
              height: 55,
            ),
            const Text('Chat'),
          ],
        ),
      ),
      body: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(color: Colors.white),
            child: SkeletonItem(
                child: Column(
                  children: [
                    Row(
                      children: [
                        const SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                              shape: BoxShape.circle, width: 50, height: 50),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: SkeletonParagraph(
                            style: SkeletonParagraphStyle(
                                lines: 3,
                                spacing: 6,
                                lineStyle: SkeletonLineStyle(
                                  randomLength: true,
                                  height: 10,
                                  borderRadius: BorderRadius.circular(8),
                                  minLength: MediaQuery.of(context).size.width / 6,
                                  maxLength: MediaQuery.of(context).size.width / 3,
                                )),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 12),
                    SkeletonParagraph(
                      style: SkeletonParagraphStyle(
                          lines: 3,
                          spacing: 6,
                          lineStyle: SkeletonLineStyle(
                            randomLength: true,
                            height: 10,
                            borderRadius: BorderRadius.circular(8),
                            minLength: MediaQuery.of(context).size.width / 2,
                          )),
                    ),
                    const SizedBox(height: 12),
                    SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        width: double.infinity,
                        minHeight: MediaQuery.of(context).size.height / 8,
                        maxHeight: MediaQuery.of(context).size.height / 3,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            SkeletonAvatar(
                                style: SkeletonAvatarStyle(width: 20, height: 20)),
                            SizedBox(width: 8),
                            SkeletonAvatar(
                                style: SkeletonAvatarStyle(width: 20, height: 20)),
                            SizedBox(width: 8),
                            SkeletonAvatar(
                                style: SkeletonAvatarStyle(width: 20, height: 20)),
                          ],
                        ),
                        SkeletonLine(
                          style: SkeletonLineStyle(
                              height: 16,
                              width: 64,
                              borderRadius: BorderRadius.circular(8)),
                        )
                      ],
                    )
                  ],
                )),
          ),
        ),
      )
    );
  }
}