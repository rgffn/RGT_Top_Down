extends Control

func _ready():
	for button in get_tree().get_nodes_in_group("button"):
		button.connect("pressed",Callable(self,"on_button_pressed").bind(button))
		button.connect("mouse_exited",Callable(self,"mouse_interaction").bind(button, "exited"))
		button.connect("mouse_entered",Callable(self,"mouse_interaction").bind(button, "entered"))
		
		#button.connect("pressed", self, "on_button_pressed", [button])
		#button.connect("mouse_exited", self, "mouse_interaction", [button, "exited"])
		#button.connect("mouse_entered", self, "mouse_interaction", [button, "entered"])
		
func on_button_pressed(button: Button):
	match button.name:
		"Play":
			var _game: bool = get_tree().change_scene("res://levels/scenes/test_level.tscn")
			
		"Controls":
			var _mic: bool = get_tree().change_scene("res://components/interface/controls.tscn")
			
		"Configuration":
			var _controls: bool = get_tree().change_scene("res://components/interface/configuration.tscn")
			
		"RobertGomes":
			var _open_channel: bool = OS.shell_open("https://steamcommunity.com/id/rgffn")
			
		"Quit":
			get_tree().quit()
			
func mouse_interaction(button: Button, state: String):
	match state:
		"exited":
			button.modulate.a = 1.0
			
		"entered":
			button.modulate.a = 0.5
		
		
		
