import Vue from 'vue'
import Notifications from 'vue-notification'

import Element from 'element-ui'
import lang from 'element-ui/lib/locale/lang/ru-RU'
import locale from 'element-ui/lib/locale'
# import 'element-ui/lib/theme-chalk/index.css'

locale.use(lang)

Vue.use(Notifications)
Vue.use(Element)

import {  DatePicker } from 'element-ui'



Vue.use(DatePicker);

Promise.config
  warnings: true
  longStackTraces: true
  cancellation: true
  monitoring: true

# Подключаем все остальные файлы
files = require.context('.', true, /(?!entry).*?.(coffee|js|vue)$/)
files.keys().forEach (key) -> files(key)

axios.defaults.headers.common =
  'Accept': 'application/json',
  'Content-Type': 'application/json'

axios.defaults.baseURL = 'http://api-app.dev'

