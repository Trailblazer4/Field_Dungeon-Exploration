extends Entity

var tracking_index = 44
var direction = Vector2(0, 0)

func _physics_process(delta):
	#if velocity == Vector2.ZERO:
		#get_child(0).face(direction)
	#else:
		#get_child(0).walk(velocity)
	pass

func _on_party_1_history_updated(position_history):
	if (position_history.size() < tracking_index + 1):
		return
	var past_position = position_history[tracking_index]
	velocity = position.direction_to(Vector2(past_position["x"], past_position["y"])) * past_position["Speed"]
	move_and_slide()
