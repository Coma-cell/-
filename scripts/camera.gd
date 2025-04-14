extends Camera3D

@export var target_ref = NodePath()
@export var offset = Vector3()
@export var camera_speed = 10

@export var base_fov := 70.0
@export var max_fov := 90.0
@export var max_speed := 100.0
@export var fov_smooth := 5.0

@onready var target = get_node_or_null(target_ref)

func _ready():
	global_position = target.global_position + offset
	fov = base_fov

func _physics_process(delta):
	if target == null:
		return

	# Follow and look
	look_at(get_parent().global_position)
	global_position = global_position.move_toward(target.global_position + offset, delta * camera_speed)

	# Dynamic FOV zoom based on speed
	var speed = 0.0
	if "linear_velocity" in target:
		speed = target.linear_velocity.length()

	var target_fov = lerp(base_fov, max_fov, clamp(speed / max_speed, 0, 1))
	fov = lerp(fov, target_fov, delta * fov_smooth)
