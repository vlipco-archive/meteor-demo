App = 
	Tasks: new Mongo.Collection "tasks"
	Boards: new Mongo.Collection "boards"
	

window.App = App if Meteor.isClient