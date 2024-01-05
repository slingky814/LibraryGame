extends Area2D

var inBookArea = false

func _on_body_entered(body):
	if body.name == "Player":
		inBookArea = true


func _on_body_exited(body):
	if body.name == "Player":
		inBookArea = false

func _process(delta):
	if inBookArea && Input.is_action_just_pressed("interact"):
		Game.books["black"] = Game.books["black"] + 1
