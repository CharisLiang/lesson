/**
 * Created by KR0053 on 2017/11/7.
 */
(function(){
  angular.module("test2App")
    .config(configFun);
  configFun.$injector = ["$stateProvider" , "$urlRouterProvider"];

  function configFun($stateProvider , $urlRouterProvider){
      $urlRouterProvider.otherwise('/');

      $stateProvider
        .state("pageTab" , {
          url:"/",
          templateUrl: "test2/pageTab.html"
        })
        .state("pageTab.page1",{
          url:"/page1",
          template:"<div><a>page1</a></div>"
        })
        .state("pageTab.page2",{
          url:"/page2",
          template:"<div><a>page2</a></div>"
        })
        .state("pageTab.page3",{
        url:"/page3",
        template:"<div><a>page3</a></div>"
      });
  }
})();
