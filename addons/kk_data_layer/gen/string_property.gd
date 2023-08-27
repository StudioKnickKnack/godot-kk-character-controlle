extends Resource
class_name StringProperty

signal value_changed(v)

@export
var value: String : get = _get_value, set = _set_value

func _get_value() -> String:
	return value

func _set_value(new_value: String) -> void:
	if value == new_value:
		return
	
	value = new_value
	value_changed.emit(new_value)

func _init(default_value: String) -> void:
	value = default_value

func subscribe(observer) -> void:
	value_changed.connect(observer)
	observer.call(value)

func unsubscribe(observer) -> void:
	value_changed.disconnect(observer)
