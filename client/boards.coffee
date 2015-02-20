Template.board.helpers
  tasks: ()->
    console.log "Gettin board tasks", this
    App.Tasks.find board: @_id

  hasLeft: ()->
    App.Boards.findOneBefore @position

  hasRight: ()->  
    App.Boards.findOneAfter @position
    
Template.board.events
  "submit .new-task": (event)->
    event.preventDefault()
    taskName = event.target.name.value
    console.log "Creating task #{taskName} in", @_id
    taskData = name: taskName, board: @_id
    App.Tasks.insert taskData, (error, _id)=>
      console.log "Task was created in board #{@_id} with _id: #{_id}"
      event.target.name.value = "" 
    
  "click .right": (event)->
    event.preventDefault()
    rightBoard = App.Boards.findOneAfter @position
    targetPosition = rightBoard.position

  
  "click .left": (event)->
    event.preventDefault()
    console.log "LEFT!"