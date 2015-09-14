gulp       = require 'gulp'
browserify = require 'browserify'
watchify   = require 'watchify'
source     = require 'vinyl-source-stream'
config     = require '../config'

gulp.task 'browserify', ->
	browserify entries: ["#{config.src}/index.coffee"]
		.transform('coffeeify')
		.bundle()
		.pipe source('index.js')
		.pipe gulp.dest(config.dest)

gulp.task 'watchify', ->
	watchify entries: ["#{config.src}/index.coffee"]
		.transform('coffeeify')
		.bundle()
		.pipe source('index.js')
		.pipe gulp.dest(config.dest)
