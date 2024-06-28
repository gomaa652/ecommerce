

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'nav_event.dart';
part 'nav_state.dart';
part 'nav_bloc.freezed.dart';

class NavBloc extends Bloc<NavEvent,NavState> {

NavBloc() : super(NavState()); 

}
