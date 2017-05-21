fis.match('::packager', {
    spriter: fis.plugin('csssprites')
    // 将页面上的js/css合并成一个文件
    //postpackager: fis.plugin('loader', {
    //    allInOne: true
    //})
});

fis.match('*.{js,css,png}', {
    // js、css修改文件名，添加hash值
    useHash: true
});

fis.match('*.js', {
    optimizer: fis.plugin('uglify-js')
});

fis.match('*.css', {
    useSprite: true,
    optimizer: fis.plugin('clean-css')
});

fis.match('*.png', {
    optimizer: fis.plugin('png-compressor')
});