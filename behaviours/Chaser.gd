extends Node2D

export(NodePath) var moveTarget: NodePath
export(NodePath) var chaseTarget: NodePath
export(float) var maxSearchRadius := INF
export(float) var minSearchRadius := 0
export(int) var speed := 64

var movedNode: KinematicBody2D
var chasedNode: Node2D

var squaredMaxSearchRadius: float
var squaredMinSearchRadius: float 

# Called when the node enters the scene tree for the first time.
func _ready():
	if moveTarget.is_empty():
		movedNode = get_parent()
	else:
		movedNode = get_node(moveTarget)
		
	chasedNode = get_node(chaseTarget)
	
	$DirectionalMover.targetNode = movedNode
	squaredMaxSearchRadius = pow(maxSearchRadius, 2)
	squaredMinSearchRadius = pow(minSearchRadius, 2)

func _physics_process(_delta):
	var vectorDirection = (chasedNode.global_position - global_position)
	var distanceSquared = vectorDirection.length_squared()
	
	if distanceSquared <= squaredMaxSearchRadius and distanceSquared >= squaredMinSearchRadius:
		var direction = vectorDirection.normalized() * speed
		$DirectionalMover.move_in_direction(direction)
	else:
		$DirectionalMover.stop()
