namespace 'BillTracker.Models', (exports) ->

  class exports.Expense extends Backbone.Model

    defaults:
      "title": "nil",
      "amount": 0,
      "due": 0,
      "complete": false,
      "enabled": false

    constructor: ->
      console.log "Initiated expense model"
