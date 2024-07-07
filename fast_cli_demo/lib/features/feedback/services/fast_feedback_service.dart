import 'package:fast_cli_demo/features/feedback/models/feedback.dart';
import 'package:fast_cli_demo/features/feedback/ui/new_feedback/new_feedback_view.dart';

abstract class FastFeedbackService {
  Future<void> submitFeedback(String feedback, FeedbackType type);

  Future<List<Feedback>> getLatestFeedback();
}
