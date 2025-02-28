extends CharacterBody2D

@export var gravity = 600
@export var walk_speed = 200
@export var jump_speed = -400

var jump_count = 0
var dash_speed = 600
var dashing = false
var can_dash = true

var timer = null
var is_double_click = false
var last_input = ""

func _physics_process(delta):
	# double jump implementation
	if not is_on_floor():
		velocity.y += delta * gravity
	else:
		jump_count = 0
		
	if Input.is_action_just_pressed('ui_up') and jump_count < 2:
		jump_count += 1
		velocity.y = jump_speed
	
	# move right and left
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if Input.is_action_pressed("ui_left"):
		$Sprite2D.flip_h = true
		check_double_tap("ui_left")
	elif Input.is_action_pressed("ui_right"):
		$Sprite2D.flip_h = false
		check_double_tap("ui_right")
	else:
		pass
		
	if is_double_click and can_dash:
		dashing = true
		can_dash = false
		$dash_timer.start()
		$dash_again_timer.start()
			
	if is_double_click:
		dashing = true
	
	if dashing:
			velocity.x = direction * dash_speed
	else:
		if direction and Input.is_action_just_pressed:
			velocity.x = direction * walk_speed
		else:
			velocity.x = 0
			
	move_and_slide()

# stop dashing
func _on_dash_timer_timeout() -> void:
	dashing = false

func _on_double_press_timer_timeout() -> void:
	pass # Replace with function body.

func _on_dash_again_timer_timeout() -> void:
	can_dash = true
	
func _ready():
	timer = Timer.new()
	timer.one_shot = true
	timer.wait_time = 0.25
	add_child(timer)
	timer.name = "DoubleClickTimer"
	
func check_double_tap(action_name: String):
	if Input.is_action_just_pressed(action_name):
		if timer.is_stopped():
			is_double_click = false
			last_input = action_name
			timer.start()
		elif last_input == action_name:
			is_double_click = true
			print("Double Tap detected on: ", action_name)
			timer.stop()
