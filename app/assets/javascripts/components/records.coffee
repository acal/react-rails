 # app/assets/javascripts/components/records.js.coffee
@Records = React.createClass
  getInitialState: ->
    records: @props.data
  getDefaultProps: ->
    records: []
  addRecord: (record) ->
    records = React.addons.update(@state.records, { $push: [record] })
    @setState records: records
  credits: ->
    credits = @state.records.filter (val) -> val.amount >= 0
    credits.reduce ((prev, curr) ->
      prev + parseFloat(curr.amount)
    ), 0
  debits: ->
    debits = @state.records.filter (val) -> val.amount < 0
    debits.reduce ((prev, curr) ->
      prev + parseFloat(curr.amount)
    ), 0
  balance: ->
    @debits() + @credits()
  
  deleteRecord: (record) ->
    index = @state.records.indexOf record
    records = React.addons.update(@state.records, { $splice: [[index, 1]] })
    @replaceState records: records
  
  render: ->
    React.DOM.div
      className: 'container records'
      React.DOM.h2
        className: 'title'
        'Records'
      React.DOM.div
        className: 'row'
        React.createElement AmountBox, type: 'success', amount: @credits(), text: 'Credit'
        React.createElement AmountBox, type: 'danger', amount: @debits(), text: 'Debit'
        React.createElement AmountBox, type: 'info', amount: @balance(), text: 'Balance'
      React.createElement RecordForm, handleNewRecord: @addRecord
      React.DOM.hr null
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Date'
            React.DOM.th null, 'Title'
            React.DOM.th null, 'Amount'
            React.DOM.th null, 'Actions'
        React.DOM.tbody null,
          for record in @state.records
            # When we handle dynamic children (in this case, records) we need to provide 
            # a key property to the dynamically generated elements so React won't have a 
            # hard time refreshing our UI, that's why we send key: record.id along with 
            # the actual record when creating Record elements.
            # The call to handleDeleteRecord allows for the record to be deleted from the UI
            # and is prompted by the handleDelete method in the 'record' component
            React.createElement Record, key: record.id, record: record, handleDeleteRecord: @deleteRecord
          
# alternate method in JSX syntax
# render: ->
#    `<div className="records">
#      <h2 className="title"> Records </h2>
#    </div>`