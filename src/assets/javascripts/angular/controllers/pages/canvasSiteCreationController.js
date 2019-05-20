'use strict';

/**
 * Canvas 'Create a Site' overview index controller
 */
angular.module('calcentral.controllers').controller('CanvasSiteCreationController', function(apiService, canvasSiteCreationFactory, $location, $route, $scope) {
  apiService.util.setTitle('Create a Site Overview');

  $scope.accessDeniedError = 'This feature is only available to faculty and staff.';
  $scope.linkToCreateCourseSite = $route.current.isEmbedded ? '/canvas/embedded/create_course_site' : '/canvas/create_course_site';
  $scope.linkToCreateProjectSite = $route.current.isEmbedded ? '/canvas/embedded/create_project_site' : '/canvas/create_project_site';

  $scope.createCourseSiteButtonFocus = '0';
  $scope.createProjectSiteButtonFocus = '0';

  var loadAuthorizations = function() {
    canvasSiteCreationFactory.getAuthorizations().then(
      function successCallback(response) {
        if (!response && !response.data && (typeof(response.data.authorizations.canCreateCourseSite) === 'undefined') || (typeof(response.data.authorizations.canCreateProjectSite) === 'undefined')) {
          $scope.displayError = 'failure';
        } else {
          angular.extend($scope, response.data);
          if ($scope.authorizations.canCreateCourseSite === false) {
            $scope.createCourseSiteButtonFocus = '-1';
          }
          if ($scope.authorizations.canCreateProjectSite === false) {
            $scope.createProjectSiteButtonFocus = '-1';
          }
          if ($scope.authorizations.canCreateCourseSite === false && $scope.authorizations.canCreateProjectSite === false) {
            $scope.displayError = 'unauthorized';
          }
        }
      },
      function errorCallback() {
        $scope.displayError = 'failure';
      }
    );
  };

  loadAuthorizations();
  apiService.util.iframeScrollToTop();
});