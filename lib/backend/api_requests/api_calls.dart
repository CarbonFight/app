import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class SendEmailCall {
  static Future<ApiCallResponse> call({
    String emailbody = '',
    String emailsendername = '',
  }) {
    final body = '''
{
  "personalizations": [
    {
      "to": [
        {
          "email": "pierre.freund@gmail.com",
          "name": "Pierre Freund"
        }
      ],
      "subject": "Carbonfight APP Notification"
    }
  ],
  "content": [
    {
      "type": "text/plain",
      "value": "${emailbody}"
    }
  ],
  "from": {
    "email": "notifications@carbonfight.app",
    "name": "${emailsendername}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SendEmail',
      apiUrl: 'https://api.sendgrid.com/v3/mail/send',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer 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',
      },
      params: {
        'emailbody': emailbody,
        'emailsendername': emailsendername,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}
