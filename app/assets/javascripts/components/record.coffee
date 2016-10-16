# app/assets/javascripts/components/record.js.coffee
# When the delete button gets clicked, 'handleDelete' sends an AJAX request 
# to the server to delete the record in the backend and, after this, 
# it notifies the parent component about this action through the 'handleDeleteRecord' 
# handler available through props, 
# this means we need to adjust the creation of 'Record' elements in the parent component 
# to include the extra property 'handleDeleteRecord'

@Record = React.createClass
    handleDelete: (e) ->
      e.preventDefault()
      # yeah... jQuery doesn't have a $.delete shortcut method
      $.ajax
        method: 'DELETE'
        url: "/records/#{ @props.record.id }"
        dataType: 'JSON'
        success: () =>
          @props.handleDeleteRecord @props.record
    render: ->
      React.DOM.tr null,
        React.DOM.td null, @props.record.date
        React.DOM.td null, @props.record.title
        React.DOM.td null, amountFormat(@props.record.amount)
        React.DOM.td null,
          React.DOM.a
            className: 'btn btn-danger'
            onClick: @handleDelete
            'Delete'