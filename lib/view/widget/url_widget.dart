import 'package:flutter/material.dart';

import '../../extension/string_extension.dart';
import '../../util/punycode.dart';
import 'url_sheet.dart';

class UrlWidget extends StatelessWidget {
  const UrlWidget({
    required this.url,
    this.onTap,
    this.style,
    this.scale = 1.0,
    this.opacity = 1.0,
    this.align,
    this.overflow,
    this.maxLines,
  });

  final String url;
  final void Function()? onTap;
  final TextStyle? style;
  final double scale;
  final double opacity;
  final TextAlign? align;
  final TextOverflow? overflow;
  final int? maxLines;

  String _decodeComponent(String encodedComponent) {
    try {
      return Uri.decodeComponent(encodedComponent);
    } catch (_) {
      return encodedComponent;
    }
  }

  String _decodeQueryComponent(String encodedComponent) {
    try {
      return Uri.decodeQueryComponent(encodedComponent);
    } catch (_) {
      // TODO: Decode other encodings.
      return encodedComponent;
    }
  }

  @override
  Widget build(BuildContext context) {
    final url = Uri.parse(this.url);
    final scheme = url.scheme;
    final host = toUnicode(url.host);
    final port = url.port;
    final path = _decodeComponent(url.path);
    final query = _decodeQueryComponent(url.query);
    final fragment = _decodeComponent(url.fragment);
    final style = DefaultTextStyle.of(context).style.merge(this.style);

    return InkWell(
      onTap: onTap,
      onLongPress: () => showModalBottomSheet<void>(
        context: context,
        builder: (context) => UrlSheet(url: this.url),
      ),
      child: Text.rich(
        TextSpan(
          children: [
            if (scheme.isNotEmpty)
              TextSpan(
                text: '$scheme://'.breakAll,
                style:
                    TextStyle(color: style.color?.withOpacity(opacity * 0.5)),
              ),
            TextSpan(
              text: host.breakAll,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            if (url.hasPort) TextSpan(text: ':$port'.breakAll),
            TextSpan(
              text: path.breakAll,
              style: TextStyle(color: style.color?.withOpacity(opacity * 0.8)),
            ),
            if (query.isNotEmpty)
              TextSpan(
                text: '?$query'.breakAll,
                style:
                    TextStyle(color: style.color?.withOpacity(opacity * 0.5)),
              ),
            if (fragment.isNotEmpty)
              TextSpan(
                text: '#$fragment'.breakAll,
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
            WidgetSpan(
              child: Icon(
                Icons.open_in_new,
                color: style.color?.withOpacity(opacity),
                size: style.fontSize! * scale,
              ),
            ),
          ],
        ),
        style: style.apply(
          fontSizeFactor: scale,
          color: style.color?.withOpacity(opacity),
        ),
        textAlign: align,
        overflow: overflow,
        maxLines: maxLines,
        semanticsLabel: url.toString(),
      ),
    );
  }
}