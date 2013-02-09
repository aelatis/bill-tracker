namespace 'BillTracker.Views.Expenses', (exports) ->

  class exports.Index extends Backbone.View

    el: $('#expenses')

    template: $('#expense-row-template')

    initialize: ->
      @template = Handlebars.compile(@template.html())
      @listenTo(@collection, 'all', @render)

    addOne: (item) ->


    addAll: ->
      @$el.empty()
      @$el.html(@template(expenses: @collection.toJSON()))

    render: ->
      @addAll()
      return this
