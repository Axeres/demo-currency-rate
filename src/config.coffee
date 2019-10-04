import Vue from 'vue'
import Notifications from 'vue-notification'

Vue.use(Notifications)

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

