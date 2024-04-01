import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../i18n/strings.g.dart';
import '../../../model/account.dart';
import '../../../provider/api/user_lists_provider.dart';
import '../../widget/error_message.dart';

class UserLists extends ConsumerWidget {
  const UserLists({
    super.key,
    required this.account,
    required this.userId,
  });

  final Account account;
  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lists = ref.watch(userListsProvider(account, userId));

    return RefreshIndicator(
      onRefresh: () => ref.refresh(userListsProvider(account, userId).future),
      child: lists.when(
        data: (lists) {
          if (lists.isEmpty) {
            return Center(child: Text(t.misskey.noLists));
          } else {
            return ListView.separated(
              itemBuilder: (context, index) => ListTile(
                title: Text(lists[index].name ?? ''),
                subtitle:
                    Text(t.misskey.nUsers(n: lists[index].userIds.length)),
                onTap: () => context
                    .push('/$account/users/$userId/list/${lists[index].id}'),
              ),
              separatorBuilder: (_, __) => const Divider(height: 0.0),
              itemCount: lists.length,
            );
          }
        },
        error: (e, st) => ErrorMessage(error: e, stackTrace: st),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}