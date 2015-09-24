$        = require 'jquery'
mirror   = require 'codemirror/lib/codemirror.js'
jsSyntax = require 'codemirror/mode/javascript/javascript.js'
babel    = require 'babel-core'

console.log 'JS Working'

$ ->
	babelCode   = 'class Animal {}'
	babelEditor = mirror $('#babel')[0], value: babelCode
	jsEditor    = mirror $('#js')[0], value: babel.transform(babelCode).code

	babelEditor.on 'change', (e) ->
		jsEditor.setValue babel.transform(babelEditor.getValue()).code
