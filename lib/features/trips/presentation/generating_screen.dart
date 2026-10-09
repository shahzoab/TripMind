import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/design/design_tokens.dart';
import '../../../core/widgets/app_error_state.dart';
import 'trip_providers.dart';

class GeneratingScreen extends ConsumerStatefulWidget {
  const GeneratingScreen({super.key});

  @override
  ConsumerState<GeneratingScreen> createState() => _GeneratingScreenState();
}

class _GeneratingScreenState extends ConsumerState<GeneratingScreen> {
  @override
  Widget build(BuildContext context) {
    final palette = DesignPalette.of(context);
    final generation = ref.watch(generationProvider);

    ref.listen(generationProvider, (previous, next) {
      next.whenData((id) {
        if (!context.mounted) return;
        context.go(AppRouter.tripPath(id));
      });
    });

    return Scaffold(
      backgroundColor: palette.surface,
      body: SafeArea(
        child: generation.when(
          loading: () => const _CyclingMessages(),
          error: (error, _) => AppErrorState(
            message: error.toString(),
            onRetry: () => ref.invalidate(generationProvider),
          ),
          data: (_) => const _CyclingMessages(),
        ),
      ),
    );
  }
}

class _CyclingMessages extends StatefulWidget {
  const _CyclingMessages();

  @override
  State<_CyclingMessages> createState() => _CyclingMessagesState();
}

class _CyclingMessagesState extends State<_CyclingMessages> {
  static const _messages = [
    'Reading the destination',
    'Matching the pace you picked',
    'Laying out the days',
    'Checking the route',
  ];

  int _index = 0;

  @override
  void initState() {
    super.initState();
    _advance();
  }

  Future<void> _advance() async {
    while (mounted) {
      await Future<void>.delayed(const Duration(milliseconds: 1400));
      if (!mounted) return;
      setState(() => _index = (_index + 1) % _messages.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    final palette = DesignPalette.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: DesignSpacing.margin),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          child: Text(
            _messages[_index],
            key: ValueKey(_messages[_index]),
            textAlign: TextAlign.center,
            style: DesignType.headlineMd.copyWith(color: palette.onSurface),
          ),
        ),
      ),
    );
  }
}
