{CompositeDisposable} = require 'atom'

module.exports = DpI18n =
  subscriptions: null

  activate: (state) ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace',
      'dp-i18n:i18n': => @convert()

  deactivate: ->
    @subscriptions.dispose()

  convert: ->
    if editor = atom.workspace.getActiveTextEditor()
      selectedText = editor.getSelectedText()
//      words = selectedText.split(' ', 6);
//      if words.length > 5
//        words = words.slice(0, -1);

//      i18n_key = words.join('_');
//      i18n_key = i18n_key.toUpperCase();
//      i18n_key = i18n_key.replace(/[^A-Za-z0-9_]+/gi, '');
//      newText = '{{#i18n "' + i18n_key + '"}}' + selectedText + '{{/i18n}}';
      newText = '{{#i18n}}' + selectedText + '{{/i18n}}';
      return editor.insertText(newText);
