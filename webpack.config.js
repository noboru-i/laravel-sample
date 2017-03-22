module.exports = {
  vue: {
    postcss: function(webpack) {
      return [
        require('postcss-import'),
        require('postcss-cssnext'),
        require('postcss-discard-empty')
      ];
    }
  }
};
