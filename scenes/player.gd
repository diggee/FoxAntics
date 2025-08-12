extends CharacterBody2D
class_name player

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var debug_label: Label = $DebugLabel
@onready var shooter: Shooter = $Shooter

const GRAVITY: float = 690.0
const JUMP_SPEED: float = -270.0
const RUN_SPEED: float = 100.0
const MAX_FALL_VELOCITY: float = 350.0

func _enter_tree() -> void:
	add_to_group(Constants.PLAYER_GROUP)
	
	
func _ready() -> void:
	update_debug_label()
	
	
func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY * delta
	velocity.y = clamp(velocity.y, JUMP_SPEED, MAX_FALL_VELOCITY)
	velocity.x = Input.get_axis('move_left', 'move_right') * RUN_SPEED
	if !is_equal_approx(velocity.x, 0.0):
		sprite_2d.flip_h = velocity.x < 0
	move_and_slide()
	
	
func _process(delta: float) -> void:
	update_debug_label()
	
	
func _unhandled_input(event: InputEvent) -> void:
	if is_on_floor() and event.is_action_pressed("jump"):
		velocity.y += JUMP_SPEED
	if event.is_action_pressed("shoot"):
		var direction: Vector2 = Vector2.LEFT if sprite_2d.flip_h else Vector2.RIGHT
		shooter.shoot(direction)
		
		
func update_debug_label():
	var debug_string: String = ''
	debug_string += 'On floor: %s' % [is_on_floor()]
	debug_string += '\nV: %.1f,%.1f' % [velocity.x, velocity.y]
	debug_string += '\nP: %.1f,%.1f' % [global_position.x, global_position.y]
	debug_label.text = debug_string
