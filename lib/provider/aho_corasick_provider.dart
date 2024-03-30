import 'package:aho_corasick/aho_corasick.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'aho_corasick_provider.g.dart';

@Riverpod(keepAlive: true)
AhoCorasick ahoCorasick(AhoCorasickRef ref, List<String> words) {
  return AhoCorasick.fromWordList(words);
}
