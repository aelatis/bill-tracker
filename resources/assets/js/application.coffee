namespace 'BillTracker', (exports) ->

  class Application

    constructor: ->
      #@errorView = new BillTracker.Views.AppStateView("error")

      bootstrapper = new BillTracker.Bootstrapper
        success: =>
          @boot()

        error: =>
          $(".initial-loading-indicator").remove()
          @errorView.render()

      bootstrapper.fetch()

    boot: ->
      BillTracker.keyboardManager = new KeyboardManager()

      $(".inital-loading-indicator").remove()
      @errorView.destroy()
      $("#app-content").css({display: "block"})

      @appNavigation = new BillTracker.Views.AppNavigationView({
        el: document.getElementById("app-navigation")
      })
      @appNavigation.render()

      match = Backbone.history.start { pushState: true }

      # Show "Expenses" if no route already
      BillTracker.stateManager.transitionTo("expenses") unless match

  exports.App = new Application() # Initialize app
