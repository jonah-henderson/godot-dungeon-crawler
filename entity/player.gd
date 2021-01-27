extends KinematicBody2D


export(int) var speed := 64

var velocity := Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	get_input()
	
func get_input():
	var movementDirection := Vector2.ZERO
	
	if Input.is_action_pressed("ui_up"):
		movementDirection += Vector2.UP
	if Input.is_action_pressed("ui_down"):
		movementDirection += Vector2.DOWN
	if Input.is_action_pressed("ui_left"):
		movementDirection += Vector2.LEFT
	if Input.is_action_pressed("ui_right"):
		movementDirection += Vector2.RIGHT
		
	movementDirection = movementDirection.normalized() * speed
		
	$DirectionalMover.move_in_direction(movementDirection)
	
func receiveDamage(amount: int):
	$HealthEntity.takeDamage(amount)

func _onDeath():
	$DirectionalMover.stop()
	set_physics_process(false)
	print("You are dead")

func _on_Hitbox_body_entered(body):
	if body.has_method("getDamage"):
		$HealthEntity.takeDamage(body.getDamage())
		$AnimationPlayer.play("damaged")
		$Label.text = str($HealthEntity.currentHealth)
