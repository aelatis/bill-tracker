namespace 'BillTracker.Collections', (exports) ->

  class exports.Expenses extends Backbone.Collection
    model: BillTracker.Models.Expense,
    url: '/expenses'

    initialize: ->
      console.log("Initialized expenses collection")
