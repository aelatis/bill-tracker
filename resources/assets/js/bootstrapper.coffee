namespace 'BillTracker', (exports) ->

  class exports.Bootstrapper

    constructor: (options = {}) ->
      @successCallback = options.success
      @errorCallback = options.error

      @expenses = new BillTracker.Collections.Expenses
      @expenses.fetch
        success: (model, response) ->
          console.log(model)
        error: (model, response) ->
          console.log("fail!")

      @successCallback.call(this)
      #@errorCallback.call(this)
      #success = false
      #if success
      #  @successCallback.call(this)
      #else
      #  @errorCallback.call(this)
