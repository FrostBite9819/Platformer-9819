extends StaticBody2D

func _ready():
	hide()
	add_to_group("borders2")
	pass
func _physics_process(delta):
	print("hey")