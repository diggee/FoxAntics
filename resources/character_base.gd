extends CharacterBody2D
class_name CharacterBase

@export var stats: Stats

var current_health: int
var current_stamina: int

@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var hitbox: Area2D = $Hitbox
@onready var hurtbox: Area2D = $Hurtbox

func _ready():
	current_health = stats.max_health
	current_stamina = stats.max_stamina

func take_damage(amount: int, damage_type: String = ""):
	var final_damage = amount
	match damage_type:
		"bleed": final_damage *= (1.0 - stats.resistance_bleed)
		"poison": final_damage *= (1.0 - stats.resistance_poison)
		"fire": final_damage *= (1.0 - stats.resistance_fire)
		"frost": final_damage *= (1.0 - stats.resistance_frost)
	current_health = max(0, current_health - int(final_damage))
	if current_health <= 0:
		die()

func die():
	queue_free()
