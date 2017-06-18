/**
 * Created by chip on 6/12/17.
 * I test the basic complexity rules
 */
component extends="testbox.system.BaseSpec"{

/* Lifecycle */
    function beforeAll(){
        variables.report = createObject("component","system.CFComplexityMeter").init();
    }

    function afterAll(){
    }
/* END Lifecycle */

    function run(){
        feature( "Basic Complexity Calculation", function(){
            scenario( "Complexity Grows for every 100 lines of code", function(){
                given( "I have a file with less than 100 Lines", function(){
                    var testFile = makeLinesOfCode(99);
                    when( "I check it's basic complexity", function(){
                        then( "it should return 1", function(){
                            var complexity = variables.report.getFileBasicComplexityCount(testFile);
                                expect(complexity).toBe(1);
                        });
                    });
                });
                given( "I have a file with at least 100 Lines", function(){
                    var testFile = makeLinesOfCode(100);
                    when( "I check it's basic complexity", function(){
                        then( "it should return 2", function(){
                            var complexity = variables.report.getFileBasicComplexityCount(testFile);
                                expect(complexity).toBe(2);
                        });
                    });
                });
                given( "I have a file with at least 200 Lines", function(){
                    var testFile = makeLinesOfCode(250);
                    when( "I check it's basic complexity", function(){
                        then( "it should return 3", function(){
                            var complexity = variables.report.getFileBasicComplexityCount(testFile);
                                expect(complexity).toBe(3);
                        });
                    });
                });
            });
            scenario( "Basic (no function) complexity tests", function(){
                given( "I have a file with less a single cfif", function(){
                    var testFile = '<cfif>' & makeLinesOfCode(2) & '</cfif>';
                    when( "I check it's basic complexity", function(){
                        then( "it should return 2", function(){
                            var complexity = variables.report.getFileBasicComplexityCount(testFile);
                                expect(complexity).toBe(2);
                        });
                    });
                });
            });
        });

    }

    private string function makeLinesOfCode(numeric count=1){
        var result = '';
        for(var i=0; i < arguments.count; i++){
            result &= 'foo' & Chr(10);
        }
        return result;
    }

}
