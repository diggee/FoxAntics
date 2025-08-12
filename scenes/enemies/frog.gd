extends enemy_base

@onready var jump_timer: Timer = $JumpTimer

var is_jumping: bool = false
var is_visible: bool = false

func _ready() -> void:
	super._ready()
	jump_timer.timeout.connect(on_timer_timeout)
	
	
func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	velocity.y += gravity * delta
	
	if is_jumping:
		velocity.x = -speed if !animated_sprite_2d.flip_h else speed
	else:
		velocity.x = 0
	
	move_and_slide()
	change_direction()
	
	
func on_screen_entered():
	is_visible = true
	jump_timer.start()
	
	
func on_screen_exited():
	is_visible = false
	animated_sprite_2d.animation = 'idle'
	
	
func on_timer_timeout():
	if is_visible:
		animated_sprite_2d.play('jump')
		is_jumping = true
		velocity.y = -250  # jump velocity
		await animated_sprite_2d.animation_finished
		is_jumping = false
		animated_sprite_2d.play('idle')
		jump_timer.wait_time = randf_range(1.0, 2.0)
		jump_timer.start()
	
	
func change_direction():
	animated_sprite_2d.flip_h = _player_ref.global_position.x > global_position.x
