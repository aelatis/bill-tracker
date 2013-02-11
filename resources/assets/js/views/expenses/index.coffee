namespace 'BillTracker.Views.Expenses', (exports) ->

  class exports.Index extends Backbone.View

    el: $('#expenses')

    name: 'resources/./assets/js/./templates/expenses'

    initialize: ->
      @template = HandlebarsTemplates[@name]
      @listenTo(@collection, 'all', @render)

    addOne: (item) ->


    addAll: ->
      @$el.empty()
      @$el.html(@template(expenses: @collection.toJSON()))

    render: ->
      @addAll()
      return this
