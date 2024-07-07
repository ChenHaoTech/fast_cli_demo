import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart' hide Feedback;
import 'package:fast_cli_demo/app/constants.dart';
import 'package:fast_cli_demo/app/services.dart';
import 'package:fast_cli_demo/app/text_theme.dart';
import 'package:fast_cli_demo/features/feedback/models/feedback.dart';
import 'package:fast_cli_demo/features/shared/ui/layout.dart';

@RoutePage()
class FeedbackView extends StatefulWidget {
  const FeedbackView({Key? key}) : super(key: key);

  @override
  State<FeedbackView> createState() => _FeedbackViewState();
}

class _FeedbackViewState extends State<FeedbackView> {
  List<Feedback> allFeedback = [];

  ValueNotifier<bool> loading = ValueNotifier(false);

  void setLoading(bool val) {
    loading.value = val;
  }

  @override
  void initState() {
    setLoading(true);
    feedbackService.getLatestFeedback().then((value) {
      setState(() {
        allFeedback = value;
        setLoading(false);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Feedback')),
      body: Layout(
        child: loading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: allFeedback.length,
                itemBuilder: (BuildContext context, int index) {
                  Feedback feedback = allFeedback[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            feedback.message,
                            style: context.bodyLarge,
                          ),
                          gap8,
                          Text(
                            MaterialLocalizations.of(context)
                                .formatFullDate(feedback.createdAt!)
                                .toString(),
                            style: context.bodySmall,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
