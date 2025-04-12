extends Node3D


func _on_start_pressed():
	if get_tree().change_scene_to_file("res://scenes/levels/1.tscn") == OK:
		SpeedrunTimer.reset_timer()


func _on_speed_run_toggled(button_pressed):
	SpeedrunTimer.show_timer = button_pressed
