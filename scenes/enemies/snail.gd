extends enemy_base

@onready var ray_cast_2d: RayCast2D = $RayCast2D


func _physics_process(delta: float) -> void:
	super._physics_process(delta)   # to invoke the _physics_process of the parent script
	velocity.y += delta * gravity
	velocity.x = speed if animated_sprite_2d.flip_h == true else -speed
	
	move_and_slide()
	change_direction()
	
	
func change_direction():
	if is_on_wall() or !ray_cast_2d.is_colliding():
		animated_sprite_2d.flip_h = !animated_sprite_2d.flip_h
		ray_cast_2d.position.x = -ray_cast_2d.position.x
