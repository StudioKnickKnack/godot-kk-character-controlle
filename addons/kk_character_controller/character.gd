class_name Character
extends CharacterBody3D

@export var data : CharacterData = CharacterData.new()

var handlers : Array[Callable] = []

func register(handler: Callable) -> void:
	handlers.push_back(handler)

func unregister(handler: Callable) -> void:
	handlers.erase(handler)

func invoke_handler(velocity: Vector3, handler: Callable) -> Vector3:
	return handler.call(velocity)

func _process(delta: float) -> void:
	data.velocity.value = handlers.reduce(invoke_handler, data.velocity.value) as Vector3

func _physics_process(delta: float) -> void:
	move_and_collide(data.velocity.value * delta)
	if data.velocity.value.length() > 0:
		self.transform = self.transform.looking_at(self.transform.translated(data.velocity.value).origin, Vector3.UP)
