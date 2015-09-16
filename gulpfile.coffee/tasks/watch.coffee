gulp = require 'gulp'

gulp.task 'watch', [
	'move:watch'
	'jade:watch'
	'stylus:watch'
	'watchify'
]
