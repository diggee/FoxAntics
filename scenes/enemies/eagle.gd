extends enemy_base

@export var fly_speed: Vector2 = Vector2(35.0, 15.0)

@onready var player_detector: RayCast2D = $PlayerDetector
@onready var direction_timer: Timer = $DirectionTimer


var fly_direction: Vector2 = Vector2.ZERO
var is_visible: bool = false


func _ready() -> void:
	super._ready()
	direction_timer.timeout.connect(on_direction_timer_timeout)
	
	
func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	if is_visible:
		velocity.x = fly_speed.x * fly_direction.x
		velocity.y = fly_speed.y * fly_direction.y
	else:
		velocity = Vector2.ZERO
	
	move_and_slide()
	flip_direction()
	if player_detector.is_colliding():
		print('player collided')
	
	
func on_screen_entered():
	is_visible = true
	fly_direction = (_player_ref.global_position - global_position).normalized()
	direction_timer.start(randf_range(2.0, 3.0))
	
	
func on_screen_exited():
	is_visible = false
	
	
func on_direction_timer_timeout():
	if is_visible:
		fly_direction = (_player_ref.global_position - global_position).normalized()
	direction_timer.start(randf_range(2.0, 3.0))
	
	
func flip_direction():
	animated_sprite_2d.flip_h = _player_ref.global_position.x > global_position.x
	if animated_sprite_2d.flip_h:
		fly_direction = (_player_ref.global_position - global_position).normalized()
