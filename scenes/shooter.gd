extends Node2D
class_name Shooter

@export var speed: float = 50.0
@export var shoot_delay: float = 0.7
@export var bullet_key: = Constants.OBJECT_TYPE.BULLET_PLAYER


@onready var shoot_timer: Timer = $ShootTimer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

var can_shoot: bool = true

func _ready() -> void:
	shoot_timer.timeout.connect(on_shoot_timer_timeout)
	
	shoot_timer.wait_time = shoot_delay
	
	
func shoot(direction: Vector2):
	if !can_shoot:
		return
	can_shoot = false
	print('shoot')
	shoot_timer.start()
		
	
	
func on_shoot_timer_timeout():
	can_shoot = true
