extends AIController3D

@onready var rc_car = $"../rc_car"
@onready var finish_point = $"../finish_point"


var controls = [0,0,0,0]

func get_obs() -> Dictionary:
	var obs := [
		finish_point.position.x,
		finish_point.position.z,
		rc_car.position.x,
		rc_car.position.z,
		rc_car.rotation.y,
		rc_car.linear_velocity.x,
		rc_car.linear_velocity.z,
	]
	return {"obs": obs}


func get_reward() -> float:
	return reward


func get_action_space() -> Dictionary:
	return {
		"carcontrol": {"size": 2, "action_type": "continuous"},
	}


func set_action(action) -> void:
	controls[0] = action["carcontrol"][0]
	controls[1] = action["carcontrol"][1]
