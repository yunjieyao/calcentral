'use strict';

var angular = require('angular');
var _ = require('lodash');

angular.module('calcentral.controllers').controller('GraduateDegreeProgressController', function(degreeProgressFactory, apiService, $scope) {

  $scope.degreeProgress = {
    graduate: {
      isLoading: true
    }
  };

  var loadGraduateDegreeProgress = function() {
    degreeProgressFactory.getGraduateMilestones().then(
      function(response) {
        var links = _.get(response, 'data.feed.links');
        $scope.degreeProgress.graduate.links = _.isEmpty(links) ? undefined : links;
        $scope.degreeProgress.graduate.progresses = _.get(response, 'data.feed.degreeProgress');
        $scope.degreeProgress.graduate.errored = _.get(response, 'errored');
      }
    ).finally(
      function() {
        var isHigherDegreeStudent = apiService.user.profile.academicRoles.grad || (apiService.user.profile.academicRoles.law && (apiService.user.profile.academicRoles.lawJspJsd || apiService.user.profile.academicRoles.lawJdCdp));
        var isExStudentWithMilestones = apiService.user.profile.roles.exStudent && $scope.degreeProgress.graduate.progresses.length;
        $scope.degreeProgress.graduate.showCard = apiService.user.profile.features.csDegreeProgressGradStudent && (isHigherDegreeStudent || isExStudentWithMilestones) && !apiService.user.profile.academicRoles.nonDegreeSeekingSummerVisitor;
        $scope.degreeProgress.graduate.isLoading = false;
      }
    );
  };

  loadGraduateDegreeProgress();
});
