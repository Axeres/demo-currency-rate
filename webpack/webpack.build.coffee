merge = require 'webpack-merge'
path = require 'path'
baseWebpackConfig = require './webpack._base'
OptimizeCSSAssetsPlugin = require 'optimize-css-assets-webpack-plugin'
TerserJSPlugin = require 'terser-webpack-plugin'
{ CleanWebpackPlugin } = require 'clean-webpack-plugin'


appPath = path.resolve __dirname, '../src'
outputPath = path.resolve __dirname, '../public/bundles'
entry =
  main: path.join appPath, 'entry'

config =
  context: appPath
  entry: entry
  mode: 'production'
  watch: false
  output:
    filename: '[name].js'
    path: outputPath

  resolve:
    alias:
      'vue$': 'vue/dist/vue.min.js'

    modules: [ appPath, 'node_modules' ]

  plugins: [
    new CleanWebpackPlugin()
  ]

#  optimization:
#    minimizer: [new TerserJSPlugin({}), new OptimizeCSSAssetsPlugin({})],

devWebpackConfig = merge baseWebpackConfig(appPath), config

module.exports = new Promise (resolve, reject) =>
  resolve(devWebpackConfig)
