extends Node3D

@onready var rc_car = $rc_car
@onready var finish_point = $finish_point
@onready var ai_controller_3d = $AIController3D

var timereward = 50.0

# variables for random generation of finish point
var radius = 0.0
var angle = 0.0

func reset():
	timereward = 50.0
	radius = randi_range(0,45)
	angle = randi_range(-PI, PI)
	finish_point.position = Vector3(radius * cos(angle),0,radius * sin(angle))
	
	

func _ready():
	reset()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timereward > 1:
		timereward -= delta
		
	#negative reward for distance to finish
	ai_controller_3d.reward -= 0.00001 * delta * ((finish_point.position.x-rc_car.position.x)**2 + (finish_point.position.z-rc_car.position.z)**2)
	

func _on_finish_point_body_entered(_body):
	ai_controller_3d.reward += timereward #positive reward for finish line
	reset()


func _on_area_3d_body_entered(body):
	ai_controller_3d.reward -= 100.0
	rc_car.position = Vector3(0,0,0)
