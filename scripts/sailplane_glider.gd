extends Node3D

func _physics_process(delta: float) -> void:
	$V1_SailplaneGlider_1_Aileron_L.rotation.x = $"../WingL/AileronL".rotation.x
	if get_node_or_null("../WingLMirror/AileronL"):
		$V1_SailplaneGlider_1_Aileron_R.rotation.x = $"../WingLMirror/AileronL".rotation.x
	
