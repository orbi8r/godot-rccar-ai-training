extends VehicleBody3D

@onready var f_lwheel = $FLwheel
@onready var b_lwheel = $BLwheel
@onready var f_rwheel = $FRwheel
@onready var b_rwheel = $BRwheel

@export var MaxEnginePow = 500

var Lpower = 0.0
var Ldir = 0.0
var Rpower = 0.0
var Rdir = 0.0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
#region Tank steering for Left side
	
	if Input.is_action_just_pressed("Lforward"):
		if Lpower <= 0:
			Lpower = 0
			Ldir = 1
			
	elif Input.is_action_just_pressed("Lbackward"):
		if Lpower >= 0:
			Lpower = 0
			Ldir = -1
			
	elif Input.is_action_just_released("Lforward") or Input.is_action_just_released("Lbackward"):
		Lpower = 0
		Ldir = 0
	
	#steadily increases power
	if Lpower < 1 and Lpower > -1:
		Lpower += delta * Ldir
	
	f_lwheel.engine_force = Lpower * MaxEnginePow
	b_lwheel.engine_force = f_lwheel.engine_force
	
#endregion
	
#region Tank steering for Right side
	
	if Input.is_action_just_pressed("Rforward"):
		if Rpower <= 0:
			Rpower = 0
			Rdir = 1
			
	elif Input.is_action_just_pressed("Rbackward"):
		if Rpower >= 0:
			Rpower = 0
			Rdir = -1
			
	elif Input.is_action_just_released("Rforward") or Input.is_action_just_released("Rbackward"):
		Rpower = 0
		Rdir = 0
	
	#steadily increases power
	if Rpower < 1 and Rpower > -1:
		Rpower += delta * Rdir
	
	f_rwheel.engine_force = Rpower * MaxEnginePow
	b_rwheel.engine_force = f_rwheel.engine_force
	
#endregion

