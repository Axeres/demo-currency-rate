import Router from 'vue-router'

Vue.use(Router)

routes = [
    path: '/'
    component: require('../layouts/index').default
    children: [
        path: '/'
        component: require('../pages/main/mainPage').default
        name: 'mainPage'
      ,
        path: '/contacts'
        component: require('../pages/contacts/contacts').default
        name: 'contacts'
    ]
  ,
    path: '*'
    redirect: '/'
]

export default new Router
  mode: 'hash'
  routes: routes
