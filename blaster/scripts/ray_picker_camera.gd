extends Camera3D

@export var grid_map: GridMap
@onready var ray_cast: RayCast3D = $ray_cast

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	var mouse_position: Vector2 = get_viewport().get_mouse_position()
	ray_cast.target_position = project_local_ray_normal(mouse_position) * 20.0
	ray_cast.force_raycast_update()

	if ray_cast.is_colliding():
		var collider = ray_cast.get_collider()

		if collider is GridMap:
			var collision_point = ray_cast.get_collision_point()
			var cell = grid_map.local_to_map(collision_point)
			grid_map.set_cell_item(cell, 1)

		printt(collider, ray_cast.get_collision_point())