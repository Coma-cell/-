extends Node3D


@onready var click_sound = $Click
@export var speed = 10


func _physics_process(delta):
	var position_difference = get_parent().get_node("Player").global_position - global_position
	global_position += position_difference
	
	click_sound.volume_db = -80
	
	for child in get_children():
		if child is Node3D:
			child.global_position -= position_difference
	
	if Input.is_action_pressed("rotate_right"):
		rotation_degrees.z -= speed * delta
		click_sound.volume_db = -20
	
	
	if Input.is_action_pressed("rotate_left"):
		rotation_degrees.z += speed * delta
		click_sound.volume_db = -20
