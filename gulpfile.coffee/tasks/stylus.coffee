gulp       = require 'gulp'
watch      = require 'gulp-watch'
stylus     = require 'gulp-stylus'
strip      = require 'gulp-strip-css-comments'
minify     = require 'gulp-minify-css'
sourcemaps = require 'gulp-sourcemaps'
sync       = require 'browser-sync'
config     = require '../config'

gulp.task 'stylus', ->
	gulp.src "#{config.src}/index.styl"
		.pipe sourcemaps.init()
		.pipe stylus(
			'include css': true
			include: "./node_modules"
		)
		.pipe strip(preserve: false)
		.pipe minify()
		.pipe sourcemaps.write('./')
		.pipe gulp.dest(config.dest)
		.pipe sync.reload(stream: true)

gulp.task 'stylus:watch', ->
	watch "#{config.src}/index.styl", ->
		gulp.start 'stylus'
