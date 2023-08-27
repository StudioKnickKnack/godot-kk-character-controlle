extends Resource
class_name Vector3Property

signal value_changed(v)

@export
var value: Vector3 : get = _get_value, set = _set_value

func _get_value() -> Vector3:
	return value

func _set_value(new_value: Vector3) -> void:
	if value == new_value:
		return
	
	value = new_value
	value_changed.emit(new_value)

func _init(default_value: Vector3) -> void:
	value = default_value

func subscribe(observer) -> void:
	value_changed.connect(observer)
	observer.call(value)

func unsubscribe(observer) -> void:
	value_changed.disconnect(observer)
