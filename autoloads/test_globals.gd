# autoload for testing MCP variable overrides
extends Node

# these can be set via MCP overrides parameter
var debug_mode: bool = false
var test_value: int = 0
var test_string: String = "default"


func _ready() -> void:
	print("[TestGlobals] Initialized")
	print("[TestGlobals] debug_mode = %s" % debug_mode)
	print("[TestGlobals] test_value = %d" % test_value)
	print("[TestGlobals] test_string = %s" % test_string)
