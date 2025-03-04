class_name Player
extends CharacterBody2D

@export var move_speed : float = 160.0 
@onready var deal_damage_zone = $atackrange


var attac_type: String
var current_attack: bool
var is_attacking: bool = false 


func _ready():
	current_attack = false

func _physics_process(delta: float) -> void:
	var direction := Vector2.ZERO
	
	
	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	velocity = direction.normalized() * move_speed  
	move_and_slide()
	
	
	if Input.get_action_strength("left_mouse"):
		current_attack = true
		is_attacking = true
		handle_atack_animation("punch")
	

	if direction.x > 0 and not is_attacking:
		$AnimatedSprite2D.play("walk_right")
	if direction.x < 0 and not is_attacking:
		$AnimatedSprite2D.play("walk_left")
	if direction.x == 0 and not is_attacking:
		$AnimatedSprite2D.play("idle")
	if direction.x != 0 and is_attacking:
		if direction.x > 0:
			$AnimatedSprite2D.play("walk_right")
		else:
			$AnimatedSprite2D.play("walk_left")
	


func handle_atack_animation(punch):
	$AnimatedSprite2D.play(punch)


func _input(event):
		
	if event.is_action_pressed("speedplayer"):
		move_speed += 100
	if event.is_action_released("speedplayer"):
		move_speed -= 100
	
