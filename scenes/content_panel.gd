extends TabContainer

func _on_video_pressed():
	current_tab = 0

func _on_audio_pressed():
	current_tab = 1

func _on_controls_pressed():
	current_tab = 2

func _on_credits_pressed():
	current_tab = 3
