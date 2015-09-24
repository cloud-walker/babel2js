$        = require 'jquery'
mirror   = require 'codemirror/lib/codemirror.js'
jsSyntax = require 'codemirror/mode/javascript/javascript.js'
babel    = require 'babel-core'
# require('malihu-custom-scrollbar-plugin') $

console.log 'JS Working'

$ ->
	babelCode   = 'class Animal {}'
	babelEditor = mirror $('#babel .editor')[0], value: babelCode
	jsEditor    = mirror $('#js .output')[0],
		value   : babel.transform(babelCode).code
		readOnly: true

	# $('.output, .editor').mCustomScrollbar()

	babelEditor.on 'change', (e) ->
		jsEditor.setValue babel.transform(babelEditor.getValue()).code

	babelEditor.on 'focus', ->
		$('#babel').addClass 'focused'

	babelEditor.on 'blur', ->
		$('#babel').removeClass 'focused'

	jsEditor.on 'focus', ->
		$('#js').addClass 'focused';

	jsEditor.on 'blur', ->
		$('#js').removeClass 'focused';
