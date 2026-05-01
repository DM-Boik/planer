extends Area3D

var DoorState = false
var DoorStateOld = false
var animation_path : NodePath = ("../../../AnimationPlayer")

func activate():
	DoorState =! DoorState
	if DoorState != DoorStateOld:
		if DoorState == true:
			$"../PlayerAnim".play("door_open")
		else:
			$"../PlayerAnim".play("door_close")
		DoorStateOld = DoorState
