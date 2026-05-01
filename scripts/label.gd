extends Label

@onready var aero_body: VehicleBody3D = $"../../../.."

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	text = "
		speed: %-.1fm/s
	" % [
		aero_body.air_speed
	]
