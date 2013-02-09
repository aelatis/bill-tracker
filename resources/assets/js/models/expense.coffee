namespace 'BillTracker.Models', (exports) ->

  class exports.Expense extends Backbone.Model

    defaults:
      "name": "nil",
      "amount": 0,
      "due": 0,
      "complete": false,
      "enabled": false

    initialize: ->
      console.log "Initiated expense model"
