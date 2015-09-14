gulp   = require 'gulp'
jade   = require 'gulp-jade'
config = require '../config'

gulp.task 'jade', ->
	gulp.src "#{config.src}/index.jade"
		.pipe jade()
		.pipe gulp.dest(config.dest)
