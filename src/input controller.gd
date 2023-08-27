extends Node

@export var character: Character

func _enter_tree() -> void:
	character.register(update_velocity)

func _exit_tree() -> void:
	character.unregister(update_velocity)

func update_velocity(_velocity) -> Vector3:
	var v : Vector3 = Vector3()
	
	if Input.is_action_pressed("game_move_forward"):
		v.z = -1.0
	elif Input.is_action_pressed("game_move_backward"):
		v.z = 1.0
	
	if Input.is_action_pressed("game_move_left"):
		v.x = -1.0
	elif Input.is_action_pressed("game_move_right"):
		v.x = 1.0
	
	return v.normalized()

