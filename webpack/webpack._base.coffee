VueLoaderPlugin = require 'vue-loader/lib/plugin'
webpack = require 'webpack'
MiniCssExtractPlugin = require "mini-css-extract-plugin"
HtmlWebpackPlugin = require 'html-webpack-plugin'
FriendlyErrorsWebpackPlugin = require('friendly-errors-webpack-plugin')

module.exports = (appPath) ->
  resolveLoader:
    modules: [ 'node_modules' ]
    extensions: [ '.js', '.json' ]
    mainFields: [ 'loader', 'main' ]

  resolve:
    alias:
      'jquery': 'jquery/dist/jquery.min'
      'lodash': 'lodash/lodash.min.js'

    modules: [ appPath, 'node_modules' ],
    extensions: ['*', '.coffee', '.js', '.vue', '.sass']

  module:
    rules: [
      test: /\.vue$/
      loader: 'vue-loader'
      options:
        loaders:
          scss: 'vue-style-loader!css-loader!sass-loader',
          sass: [
              'vue-style-loader'
              'css-loader'
              'sass-loader?indentedSyntax'
            ,
              loader: "sass-resources-loader",
              options:
                resources: [
                  appPath + '/styles/settings/variables.sass',
                  appPath + '/styles/settings/mixins.sass',
              ]
            ]
    ,
      test: /\.pug$/,
      oneOf: [
          resourceQuery: /^\?vue/
          use:
            loader: 'pug-plain-loader'
            options:
              query:
                pretty: true
        ,
          use: ['raw-loader', 'pug-plain-loader']
      ]
    ,
      test: /\.js$/
      loader: 'babel-loader'
      include: [appPath]
    ,
      test: /\.(woff2?|ttf|eot|svg|png|jpg|gif)$/,
      use:
        loader: 'url-loader'
        options:
          limit: 10000
          name: '../[path][name].[ext]'
    ,
      test: /\.coffee$/
      use: [ 'coffee-loader' ]
      include: [appPath]
    ,
      test: /\.css$/,
      use: [
        loader: MiniCssExtractPlugin.loader
        loader: 'css-loader'

      ]
    ,
      test: /\.sass$/,
      include: [appPath]
      use: [
          loader: MiniCssExtractPlugin.loader
        ,
          loader: 'css-loader'
        ,
          loader: 'sass-loader',
          options:
            indentedSyntax: true
            minimize: true
        ,
          loader: 'sass-resources-loader'
          options:
            resources: [
              appPath + '/styles/settings/variables.sass',
              appPath + '/styles/settings/mixins.sass',
            ]
        ]
    ]

  plugins: [
    new webpack.ContextReplacementPlugin(/moment[\/\\]locale$/, /ru/)

    new VueLoaderPlugin()

    new webpack.ProvidePlugin
        Promise: 'bluebird',
        '$': 'jquery',
        'jQuery': 'jquery',
        '_': 'lodash',
        'Vue': 'vue',
        'axios': 'axios',
        'moment': 'moment',
        'vuelidate': 'vuelidate',
        'sass-mediaqueries': 'sass-mediaqueries',

    new MiniCssExtractPlugin
        filename: "[name].css"

    new FriendlyErrorsWebpackPlugin(),

    new HtmlWebpackPlugin
      inject: false
      template: appPath + '/index.pug'
      filename: '../index.html'

  ]


