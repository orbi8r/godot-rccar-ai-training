extends AIController3D

@onready var rc_car = $"../rc_car"
@onready var finish_point = $"../finish_point"


var controls = [0,0,0,0]

func get_obs() -> Dictionary:
	var obs := [
		rc_car.position.x,
		rc_car.position.z,
		finish_point.position.x,
		finish_point.position.z
	]
	return {"obs": obs}


func get_reward() -> float:
	return reward


func get_action_space() -> Dictionary:
	return {
		"tank_steering": {"size": 4, "action_type": "continuous"},
	}


func set_action(action) -> void:
	controls[0] = action["tank_steering"][0]
	controls[1] = action["tank_steering"][1]
	controls[2] = action["tank_steering"][2]
	controls[3] = action["tank_steering"][3]
