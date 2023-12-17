extends MeshInstance3D

@export var speed = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_surface_override_material(0).uv1_offset.y += delta * speed * -1
	
	if get_surface_override_material(0).uv1_offset.y >= 1:
		get_surface_override_material(0).uv1_offset.y = 0
