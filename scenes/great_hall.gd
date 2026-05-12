extends Node3D

@export var wall_block: PackedScene
@export var roof_arc: PackedScene
@export var roof_windows: PackedScene
@export var roof_tilesonly: PackedScene
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

		var roof_arc_instance = roof_arc.instantiate()
		roof_arc_instance.position = Vector3(23.083 + (i * offset), 16.229, -22.348)
		roof_arc_instance.scale = Vector3(1, 1, 0.9)
		add_child(roof_arc_instance)

		#front roof
		var roof_windows_instance = roof_windows.instantiate()
		roof_windows_instance.position = Vector3(25.005 + (i * offset), 15.902,-17.853)
		roof_windows_instance.scale = Vector3(0.445, 0.445, 0.445)
		roof_windows_instance.rotation_degrees.y = -90
		roof_windows_instance.rotation_degrees.z = -6.2
		add_child(roof_windows_instance)

		#back roof
		var backroof_windows_instance = roof_windows.instantiate()
		roof_windows_instance.position = Vector3(25.005 + (i * offset), 15.902,-26.5)
		roof_windows_instance.scale = Vector3(0.445, 0.445, -0.445)
		roof_windows_instance.rotation_degrees.y = 90
		roof_windows_instance.rotation_degrees.z = -6.2
		add_child(roof_windows_instance)


		#front tilestroof
		var tilestroof_instance = roof_tilesonly.instantiate()
		tilestroof_instance.position = Vector3(30.01 + (i * offset), 15.902,-17.98)
		tilestroof_instance.scale = Vector3(0.445, 0.445, 0.445)
		tilestroof_instance.rotation_degrees.y = -90
		tilestroof_instance.rotation_degrees.z = -6.2
		add_child(tilestroof_instance)

		#back tilestroof
		var backtilestroof_instance = roof_windows.instantiate()
		backtilestroof_instance.position = Vector3(30.01 + (i * offset), 15.902,-26.5)
		backtilestroof_instance.scale = Vector3(0.445, 0.445, -0.445)
		backtilestroof_instance.rotation_degrees.y = 90
		backtilestroof_instance.rotation_degrees.z = -6.2
		add_child(backtilestroof_instance)

		var instance_b = wall_block.instantiate()
		instance_b.scale.z = -1
		instance_b.position = Vector3(24.202 + (i * offset), 0, -29.811)
		add_child(instance_b)
