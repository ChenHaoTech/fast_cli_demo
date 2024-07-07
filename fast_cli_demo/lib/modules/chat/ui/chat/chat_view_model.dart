import 'package:fast_cli_demo/app/services.dart';
import 'package:simple_mvvm/simple_mvvm.dart';
import 'package:flutter/material.dart';

class ChatViewModelBuilder extends ViewModelBuilder<ChatViewModel> {
  const ChatViewModelBuilder({
    super.key,
    required super.builder,
  });

  @override
  State<StatefulWidget> createState() => ChatViewModel();
}

class ChatViewModel extends ViewModel<ChatViewModel> {
  TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    setLoading(true);
    chatService.getMessages().then((value) {
      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
    });
    super.initState();
  }

  static ChatViewModel of_(BuildContext context) =>
      getModel<ChatViewModel>(context);
}
