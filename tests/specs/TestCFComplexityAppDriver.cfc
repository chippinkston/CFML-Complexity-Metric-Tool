/**
 * Created by chip on 6/9/17.
 */
component extends="testbox.system.BaseSpec"{
/*********************************** LIFE CYCLE Methods ***********************************/

    function beforeAll(){
        application.salvador = 1;
    }

    function afterAll(){
        structClear( application );
    }

/*********************************** BDD SUITES ***********************************/

    function run(){

    }
}
