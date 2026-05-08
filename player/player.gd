extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var camera_sensitivity = 0.8
var rotationX = 0.0
var rotationY = 0.0
var rotationZ = 0.0
@export var camera: Camera3D

func _ready() -> void:
	Input.mouse_mode == Input.MOUSE_MODE_CAPTURED

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		return;
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()


func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		if Input.is_key_pressed(KEY_A):
			rotationX -= camera_sensitivity
		if Input.is_key_pressed(KEY_D):
			rotationX += camera_sensitivity
		if Input.is_key_pressed(KEY_W):
			rotationY += camera_sensitivity
		if Input.is_key_pressed(KEY_S):
			rotationY -= camera_sensitivity
		
		rotation_degrees.y = rotationX
		camera.rotation_degrees.x = rotationY
	
	
	
	
	
