extends Label


var time = 0


func _process(delta):
	time += delta
	text = get_formatted_time()


func get_formatted_time() -> String:
	return str(round(time*100) / 100)


func stop_timer():
	set_process(false)
