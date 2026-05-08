extends Node3D

@export var box_scene: PackedScene
@export var count: int = 12
@export var offset: float = 4.5
func _ready():
	if box_scene == null:
		print("ERROR: missing box scene!")
		return


	for i in range(count):
		var instance_a = box_scene.instantiate()
		instance_a.position = Vector3(i * offset, 0, 0)
		add_child(instance_a)

		var instance_b = box_scene.instantiate()
		instance_b.rotation_degrees.y = 180
		instance_b.position = Vector3(i * offset, 0, -15)
		add_child(instance_b)
