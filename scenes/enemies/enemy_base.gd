extends CharacterBody2D
class_name enemy_base

const FALL_OFF_y: float = 200.0

@export var points: int = 1
@export var speed: float = 30.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var hitbox: Area2D = $Hitbox
@onready var hurtbox: Area2D = $Hurtbox

var gravity: float = 800.0
var _player_ref: player

func _ready():
	_player_ref = get_tree().get_first_node_in_group(Constants.PLAYER_GROUP)
	if _player_ref == null:
		queue_free()
	visible_on_screen_notifier_2d.screen_entered.connect(on_screen_entered)
	visible_on_screen_notifier_2d.screen_exited.connect(on_screen_exited)
	hitbox.area_entered.connect(on_hitbox_area_entered)
	hurtbox.area_entered.connect(on_hurtbox_area_entered)
	
	
func _physics_process(delta: float) -> void:
	if global_position.y > FALL_OFF_y:
		queue_free()


func on_screen_entered():
	pass
	
	
func on_screen_exited():
	pass
	
	
func on_hitbox_area_entered():
	pass
	
	
func on_hurtbox_area_entered():
	pass
	
	
func die():
	set_physics_process(false)
	queue_free()
