extends Node2D

tool
class_name DirectionalMover

export(NodePath) var target: NodePath

var targetNode: KinematicBody2D
var movementVector := Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	if not targetNode == null:
		return
	if target.is_empty():
		var parent := get_parent()
		if parent is KinematicBody2D:
			targetNode = get_parent()
		# else assume someone else is configuring us properly
			
	else:
		print("Setting target " + str(target))
		targetNode = get_node(target)

func move_in_direction(direction: Vector2):
	movementVector = direction
	
func stop():
	move_in_direction(Vector2.ZERO)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	if not Engine.editor_hint:
		movementVector = targetNode.move_and_slide(movementVector, Vector2.UP)

func _get_configuration_warning():
	if !targetNode is KinematicBody2D:
			return "DirectionalMover must control a KinematicBody2D"
	return ""
