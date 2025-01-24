extends AnimatableBody2D

@export var speed: float = 100.0  # Vitesse de descente

func _process(delta):
	position.y += speed*0.6 * delta  # Défilement vers le bas

	# Supprimer la plateforme si elle sort de l'écran
	if position.y > get_viewport_rect().size.y:
		queue_free()

  # Ajouter la plateforme à la scène
