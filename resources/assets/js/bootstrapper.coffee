namespace 'BillTracker', (exports) ->

  class exports.Bootstrapper

    constructor: (options = {}) ->
      @successCallback = options.success
      @errorCallback = options.error

      #BillTracker.Expenses = new Backbone.Collection
      #BillTracker.ExpensesView = new BillTracker.Views.Expenses.Index(model: BillTracker.Expenses)

      @expenses = new BillTracker.Collections.Expenses
      @expenses.fetch
        success: (collection, response) ->
          console.log(collection.toJSON())
          BillTracker.ExpensesView = new BillTracker.Views.Expenses.Index(collection: collection)
        error: (collection, response) ->
          console.log("Failed to fetch expenses collection " + response)

      @successCallback.call(this)
      #@errorCallback.call(this)
