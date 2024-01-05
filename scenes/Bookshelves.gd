extends Node


var inBookShelfArea = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if inBookShelfArea && Input.is_action_just_pressed("interact"):
		Game.books["black"] = Game.books["black"] - 1 if Game.books["black"] > 0 else 0


func _on_black_bookshelf_area_2d_body_entered(body):
	if body.name == "Player":
		inBookShelfArea = true


func _on_black_bookshelf_area_2d_body_exited(body):
	if body.name == "Player":
		inBookShelfArea = false
