// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TaskEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Task task) addTask,
    required TResult Function(String taskId) markTaskCompleted,
    required TResult Function() loadTasks,
    required TResult Function(String message) showError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Task task)? addTask,
    TResult? Function(String taskId)? markTaskCompleted,
    TResult? Function()? loadTasks,
    TResult? Function(String message)? showError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Task task)? addTask,
    TResult Function(String taskId)? markTaskCompleted,
    TResult Function()? loadTasks,
    TResult Function(String message)? showError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddTaskEvent value) addTask,
    required TResult Function(_MarkTaskCompletedEvent value) markTaskCompleted,
    required TResult Function(_LoadTasksEvent value) loadTasks,
    required TResult Function(_ShowErrorEvent value) showError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddTaskEvent value)? addTask,
    TResult? Function(_MarkTaskCompletedEvent value)? markTaskCompleted,
    TResult? Function(_LoadTasksEvent value)? loadTasks,
    TResult? Function(_ShowErrorEvent value)? showError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddTaskEvent value)? addTask,
    TResult Function(_MarkTaskCompletedEvent value)? markTaskCompleted,
    TResult Function(_LoadTasksEvent value)? loadTasks,
    TResult Function(_ShowErrorEvent value)? showError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskEventCopyWith<$Res> {
  factory $TaskEventCopyWith(TaskEvent value, $Res Function(TaskEvent) then) =
      _$TaskEventCopyWithImpl<$Res, TaskEvent>;
}

/// @nodoc
class _$TaskEventCopyWithImpl<$Res, $Val extends TaskEvent>
    implements $TaskEventCopyWith<$Res> {
  _$TaskEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AddTaskEventImplCopyWith<$Res> {
  factory _$$AddTaskEventImplCopyWith(
          _$AddTaskEventImpl value, $Res Function(_$AddTaskEventImpl) then) =
      __$$AddTaskEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Task task});
}

/// @nodoc
class __$$AddTaskEventImplCopyWithImpl<$Res>
    extends _$TaskEventCopyWithImpl<$Res, _$AddTaskEventImpl>
    implements _$$AddTaskEventImplCopyWith<$Res> {
  __$$AddTaskEventImplCopyWithImpl(
      _$AddTaskEventImpl _value, $Res Function(_$AddTaskEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
  }) {
    return _then(_$AddTaskEventImpl(
      null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
    ));
  }
}

/// @nodoc

class _$AddTaskEventImpl implements _AddTaskEvent {
  const _$AddTaskEventImpl(this.task);

  @override
  final Task task;

  @override
  String toString() {
    return 'TaskEvent.addTask(task: $task)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddTaskEventImpl &&
            (identical(other.task, task) || other.task == task));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddTaskEventImplCopyWith<_$AddTaskEventImpl> get copyWith =>
      __$$AddTaskEventImplCopyWithImpl<_$AddTaskEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Task task) addTask,
    required TResult Function(String taskId) markTaskCompleted,
    required TResult Function() loadTasks,
    required TResult Function(String message) showError,
  }) {
    return addTask(task);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Task task)? addTask,
    TResult? Function(String taskId)? markTaskCompleted,
    TResult? Function()? loadTasks,
    TResult? Function(String message)? showError,
  }) {
    return addTask?.call(task);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Task task)? addTask,
    TResult Function(String taskId)? markTaskCompleted,
    TResult Function()? loadTasks,
    TResult Function(String message)? showError,
    required TResult orElse(),
  }) {
    if (addTask != null) {
      return addTask(task);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddTaskEvent value) addTask,
    required TResult Function(_MarkTaskCompletedEvent value) markTaskCompleted,
    required TResult Function(_LoadTasksEvent value) loadTasks,
    required TResult Function(_ShowErrorEvent value) showError,
  }) {
    return addTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddTaskEvent value)? addTask,
    TResult? Function(_MarkTaskCompletedEvent value)? markTaskCompleted,
    TResult? Function(_LoadTasksEvent value)? loadTasks,
    TResult? Function(_ShowErrorEvent value)? showError,
  }) {
    return addTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddTaskEvent value)? addTask,
    TResult Function(_MarkTaskCompletedEvent value)? markTaskCompleted,
    TResult Function(_LoadTasksEvent value)? loadTasks,
    TResult Function(_ShowErrorEvent value)? showError,
    required TResult orElse(),
  }) {
    if (addTask != null) {
      return addTask(this);
    }
    return orElse();
  }
}

abstract class _AddTaskEvent implements TaskEvent {
  const factory _AddTaskEvent(final Task task) = _$AddTaskEventImpl;

  Task get task;

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddTaskEventImplCopyWith<_$AddTaskEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MarkTaskCompletedEventImplCopyWith<$Res> {
  factory _$$MarkTaskCompletedEventImplCopyWith(
          _$MarkTaskCompletedEventImpl value,
          $Res Function(_$MarkTaskCompletedEventImpl) then) =
      __$$MarkTaskCompletedEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String taskId});
}

/// @nodoc
class __$$MarkTaskCompletedEventImplCopyWithImpl<$Res>
    extends _$TaskEventCopyWithImpl<$Res, _$MarkTaskCompletedEventImpl>
    implements _$$MarkTaskCompletedEventImplCopyWith<$Res> {
  __$$MarkTaskCompletedEventImplCopyWithImpl(
      _$MarkTaskCompletedEventImpl _value,
      $Res Function(_$MarkTaskCompletedEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
  }) {
    return _then(_$MarkTaskCompletedEventImpl(
      null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MarkTaskCompletedEventImpl implements _MarkTaskCompletedEvent {
  const _$MarkTaskCompletedEventImpl(this.taskId);

  @override
  final String taskId;

  @override
  String toString() {
    return 'TaskEvent.markTaskCompleted(taskId: $taskId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkTaskCompletedEventImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskId);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkTaskCompletedEventImplCopyWith<_$MarkTaskCompletedEventImpl>
      get copyWith => __$$MarkTaskCompletedEventImplCopyWithImpl<
          _$MarkTaskCompletedEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Task task) addTask,
    required TResult Function(String taskId) markTaskCompleted,
    required TResult Function() loadTasks,
    required TResult Function(String message) showError,
  }) {
    return markTaskCompleted(taskId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Task task)? addTask,
    TResult? Function(String taskId)? markTaskCompleted,
    TResult? Function()? loadTasks,
    TResult? Function(String message)? showError,
  }) {
    return markTaskCompleted?.call(taskId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Task task)? addTask,
    TResult Function(String taskId)? markTaskCompleted,
    TResult Function()? loadTasks,
    TResult Function(String message)? showError,
    required TResult orElse(),
  }) {
    if (markTaskCompleted != null) {
      return markTaskCompleted(taskId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddTaskEvent value) addTask,
    required TResult Function(_MarkTaskCompletedEvent value) markTaskCompleted,
    required TResult Function(_LoadTasksEvent value) loadTasks,
    required TResult Function(_ShowErrorEvent value) showError,
  }) {
    return markTaskCompleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddTaskEvent value)? addTask,
    TResult? Function(_MarkTaskCompletedEvent value)? markTaskCompleted,
    TResult? Function(_LoadTasksEvent value)? loadTasks,
    TResult? Function(_ShowErrorEvent value)? showError,
  }) {
    return markTaskCompleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddTaskEvent value)? addTask,
    TResult Function(_MarkTaskCompletedEvent value)? markTaskCompleted,
    TResult Function(_LoadTasksEvent value)? loadTasks,
    TResult Function(_ShowErrorEvent value)? showError,
    required TResult orElse(),
  }) {
    if (markTaskCompleted != null) {
      return markTaskCompleted(this);
    }
    return orElse();
  }
}

abstract class _MarkTaskCompletedEvent implements TaskEvent {
  const factory _MarkTaskCompletedEvent(final String taskId) =
      _$MarkTaskCompletedEventImpl;

  String get taskId;

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MarkTaskCompletedEventImplCopyWith<_$MarkTaskCompletedEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadTasksEventImplCopyWith<$Res> {
  factory _$$LoadTasksEventImplCopyWith(_$LoadTasksEventImpl value,
          $Res Function(_$LoadTasksEventImpl) then) =
      __$$LoadTasksEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadTasksEventImplCopyWithImpl<$Res>
    extends _$TaskEventCopyWithImpl<$Res, _$LoadTasksEventImpl>
    implements _$$LoadTasksEventImplCopyWith<$Res> {
  __$$LoadTasksEventImplCopyWithImpl(
      _$LoadTasksEventImpl _value, $Res Function(_$LoadTasksEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadTasksEventImpl implements _LoadTasksEvent {
  const _$LoadTasksEventImpl();

  @override
  String toString() {
    return 'TaskEvent.loadTasks()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadTasksEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Task task) addTask,
    required TResult Function(String taskId) markTaskCompleted,
    required TResult Function() loadTasks,
    required TResult Function(String message) showError,
  }) {
    return loadTasks();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Task task)? addTask,
    TResult? Function(String taskId)? markTaskCompleted,
    TResult? Function()? loadTasks,
    TResult? Function(String message)? showError,
  }) {
    return loadTasks?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Task task)? addTask,
    TResult Function(String taskId)? markTaskCompleted,
    TResult Function()? loadTasks,
    TResult Function(String message)? showError,
    required TResult orElse(),
  }) {
    if (loadTasks != null) {
      return loadTasks();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddTaskEvent value) addTask,
    required TResult Function(_MarkTaskCompletedEvent value) markTaskCompleted,
    required TResult Function(_LoadTasksEvent value) loadTasks,
    required TResult Function(_ShowErrorEvent value) showError,
  }) {
    return loadTasks(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddTaskEvent value)? addTask,
    TResult? Function(_MarkTaskCompletedEvent value)? markTaskCompleted,
    TResult? Function(_LoadTasksEvent value)? loadTasks,
    TResult? Function(_ShowErrorEvent value)? showError,
  }) {
    return loadTasks?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddTaskEvent value)? addTask,
    TResult Function(_MarkTaskCompletedEvent value)? markTaskCompleted,
    TResult Function(_LoadTasksEvent value)? loadTasks,
    TResult Function(_ShowErrorEvent value)? showError,
    required TResult orElse(),
  }) {
    if (loadTasks != null) {
      return loadTasks(this);
    }
    return orElse();
  }
}

abstract class _LoadTasksEvent implements TaskEvent {
  const factory _LoadTasksEvent() = _$LoadTasksEventImpl;
}

/// @nodoc
abstract class _$$ShowErrorEventImplCopyWith<$Res> {
  factory _$$ShowErrorEventImplCopyWith(_$ShowErrorEventImpl value,
          $Res Function(_$ShowErrorEventImpl) then) =
      __$$ShowErrorEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ShowErrorEventImplCopyWithImpl<$Res>
    extends _$TaskEventCopyWithImpl<$Res, _$ShowErrorEventImpl>
    implements _$$ShowErrorEventImplCopyWith<$Res> {
  __$$ShowErrorEventImplCopyWithImpl(
      _$ShowErrorEventImpl _value, $Res Function(_$ShowErrorEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ShowErrorEventImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ShowErrorEventImpl implements _ShowErrorEvent {
  const _$ShowErrorEventImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'TaskEvent.showError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowErrorEventImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowErrorEventImplCopyWith<_$ShowErrorEventImpl> get copyWith =>
      __$$ShowErrorEventImplCopyWithImpl<_$ShowErrorEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Task task) addTask,
    required TResult Function(String taskId) markTaskCompleted,
    required TResult Function() loadTasks,
    required TResult Function(String message) showError,
  }) {
    return showError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Task task)? addTask,
    TResult? Function(String taskId)? markTaskCompleted,
    TResult? Function()? loadTasks,
    TResult? Function(String message)? showError,
  }) {
    return showError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Task task)? addTask,
    TResult Function(String taskId)? markTaskCompleted,
    TResult Function()? loadTasks,
    TResult Function(String message)? showError,
    required TResult orElse(),
  }) {
    if (showError != null) {
      return showError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddTaskEvent value) addTask,
    required TResult Function(_MarkTaskCompletedEvent value) markTaskCompleted,
    required TResult Function(_LoadTasksEvent value) loadTasks,
    required TResult Function(_ShowErrorEvent value) showError,
  }) {
    return showError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddTaskEvent value)? addTask,
    TResult? Function(_MarkTaskCompletedEvent value)? markTaskCompleted,
    TResult? Function(_LoadTasksEvent value)? loadTasks,
    TResult? Function(_ShowErrorEvent value)? showError,
  }) {
    return showError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddTaskEvent value)? addTask,
    TResult Function(_MarkTaskCompletedEvent value)? markTaskCompleted,
    TResult Function(_LoadTasksEvent value)? loadTasks,
    TResult Function(_ShowErrorEvent value)? showError,
    required TResult orElse(),
  }) {
    if (showError != null) {
      return showError(this);
    }
    return orElse();
  }
}

abstract class _ShowErrorEvent implements TaskEvent {
  const factory _ShowErrorEvent(final String message) = _$ShowErrorEventImpl;

  String get message;

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShowErrorEventImplCopyWith<_$ShowErrorEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TaskState {
  List<Task> get tasks => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskStateCopyWith<TaskState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskStateCopyWith<$Res> {
  factory $TaskStateCopyWith(TaskState value, $Res Function(TaskState) then) =
      _$TaskStateCopyWithImpl<$Res, TaskState>;
  @useResult
  $Res call({List<Task> tasks, bool isLoading, String? errorMessage});
}

/// @nodoc
class _$TaskStateCopyWithImpl<$Res, $Val extends TaskState>
    implements $TaskStateCopyWith<$Res> {
  _$TaskStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskStateImplCopyWith<$Res>
    implements $TaskStateCopyWith<$Res> {
  factory _$$TaskStateImplCopyWith(
          _$TaskStateImpl value, $Res Function(_$TaskStateImpl) then) =
      __$$TaskStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Task> tasks, bool isLoading, String? errorMessage});
}

/// @nodoc
class __$$TaskStateImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$TaskStateImpl>
    implements _$$TaskStateImplCopyWith<$Res> {
  __$$TaskStateImplCopyWithImpl(
      _$TaskStateImpl _value, $Res Function(_$TaskStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$TaskStateImpl(
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TaskStateImpl implements _TaskState {
  const _$TaskStateImpl(
      {final List<Task> tasks = const [],
      this.isLoading = false,
      this.errorMessage})
      : _tasks = tasks;

  final List<Task> _tasks;
  @override
  @JsonKey()
  List<Task> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'TaskState(tasks: $tasks, isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskStateImpl &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_tasks), isLoading, errorMessage);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskStateImplCopyWith<_$TaskStateImpl> get copyWith =>
      __$$TaskStateImplCopyWithImpl<_$TaskStateImpl>(this, _$identity);
}

abstract class _TaskState implements TaskState {
  const factory _TaskState(
      {final List<Task> tasks,
      final bool isLoading,
      final String? errorMessage}) = _$TaskStateImpl;

  @override
  List<Task> get tasks;
  @override
  bool get isLoading;
  @override
  String? get errorMessage;

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskStateImplCopyWith<_$TaskStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
