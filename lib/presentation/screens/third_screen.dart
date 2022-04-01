import 'package:bloc_example/logic/blocs/settings_bloc/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ListTile(
              title: const Text('First Setting'),
              trailing: Switch(
                  value: context.select<SettingsBloc, bool>(
                      (bloc) => bloc.state.firstSetting),
                  onChanged: (value) => context
                      .read<SettingsBloc>()
                      .toggleSettings(FirstSettingsEvent(value: value))),
            ),
            ListTile(
              title: const Text('Second Setting'),
              trailing: Switch(
                  value: context.select<SettingsBloc, bool>(
                      (bloc) => bloc.state.secondSetting),
                  onChanged: (value) => context
                      .read<SettingsBloc>()
                      .toggleSettings(SecondSettingsEvent(value: value))),
            ),
            ListTile(
              title: const Text('Third Setting'),
              trailing: Switch(
                  value: context.select<SettingsBloc, bool>(
                      (bloc) => bloc.state.thirdSetting),
                  onChanged: (value) => context
                      .read<SettingsBloc>()
                      .toggleSettings(ThirdSettingsEvent(value: value))),
            ),
            ListTile(
              title: const Text('Fourth Setting'),
              trailing: Switch(
                  value: context.select<SettingsBloc, bool>(
                      (bloc) => bloc.state.fourthSetting),
                  onChanged: (value) => context
                      .read<SettingsBloc>()
                      .toggleSettings(FourthSettingsEvent(value: value))),
            ),
          ],
        ),
      ),
    );
  }
}
