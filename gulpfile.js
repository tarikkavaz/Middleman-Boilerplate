var gulp        = require('gulp');
var concat      = require('gulp-concat')
var uglify      = require('gulp-terser')
var browserSync = require('browser-sync');


// Compile all javascript files into source/statics/js/site.js
gulp.task('js', function() {
    return gulp.src([
            'node_modules/jquery/dist/jquery.min.js',
            'node_modules/popper.js/dist/umd/popper.min.js',
            'node_modules/bootstrap/dist/js/bootstrap.min.js',
            'node_modules/jquery-fancybox/source/js/jquery.fancybox.js',
            'node_modules/retinajs/dist/retina.min.js',
            'source/statics/js/custom.js'
        ])
        .pipe(concat('site.js'))
        .pipe(uglify())
        .pipe(gulp.dest("source/statics/js"))
        .pipe(browserSync.stream());
});

// Font Awesome Webfonts
// gulp.task('icons', function() {
//     return gulp.src('node_modules/@fortawesome/fontawesome-free/webfonts/*')
//         .pipe(gulp.dest('source/statics/webfonts/'));
// });

// Static Server + watching js/erb files
gulp.task('serve', function() {

    browserSync.init({
        open: false,
        logLevel: "silent"
    });

    
    gulp.watch(['source/statics/js/custom.js'], gulp.series(['js'])).on('change', browserSync.reload);

});

gulp.task('default', gulp.parallel('js','serve'));