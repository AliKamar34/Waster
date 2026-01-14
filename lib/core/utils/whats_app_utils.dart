import 'package:url_launcher/url_launcher.dart';

class WhatsAppUtils {
  static Future<void> openWhatsApp({
    required String phoneNumber,
    required String fullName,
  }) async {
    final phone = phoneNumber.replaceAll('+', '').replaceAll(' ', '');

    if (phone.length < 10) throw 'Phone number seems invalid';

    final message =
        'Hello $fullName, I am contacting you regarding the claimed post.';

    final Uri url = Uri.parse(
      'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}',
    );

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw Exception(' Could not launch WhatsApp');
    }
  }
}
