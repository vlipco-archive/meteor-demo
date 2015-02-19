Template.body.helpers
	boards: ()->
		console.log 'returning boards!'
		App.Boards.find {}
		
Template.body.events
	"submit #new-board": (event)->
		event.preventDefault()
		boardName = event.target.name.value
		console.log "Creating #{boardName}"
		boardPosition = App.Boards.find({}).count()
		boardData = name: boardName, position: boardPosition
		console.log "Inseting board:", boardData
		App.Boards.insert boardData, (error, _id)=>
			console.log "Board was created with _id: #{_id}"
			event.target.name.value = "" 
		false # prevent form default submission
		
Template.board.helpers
	tasks: ()->
		console.log "Gettin board tasks", this
		App.Tasks.find board: @_id
		
Template.board.events
	"submit .new-task": (event)->
		taskName = event.target.name.value
		console.log "Creating task #{taskName} in", @_id
		taskData = name: taskName, board: @_id
		App.Tasks.insert taskData, (error, _id)=>
			console.log "Task was created in board #{@_id} with _id: #{_id}"
			event.target.name.value = "" 
		false # prevent form submission
		
	"click .right": (event)->
		console.log "RIGHT!"	
		false # prevent default action
	
	"click .left": (event)->
		console.log "LEFT!"
		false # prevent default action
		
Template.task.events
	"click .right": (event)->
		console.log "RIGHT!"	
		false # prevent default action
	
	"click .left": (event)->
		console.log "LEFT!"
		false # prevent default action