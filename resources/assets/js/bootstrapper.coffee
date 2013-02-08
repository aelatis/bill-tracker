namespace 'BillTracker', (exports) ->

  class exports.Bootstrapper

    constructor: ->
      @expenses = new BillTracker.Collections.Expenses
      @expenses.fetch

      #success = false
      #if success
      #  @successCallback
      #else
      #  @errorCallback
