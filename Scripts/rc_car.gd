extends VehicleBody3D

@onready var f_lwheel = $FLwheel
@onready var b_lwheel = $BLwheel
@onready var f_rwheel = $FRwheel
@onready var b_rwheel = $BRwheel

@onready var ai_controller_3d = $"../AIController3D"

@export var MaxEnginePow = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	f_lwheel.engine_force = ai_controller_3d.controls[0] * MaxEnginePow
	f_lwheel.engine_force = ai_controller_3d.controls[1] * -MaxEnginePow
	f_rwheel.engine_force = ai_controller_3d.controls[2] * MaxEnginePow
	f_rwheel.engine_force = ai_controller_3d.controls[3] * -MaxEnginePow
	

