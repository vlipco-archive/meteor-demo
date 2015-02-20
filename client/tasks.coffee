
		
Template.task.events
	"click .right": (event)->
		event.preventDefault()
		console.log "RIGHT!"	

	
	"click .left": (event)->
		event.preventDefault()
		console.log "LEFT!"
