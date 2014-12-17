'use strict';

var gulp = require('gulp');
var browserify = require('browserify');
var watchify = require('watchify');
var source = require('vinyl-source-stream');
var browserifyShim = require('browserify-shim');
var coffeeify = require('coffeeify');

module.exports = gulp.task('watchify', function () {
  var bundler = browserify({
    cache: {}, packageCache: {}, fullPaths: true,
    entries: [config.paths.src.modules],
    extensions: ['.coffee']
  });
  bundler = watchify(bundler);

  bundler.transform(coffeeify);
  bundler.transform(browserifyShim);

  bundler.on('update', rebundle);

  function rebundle() {
    return bundler.bundle()
      .pipe(source(config.filenames.build.scripts))
      .pipe(gulp.dest(config.paths.dest.build.scripts));
  }

  return rebundle();
});
