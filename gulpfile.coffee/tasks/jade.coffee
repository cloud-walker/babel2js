gulp   = require 'gulp'
jade   = require 'gulp-jade'
watch  = require 'gulp-watch'
sync   = require 'browser-sync'
config = require '../config'

gulp.task 'jade', ->
	gulp.src "#{config.src}/index.jade"
		.pipe jade()
		.pipe gulp.dest(config.dest)
		.pipe sync.reload(stream: true)

gulp.task 'jade:watch', ->
	watch "#{config.src}/index.jade", ->
		gulp.start 'jade'
