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