extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var darkNodes = get_tree().get_nodes_in_group("dark")
	
	for node in darkNodes:
		(node as Node2D).modulate = Color(0.2, 0.2, 0.22, 1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
