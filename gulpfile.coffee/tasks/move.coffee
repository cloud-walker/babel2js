gulp   = require 'gulp'
watch  = require 'gulp-watch'
sync   = require 'browser-sync'
config = require '../config'

gulp.task 'move', ->
	gulp.src "#{config.src}/favicon.png"
		.pipe gulp.dest(config.dest)
		.pipe sync.reload(stream: true)

gulp.task 'move:watch', ->
	watch "#{config.src}/favicon.png", ->
		gulp.start 'move'
