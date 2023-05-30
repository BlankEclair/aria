import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miria/model/account.dart';
import 'package:miria/providers.dart';
import 'package:miria/view/common/account_scope.dart';
import 'package:miria/view/common/pushable_listview.dart';
import 'package:miria/view/user_page/user_list_item.dart';
import 'package:misskey_dart/misskey_dart.dart';

class UserSelectDialog extends StatelessWidget {
  final Account account;

  const UserSelectDialog({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return AccountScope(
      account: account,
      child: AlertDialog(
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          child: const UserSelectContent(),
        ),
      ),
    );
  }
}

class UserSelectContent extends ConsumerStatefulWidget {
  const UserSelectContent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      UserSelectContentState();
}

final usersSelectDialogQueryProvider = StateProvider.autoDispose((ref) => "");
final usersSelectDialogOriginProvider =
    StateProvider.autoDispose((ref) => UsersSearchOrigin.combined);

class UserSelectContentState extends ConsumerState<UserSelectContent> {
  final queryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final origin = ref.watch(usersSelectDialogOriginProvider);
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextField(
          controller: queryController,
          autofocus: true,
          decoration: const InputDecoration(prefixIcon: Icon(Icons.search)),
          onSubmitted: (value) {
            ref.read(usersSelectDialogQueryProvider.notifier).state = value;
          },
        ),
        Padding(padding: EdgeInsets.only(bottom: 10)),
        LayoutBuilder(
          builder: (context, constraints) {
            return ToggleButtons(
              isSelected: [
                for (final element in UsersSearchOrigin.values)
                  element == origin
              ],
              constraints: BoxConstraints.expand(
                  width:
                      constraints.maxWidth / UsersSearchOrigin.values.length -
                          Theme.of(context)
                                  .toggleButtonsTheme
                                  .borderWidth!
                                  .toInt() *
                              UsersSearchOrigin.values.length),
              onPressed: (index) {
                ref.read(usersSelectDialogOriginProvider.notifier).state =
                    UsersSearchOrigin.values[index];
              },
              children: [
                for (final element in UsersSearchOrigin.values)
                  Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Text(element.displayName))
              ],
            );
          },
        ),
        const Expanded(
          child: UsersSelectContentList(),
        )
      ],
    );
  }
}

class UsersSelectContentList extends ConsumerWidget {
  const UsersSelectContentList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(usersSelectDialogQueryProvider);
    final origin = ref.watch(usersSelectDialogOriginProvider);

    if (query.isEmpty) {
      return const SizedBox.shrink();
    }

    return PushableListView(
      listKey: ObjectKey(Object.hashAll([
        query,
        origin,
      ])),
      initializeFuture: () async {
        final response = await ref
            .read(misskeyProvider(AccountScope.of(context)))
            .users
            .search(UsersSearchRequest(query: query, origin: origin));
        return response.toList();
      },
      nextFuture: (lastItem, length) async {
        final response = await ref
            .read(misskeyProvider(AccountScope.of(context)))
            .users
            .search(UsersSearchRequest(
              query: query,
              origin: origin,
              offset: length,
            ));
        return response.toList();
      },
      itemBuilder: (context2, item) => UserListItem(
        user: item,
        onTap: () => Navigator.of(context).pop(item),
      ),
    );
  }
}
