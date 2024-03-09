// api/chat_api.dart
import 'package:dart_openai/dart_openai.dart';
import 'package:leaf_check/chat_message.dart';
import 'package:leaf_check/secrets.dart';

class ChatApi {
  static const _model = 'gpt-3.5-turbo';

  ChatApi() {
    OpenAI.apiKey = openAiApiKey;
  }

  Future<String> completeChat(List<ChatMessage> messages) async {
    final chatCompletion = await OpenAI.instance.chat.create(
      model: _model,
      messages: messages
          .map((e) => OpenAIChatCompletionChoiceMessageModel(
        role: e.isUserMessage
            ? OpenAIChatMessageRole.user
            : OpenAIChatMessageRole.assistant,
        content: e.content,
      ))
          .toList(),
    );
    return chatCompletion.choices.first.message.content;
  }
}
