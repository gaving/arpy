'use strict';

var gulp = require('gulp');
var watch = require('gulp-watch');
var livereload = require('gulp-livereload');
var livereloadServer = livereload(config.ports.livereloadServer);

module.exports = gulp.task('watch', function () {
  //gulp.watch(config.paths.src.livereload).on('change', function (file) {
    //livereloadServer.changed(file.path);
  //});

  watch([config.paths.src.scripts], ['lint']);
  watch([config.paths.src.index], ['index']);
  watch([config.paths.src.templates, config.paths.src.templatesHTML], ['templates']);
  watch([config.paths.src.stylesGlob], ['styles']);
});
