gulp       = require 'gulp'
gulpif     = require 'gulp-if'
browserify = require 'browserify'
watchify   = require 'watchify'
sync       = require 'browser-sync'
source     = require 'vinyl-source-stream'
config     = require '../config'

gulp.task 'browserify', ->
	bootstrap()

gulp.task 'watchify', ->
	bootstrap('watch')

bootstrap = (mode) ->
	b = browserify
		cache       : {}
		packageCache: {}
		fullPaths   : true

	if mode is 'watch'
		b = watchify b
		b.on 'update', ->
			compile b, mode

	b.add "#{config.src}/index.coffee"
	b.transform 'coffeeify'
	compile(b, mode)

compile = (b, mode) ->
	b.bundle()
		.pipe source('index.js')
		.pipe gulp.dest(config.dest)
		.pipe gulpif(mode is 'watch', sync.reload(stream: true))
