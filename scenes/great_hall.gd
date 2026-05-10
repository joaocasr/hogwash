extends Node3D

@export var wall_block: PackedScene
@export var roof_arc: PackedScene
@export var count: int = 12
@export var offset: float = 4.5
@export var arc_initpos: float = 4.5
func _ready():
	if wall_block == null or roof_arc == null:
		print("ERROR: missing assigning the scenes!")
		return

	for i in range(count):
		var instance_a = wall_block.instantiate()
		instance_a.position = Vector3(24.202 + (i * offset), 0, -14.811)
		add_child(instance_a)

		var roof_instance = roof_arc.instantiate()
		roof_instance.position = Vector3(23.083 + (i * offset), 16.229, -22.348)
		roof_instance.scale = Vector3(1, 1, 0.9)
		add_child(roof_instance)

		var instance_b = wall_block.instantiate()
		instance_b.scale.z = -1
		#instance_b.rotation_degrees.y = 180
		instance_b.position = Vector3(24.202 + (i * offset), 0, -29.811)
		add_child(instance_b)
