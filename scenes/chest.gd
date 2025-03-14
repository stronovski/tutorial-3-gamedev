extends Node2D

@export var object_scene: PackedScene
var is_player_near: bool = false
var is_opened: bool = false
var animation = "chest_idle"

@onready var anim := $AnimatedSprite2D
@onready var audio := $AudioStreamPlayer2D

func _ready():
	animation = "chest_idle"

	if anim.animation!=animation:
		anim.play(animation)

func _process(delta: float) -> void:
	if is_player_near and Input.is_action_just_pressed("ui_interact"):
		toggle_chest()

func toggle_chest() -> void:
	is_opened = !is_opened
	
	if is_opened:
		print("open")
		animation = "chest_open"
	else:
		print("not open")
		animation = "chest_close"

	audio.play()
	
	print("Current animation:", anim.animation, "| New animation:", animation)

	if anim.animation != animation:
		anim.play(animation)
		print("Playing animation:", animation)

func _on_chest_area_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		print("entered: ", body.name)
		is_player_near = true

func _on_chest_area_body_exited(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		print("exited: ", body.name)
		is_player_near = false


func _on_animated_sprite_2d_animation_finished() -> void:
	if anim.animation == "chest_close":
		anim.play("chest_idle")
		print("Switched to chest_idle")
