gulp   = require 'gulp'
watch  = require 'gulp-watch'
stylus = require 'gulp-stylus'
sync   = require 'browser-sync'
config = require '../config'

gulp.task 'stylus', ->
	gulp.src "#{config.src}/index.styl"
		.pipe stylus()
		.pipe gulp.dest(config.dest)
		.pipe sync.reload(stream: true)

gulp.task 'stylus:watch', ->
	watch "#{config.src}/index.styl", ->
		gulp.start 'stylus'
