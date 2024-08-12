extends Node3D

@onready var rc_car = $rc_car
@onready var finish_point = $finish_point
@onready var ai_controller_3d = $AIController3D

func reset():
	rc_car.position = Vector3(-20,0,-20)
	rc_car.linear_velocity = Vector3.ZERO
	rc_car.rotation = Vector3(0,45,0)
	finish_point.position = Vector3(randi_range(-10,22),0,randi_range(-10,22))
	

func _ready():
	reset()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_finish_point_body_entered(_body):
	ai_controller_3d.reward += 0.5 #positive reward for finish line
	reset()


func _on_wall_3_body_entered(_body):
	ai_controller_3d.reward -= 1.0
	reset()


func _on_wall_4_body_entered(_body):
	ai_controller_3d.reward -= 1.0
	reset()


func _on_wall_2_body_entered(_body):
	ai_controller_3d.reward -= 1.0
	reset()


func _on_wall_body_entered(_body):
	ai_controller_3d.reward -= 1.0
	reset()
