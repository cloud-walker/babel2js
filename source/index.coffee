$        = require 'jquery'
mirror   = require 'codemirror/lib/codemirror.js'
jsSyntax = require 'codemirror/mode/javascript/javascript.js'
babel    = require 'babel-core'

console.log 'JS Working'

$ ->
	jseditor    = mirror $('#js')[0], value: babel.transform('').code
	babeleditor = mirror $('#babel')[0]

	babeleditor.on 'change', (e) ->
		jseditor.setValue babel.transform(babeleditor.getValue()).code
