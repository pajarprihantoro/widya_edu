import 'package:app_widya_edu/src/core/utils/app_colors.dart';
import 'package:app_widya_edu/src/data/data_source/discussion_data_source.dart';
import 'package:app_widya_edu/src/data/models/discussion_model.dart';
import 'package:app_widya_edu/src/presentation/screen/register.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DiscussionScreen extends StatelessWidget {
  const DiscussionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    String? massageDiscussion;
    TextEditingController textEditingController =
        TextEditingController(text: massageDiscussion);
    return Scaffold(
      backgroundColor: AppColors.lightgrey,
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        title: Text('Diskusi Soal'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding:
              const EdgeInsets.only(top: 20, right: 10, left: 10, bottom: 15),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  height: size.height * 0.8,
                  child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                      stream: DiscussionDataSource().streamDiscussion(),
                      builder: (context, snapshot) {
                        List<DiscussionModel> discussion =
                            (snapshot.data?.docs ?? [])
                                .map((e) => DiscussionModel.fromMap(e.data()))
                                .toList();
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: discussion.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Align(
                                    alignment: discussion[index].email ==
                                            emailUserAktif
                                        ? Alignment.centerRight
                                        : Alignment.centerLeft,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(right: 30, bottom: 2),
                                      child: Text('Saya' ?? nameUserAktif!),
                                    )),
                                Align(
                                  alignment:
                                      discussion[index].email == emailUserAktif
                                          ? Alignment.centerRight
                                          : Alignment.centerLeft,
                                  child: BubbleSpecialThree(
                                    text: '${discussion[index].massage}',
                                    color: AppColors.blue,
                                    tail: true,
                                    textStyle: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            );
                          },
                        );
                      }),
                ),
              ),
              Container(
                height: size.height * 0.1,
                child: TextField(
                  onChanged: (String value) {
                    massageDiscussion = value;
                  },
                  controller: textEditingController,
                  decoration: InputDecoration(
                    hintText: 'Ketuk untuk menulis',
                    hintStyle: TextStyle(color: Colors.grey),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () async {
                        if (massageDiscussion != null &&
                            massageDiscussion!.isNotEmpty) {
                          await DiscussionDataSource().createDiscussion(
                              DiscussionModel(
                                  email: emailUserAktif,
                                  name: nameUserAktif,
                                  pictureUrl: 'http',
                                  timestamp: DateTime.now(),
                                  massage: massageDiscussion!));
                          massageDiscussion = null;
                          textEditingController.clear();
                        }
                      },
                      icon: Icon(Icons.send),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
