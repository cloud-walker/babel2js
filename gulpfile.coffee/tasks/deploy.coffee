gulp   = require 'gulp'
config = require '../config'

gulp.task 'deploy', ->
	gulp.src "#{config.dest}/**"
		.pipe gulp.dest('.')
