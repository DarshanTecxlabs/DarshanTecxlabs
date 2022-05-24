import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/test_socket_bloc.dart';

class WebSocketTest extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  WebSocketTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        onPressed: () {
          context.read<TestSocketBloc>().add(Send(_controller.text));
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _controller,
              ),
              Container(
                child: BlocBuilder<TestSocketBloc, TestSocketState>(
                  builder: (context, state) {
                    if (state is TestSocketInitial)
                      return StreamBuilder(
                          stream: state.data,
                          builder: (context, snapshot) => snapshot.hasData
                              ? Text(snapshot.data.toString())
                              : Text("NO Data"));
                    return Container();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
