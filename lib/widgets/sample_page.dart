import 'package:fluttertoast/fluttertoast.dart';
import 'package:ques_sample/blocs/sample/sample_bloc.dart';
import 'package:ques_sample/blocs/sample/sample_event.dart';
import 'package:ques_sample/blocs/sample/sample_state.dart';
import 'package:ques_sample/importer.dart';
import 'package:ques_sample/repositories/firestore/sample_firestore_repository.dart';

class SamplePage extends StatelessWidget {
  const SamplePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SampleBloc(repository: SampleFirestoreRepositry()),
        child: const _SampleBody(),
      ),
    );
  }
}

class _SampleBody extends StatelessWidget {
  const _SampleBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SampleBloc, SampleState>(
      bloc: BlocProvider.of<SampleBloc>(context)..add(InitEvent()),
      listener: (context, state) {
        // ダイアログ表示
        if (state is SaveProgressState) {
          _showLoadingDialog(context);
        }

        // ダイアログ閉じる
        if (state is SaveSuccessState) {
          Navigator.pop(context);
          Fluttertoast.showToast(msg: "保存が完了しました");
        }
      },
      child: BlocBuilder(
        bloc: BlocProvider.of<SampleBloc>(context),
        condition: (prev, state) {
          // HACK: 保存処理時は画面の再描画がしたくない
          return state is! SaveProgressState && state is! SaveSuccessState;
        },
        builder: (context, state) {
          if (state is DispSuccessState) {
            return _buildSuccess(context);
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _buildSuccess(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("何かしらの入力フォーム"),
        TextFormField(onSaved: (_text) => {}),
        RaisedButton(
          onPressed: () =>
              BlocProvider.of<SampleBloc>(context).add(SaveEvent()),
          child: Text("保存"),
        )
      ],
    );
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return new Dialog(
          child: Container(
            margin: EdgeInsets.all(20.0),
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                new CircularProgressIndicator(),
                new Container(
                    margin: new EdgeInsets.all(10.0), child: new Text("保存中")),
              ],
            ),
          ),
        );
      },
    );
  }
}
