extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if event is InputEventKey and event.pressed:
		$AnimationPlayer.play("fade_out")
		yield( $AnimationPlayer, "animation_finished" )
		get_tree().change_scene("res://world.tscn")
