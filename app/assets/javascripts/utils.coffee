# app/assets/javascripts/utils.js.coffee
# This is a helper method to format 'amount' strings
@amountFormat = (amount) ->
    '$ ' + Number(amount).toLocaleString()