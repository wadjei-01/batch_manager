import 'package:bloc_test/src/core/cubits/batch/batch_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final blocProvider =<BlocProvider> [BlocProvider<BatchCubit>(create: (BuildContext context) => BatchCubit()),];
