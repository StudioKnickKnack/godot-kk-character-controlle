class_name Character
extends CharacterBody3D

@export var data : CharacterData = CharacterData.new()

var handlers : Array[Callable] = []

func register(handler: Callable) -> void:
	print("here be register")
	handlers.push_back(handler)

func unregister(handler: Callable) -> void:
	print("here be unregister")
	handlers.erase(handler)

func invoke_handler(velocity: Vector3, handler: Callable) -> Vector3:
	return handler.call(velocity)

func _enter_tree() -> void:
	data.velocity.subscribe(func(new_velocty: Vector3): print("new velocity in data layer: ", new_velocty))

func _process(delta: float) -> void:
	data.velocity.value = handlers.reduce(invoke_handler, data.velocity.value) as Vector3
