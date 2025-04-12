extends Control


@onready var timer = $Panel/Timer
var show_timer = false


func reset_timer():
	timer.time = 0
	
	visible = show_timer


func stop_timer():
	timer.stop_timer()
