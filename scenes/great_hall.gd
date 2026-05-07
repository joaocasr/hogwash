extends Node3D

@export var box_scene: PackedScene
@export var count: int = 15
@export var offset: float = 4.5
func _ready():
	if box_scene == null:
		print("ERROR: missing box scene!")
		return

	for i in range(count):
		var instance = box_scene.instantiate()
		add_child(instance)
		instance.position = Vector3(i * offset, 0, 0)
