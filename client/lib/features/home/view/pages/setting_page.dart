import 'package:client/core/providers/current_user_notifier.dart';
import 'package:client/core/theme/app_pallete.dart';
import 'package:client/features/auth/repositories/auth_local_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingPage extends ConsumerStatefulWidget {
  const SettingPage({super.key});

  @override
  ConsumerState<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends ConsumerState<SettingPage> {
  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserNotifierProvider);

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserSettingCard(
                  title: currentUser!.name,
                  iconData: Icons.person,
                ),
                const SizedBox(
                  height: 10,
                ),
                UserSettingCard(
                  title: currentUser.email,
                  iconData: Icons.email,
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ref.watch(authLocalRepositoryProvider).removeToken();
                  ref.watch(currentUserNotifierProvider.notifier).removeUser();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Log out',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UserSettingCard extends StatelessWidget {
  const UserSettingCard({
    super.key,
    required this.title,
    required this.iconData,
  });

  final String title;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: Pallete.borderColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            iconData,
            size: 16,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(title),
        ],
      ),
    );
  }
}
