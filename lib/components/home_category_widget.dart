import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_category_model.dart';
export 'home_category_model.dart';

class HomeCategoryWidget extends StatefulWidget {
  const HomeCategoryWidget({
    super.key,
    required this.icon,
    required this.co2e,
    required this.category,
  });

  final Widget? icon;
  final int? co2e;
  final String? category;

  @override
  _HomeCategoryWidgetState createState() => _HomeCategoryWidgetState();
}

class _HomeCategoryWidgetState extends State<HomeCategoryWidget> {
  late HomeCategoryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeCategoryModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          context.pushNamed(
            'actions',
            queryParameters: {
              'category': serializeParam(
                widget.category,
                ParamType.String,
              ),
            }.withoutNulls,
          );
        },
        child: Container(
          width: 84.0,
          height: 68.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: const [
              BoxShadow(
                blurRadius: 3.0,
                color: Color(0x33000000),
                offset: Offset(0.0, 3.0),
              )
            ],
            borderRadius: BorderRadius.circular(10.0),
          ),
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.icon!,
                Text(
                  valueOrDefault<String>(
                    functions.pS(widget.co2e),
                    '-',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Montserrat',
                        fontSize: 18.0,
                      ),
                ),
                Text(
                  valueOrDefault<String>(
                    widget.category == 'Electroménager'
                        ? 'Electro'
                        : widget.category,
                    'Trajets',
                  ),
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Montserrat',
                        fontSize: 10.0,
                      ),
                ),
              ].divide(const SizedBox(height: 1.0)),
            ),
          ),
        ),
      ),
    );
  }
}
