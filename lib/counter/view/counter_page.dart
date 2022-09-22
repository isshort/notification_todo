// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification_todo/counter/counter.dart';
import 'package:notification_todo/l10n/l10n.dart';
import 'package:notification_todo/notification/service.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [CounterText(), NotificationButton()],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().increment(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().decrement(),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class NotificationButton extends StatefulWidget {
  const NotificationButton({
    super.key,
  });

  @override
  State<NotificationButton> createState() => _NotificationButtonState();
}

class _NotificationButtonState extends State<NotificationButton> {
  late final LocalNotificationService service;
  @override
  void initState() {
    super.initState();
    service = LocalNotificationService();
    listenToNotification();
    service.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          key: GlobalKey(),
          onPressed: () {
            service.showNotification(
              id: 3,
              title: 'This my title',
              body: 'This is my bod',
            );
          },
          child: const Text('show notification'),
        ),
        TextButton(
          onPressed: () {
            service.showScheduleNotification(
              id: 3,
              title: 'This my title',
              body: 'This is my bod',
            );
          },
          child: const Text('show schedule notification'),
        ),
        TextButton(
          key: GlobalKey(),
          onPressed: () {
            service.showNotificationPayload(
              id: 3,
              title: 'This my title',
              body: 'This is my bod',
              payload: 'your payload',
            );
          },
          child: const Text('payload notification'),
        ),
      ],
    );
  }

  void listenToNotification() =>
      service.onNotificationClicked.stream.listen(onNotificationListener);

  void onNotificationListener(String? event) {
    if (event != null && event.isNotEmpty) {
      print('payload is $event');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Page2(payload: event),
        ),
      );
    }
  }
}

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = context.select((CounterCubit cubit) => cubit.state);
    return Text('$count', style: theme.textTheme.headline1);
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key, required this.payload});
  final String payload;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: GlobalKey(),
      appBar: AppBar(title: Text('Page2 Title $payload')),
    );
  }
}
