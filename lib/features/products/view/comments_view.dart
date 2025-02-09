import 'package:flutter/material.dart';
import 'package:our_market_admin/core/components/custom_elevated_button.dart';
import 'package:our_market_admin/core/components/custom_text_field.dart';
import 'package:our_market_admin/core/functions/build_custom_app_bar.dart';

class CommentsView extends StatelessWidget {
  const CommentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, "Comments"),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return CommentCard();
        },
      ),
    );
  }
}

class CommentCard extends StatelessWidget {
  CommentCard({
    super.key,
  });
  final TextEditingController replyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 200,
        child: Card(
          child: Column(
            children: [
              const Text(
                "Comment: This is user comment",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Reply: This is a reply",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomField(
                  labelText: "Reply",
                  controller: replyController,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomElevatedButton(onPressed: () {}, child: const Text("Reply"))
            ],
          ),
        ),
      ),
    );
  }
}
