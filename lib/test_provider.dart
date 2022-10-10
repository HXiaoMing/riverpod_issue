import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final roomDetailProvider =
    StateNotifierProvider<_RoomDetailStateNotifier, int>((ref) {
  final roomId = ref.watch(roomIdProvider);
  return _RoomDetailStateNotifier(roomId);
});

class _RoomDetailStateNotifier extends StateNotifier<int> {
  final int _roomId;

  _RoomDetailStateNotifier(this._roomId) : super(0) {
    print('RoomDetailStateNotifier init roomId $_roomId');
    requestRoomDetail(_roomId);
  }

  void requestRoomDetail(int roomId) {
    ///use roomId do something, such requestRoomDetail
  }

  @override
  void dispose() {
    print('RoomDetailStateNotifier dispose roomId $_roomId');
    super.dispose();
  }
}

final roomIdProvider = StateNotifierProvider<_RoomIdStateNotifier, int>((ref) {
  return _RoomIdStateNotifier();
});

class _RoomIdStateNotifier extends StateNotifier<int> {
  Timer? _timer;
  int _roomId = 0;

  _RoomIdStateNotifier() : super(0) {
    _timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      state = (_roomId++);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }
}
