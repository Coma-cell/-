extends VehicleBody3D


@export var next_level = ""

@onready var hit = $Hit
@onready var wind = $Wind
@onready var end = $CanvasLayer/End

var finished = false


func _physics_process(_delta):
	wind.volume_db = clamp(linear_velocity.length() - 30, -80, 5)
	
	if Input.is_key_pressed(KEY_R):
		restart()


func _on_finish_line_detector_area_entered(area):
	finished = true
	
	end.show()
	
	if area.final:
		SpeedrunTimer.stop_timer()
	
	$Finish.play()


func _on_restart_pressed():
	restart()


func restart():
	if get_tree().reload_current_scene() == OK:
		pass


func _on_next_pressed():
	if get_tree().change_scene_to_file(next_level) == OK:
		pass


func _on_body_entered(_body):
	if linear_velocity.length() > 20:
		hit.play()


func _on_bounds_detector_area_exited(_area):
	if not finished:
		restart()
