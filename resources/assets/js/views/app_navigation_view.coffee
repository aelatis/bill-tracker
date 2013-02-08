namespace 'BillTracker.Views', (exports) ->

  class exports.AppNavigationView extends Backbone.View

    events:
      "click .menuBtn": "_itemSelected"

    initialize: ->
      @navigationList =

    #
    # Private
    #

    _itemSelected: (item) ->
      #if !item.hasClass "selected"
