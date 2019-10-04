merge = require 'webpack-merge'
webpack = require 'webpack'
path = require 'path'
baseWebpackConfig = require './webpack._base'

appPath = path.resolve __dirname, '../src'
outputPath = path.resolve __dirname, '../public/bundles'
entry = main: path.join appPath, 'entry'
contentBase = path.resolve __dirname, '../public'

config =
  context: appPath
  entry: entry
  mode: 'development'
  watch: true
  output:
    filename: '[name].js'
    path: outputPath

  resolve:
    alias:
      'vue$': 'vue/dist/vue.js' 
    modules: [ appPath, 'node_modules' ]

  plugins: [
    new webpack.SourceMapDevToolPlugin {
      filename: '[file].map'
    }
  ]

  devtool: 'cheap-eval-source-map'

  devServer:
    contentBase: contentBase
    publicPath: '/bundles/'
    hot: true
    quiet: true
    compress: true
    inline: true
    port: 3000


devWebpackConfig = merge baseWebpackConfig(appPath), config

module.exports = new Promise (resolve, reject) =>
  resolve(devWebpackConfig)


