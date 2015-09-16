gulp     = require 'gulp'
sequence = require 'gulp-sequence'

gulp.task 'build', sequence('clean', [
	'move'
	'jade'
	'stylus'
	'browserify'
])
