extends Node

signal onDeath
signal onHurt(amount)
signal onGracePeriodExpire

export(int) var maxHealth: int
export(int) var gracePeriod := 3

onready var currentHealth = maxHealth
var invulnerable := false

func _ready():
	print(currentHealth)
	$Timer.wait_time = gracePeriod

func takeDamage(amount: int):
	
	if invulnerable:
		return
		
	print("taking " + str(amount) + " damage")
		
	currentHealth -= amount
	emit_signal("onHurt", amount)
	if currentHealth <= 0:
		emit_signal("onDeath")
		
	if gracePeriod > 0:
		invulnerable = true
		$Timer.start()

func restoreDamage(amount: int):
	currentHealth += amount

func _on_Timer_timeout():
	invulnerable = false
	emit_signal("onGracePeriodExpire")
