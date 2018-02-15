jQuery ($) ->
  console.log('hello')
  $('.add_fields').each ->
    $this              = $(this)
    insertionNode      = $this.data('association-insertion-node')
    insertionTraversal = $this.data('association-insertion-traversal')

    if (insertionNode)
      if (insertionTraversal)
        insertionNode = $this[insertionTraversal](insertionNode)
      else
        insertionNode = insertionNode == "this" ? $this : $(insertionNode)
    else
      insertionNode = $this.parent()

    insertionNode.bind 'cocoon:after-insert', (e, newContent) ->
      newContent.find('.chzn-select').chosen()
