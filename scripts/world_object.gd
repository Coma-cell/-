extends Node3D


@onready var pos = position


func _physics_process(_delta):
	position -= get_parent().position
