import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../const/colors.dart';

import '../../const/route_const.dart';

class ForumScreen extends StatelessWidget {
  const ForumScreen({super.key});
  final String text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
      " Nullam molestie consequat diam vel porttitor. Cras dictum "
      "quis nibh nec tristique. Nulla at semper augue. In tellus velit,"
      " auctor at eros eu, dictum lobortis lacus. Etiam accumsan purus "
      "tellus, at consectetur nulla viverra eleifend. Maecenas accumsan, "
      "arcu eget fringilla rhoncus, justo augue laoreet ex, eget posuere "
      "diam diam hendrerit enim. Orci varius natoque penatibus et magnis "
      "dis parturient montes, nascetur ridiculus mus.";

  @override
  Widget build(BuildContext context) {
    CollectionReference reference =
        FirebaseFirestore.instance.collection('forum');

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: StudyBuddy.primaryColor,
        onPressed: () => Navigator.pushNamed(context, addForumRoute),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: const Icon(
          Icons.add,
          color: StudyBuddy.whiteColor,
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Forum",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: reference.snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Align(
                  alignment: Alignment.center,
                  child: LoadingAnimationWidget.waveDots(
                      color: StudyBuddy.primaryColor, size: 33.sp),
                );

              case ConnectionState.active:
                final data = snapshot.data!.docs;
                return data.isNotEmpty
                    ? SingleChildScrollView(
                        child: Column(
                            children: List.generate(
                                data.length,
                                (index) => CustomForumWidget(
                                      title: data[index]["title"],
                                      description: data[index]["description"],
                                      image: data[index]["image"],
                                    ))),
                      )
                    : const Center(
                        child: Text(
                        "No Data!",
                        style: TextStyle(
                            color: StudyBuddy.primaryColor, fontSize: 20),
                      ));
              default:
            }
            return const SizedBox();
          }),
    );
  }
}

class CustomForumWidget extends StatelessWidget {
  const CustomForumWidget(
      {super.key,
      required this.title,
      required this.description,
      this.image = ""});

  final String title;
  final String description;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    maxRadius: 13,
                    backgroundImage: AssetImage('assets/images/study.jpg'),
                  ),
                  Text("  sudipKc"),
                  Text(
                    " 1d",
                    style: TextStyle(color: StudyBuddy.greyColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                description,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                style:
                    const TextStyle(fontSize: 14, color: StudyBuddy.greyColor),
              ),
            ],
          ),
        ),
        image.isNotEmpty
            ? Container(
                height: 400,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/study.jpg"))),
              )
            : const SizedBox(),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconContainer(
                icon: Icon(
                  Icons.messenger_outline_rounded,
                  size: 14,
                ),
                count: "0",
              ),
              IconContainer(
                icon: Icon(
                  Icons.share_outlined,
                  size: 14,
                ),
                count: "share",
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 0.5,
          color: StudyBuddy.greyColor,
        ),
      ],
    );
  }
}

class IconContainer extends StatelessWidget {
  final Icon icon;
  final String count;
  const IconContainer({
    super.key,
    required this.icon,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(width: 1, color: StudyBuddy.greyColor)),
      child: Row(
        children: [
          icon,
          const SizedBox(
            width: 10,
          ),
          Text(
            count.toString(),
            style: const TextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }
}
