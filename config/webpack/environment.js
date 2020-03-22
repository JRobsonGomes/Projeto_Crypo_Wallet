const { environment } = require('@rails/webpacker')

const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    'window.jQuery': 'jquery/src/jquery',
    Popper: ['popper.js', 'default'],
    notify: 'notify-js-legacy/notify'
  })
);

module.exports = environment
