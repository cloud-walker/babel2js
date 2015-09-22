$        = require 'jquery'
mirror   = require 'codemirror/lib/codemirror.js'
jsSyntax = require 'codemirror/mode/javascript/javascript.js'

console.log 'JS Working'

$ ->
	jseditor    = mirror $('#js')[0]
	babeleditor = mirror $('#babel')[0]
