function loginCtrl($scope, $http) {

    $scope.loginHint = 'hello';
    $scope.loginName = '';
    $scope.loginPassword = '';


    $scope.tryLogin = function(ev) {
        
        console.log(ev);
        if (ev.which != 13) {
            return;
        }

        var data = {'user': $scope.loginName,
                    'password': $scope.loginPassword};

        console.log(data);
        $http.post('/login', data).
            success(function(data, status, headers, config) {
                $scope.loginHint = "success";
            }).
            error(function(data, status, headers, config) {
                $scope.loginHint = "fail";
            });

    };
};

