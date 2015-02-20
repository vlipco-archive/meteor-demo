App = 
	Tasks: new Mongo.Collection "tasks"
	Boards: new Mongo.Collection "boards"
	
App.Boards.findOneAfter = (position)->
  App.Boards.findOne {position: {$gt: position}}, {sort: {position: 1}}

App.Boards.findOneBefore = (position)->
  App.Boards.findOne {position: {$lt: position}}, {sort: {position: 1}}

window.App = App if Meteor.isClient