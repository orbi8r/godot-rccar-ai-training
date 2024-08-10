extends AIController3D

@onready var rc_car = $"../rc_car"
@onready var finish_point = $"../finish_point"


var controls = [0,0,0,0]

func get_obs() -> Dictionary:
	var obs := [
		finish_point.position.x - rc_car.position.x,
		finish_point.position.z - rc_car.position.z,
		rc_car.rotation.y,
		rc_car.linear_velocity.x,
		rc_car.linear_velocity.z,
		rc_car.position.x**2 + rc_car.position.z**2
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
