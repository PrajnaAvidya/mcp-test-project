# main scene script for MCP testing
extends Node3D

# properties visible in remote inspector
@export var player_health: int = 100
@export var player_name: String = "TestPlayer"
@export var is_alive: bool = true
@export var position_offset: Vector3 = Vector3.ZERO

var frame_count: int = 0


func _ready() -> void:
	print("[Main] Scene started")
	print("[Main] Testing output capture...")

	# connect button signals
	var warning_btn := $CanvasLayer/UI/VBoxContainer/WarningButton
	var error_btn := $CanvasLayer/UI/VBoxContainer/ErrorButton
	warning_btn.pressed.connect(_on_warning_pressed)
	error_btn.pressed.connect(_on_error_pressed)


func _process(_delta: float) -> void:
	frame_count += 1
	# periodic output every 60 frames (~1 sec)
	if frame_count % 60 == 0:
		print("[Main] Frame %d" % frame_count)


func _on_warning_pressed() -> void:
	print("[Main] Warning button pressed")
	push_warning("This is a test warning from MCP test project")


func _on_error_pressed() -> void:
	print("[Main] Error button pressed - triggering null access")
	# trigger runtime error for stack trace testing
	var node: Node = null
	node.get_name()  # null access error
