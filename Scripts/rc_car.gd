extends VehicleBody3D

@onready var ai_controller_3d = $"../AIController3D"

@export var MaxEnginePow = 500


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	engine_force = ai_controller_3d.controls[0] * MaxEnginePow
	steering = ai_controller_3d.controls[1]
	

