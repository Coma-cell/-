extends Camera3D


@export var target_ref = NodePath()
@export var offset = Vector3()
@export var camera_speed = 10
@onready var target = get_node(target_ref)


func _ready():
	global_position = target.global_position + offset


func _physics_process(delta):
	look_at(get_parent().global_position)
	global_position = global_position.move_toward(target.global_position + offset, delta * camera_speed)
