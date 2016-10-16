# app/assets/javascripts/components/amount_box.js.coffee

@AmountBox = React.createClass
	render: ->
	  React.DOM.div
	    className: 'col-xs-4'
	    React.DOM.div
	      className: "panel panel-#{ @props.type }"
	      React.DOM.div
	        className: 'panel-heading'
	        @props.text
	      React.DOM.div
	        className: 'panel-body'
	        amountFormat(@props.amount)