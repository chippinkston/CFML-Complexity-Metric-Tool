/**
 * Created by chip on 6/12/17.
 * I test the basic calculations for lines of code (no logic)
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
        feature( "Lines of Code Calculation", function(){
            scenario( "A File may exist with nothing in it", function(){
                given( "I have an empty file", function(){
                    var testFile = "";
                    when( "I check it's complexity", function(){
                        then( "it should return 0", function(){
                            var loc = variables.report.getNumberOfLines(testFile);
                                expect(loc).toBe(0);
                        });
                    });
                });
            });

            scenario( "A File may exist with one line in it", function(){
                given( "I have an file with a single line", function(){
                    var testFile = "foo";
                    when( "I check it's complexity", function(){
                        then( "it should return 1", function(){
                            var loc = variables.report.getNumberOfLines(testFile);
                                expect(loc).toBe(1);
                        });
                    });
                });
            });

            scenario( "A File may use Mac or Linux line breaks", function(){
                given( "I have an file with Mac or Linux '\n' line breaks", function(){
                    var testFile = "";
                    var lineBreak = Chr(10);
                    for(var i=0; i < 10; i++){
                        testFile &= 'foo' & lineBreak;
                    }
                    when( "I check it's complexity", function(){
                        then( "it should return 10", function(){
                            var loc = variables.report.getNumberOfLines(testFile);
                                expect(loc).toBe(10);
                        });
                    });
                });
            });
            scenario( "A File may use Windows line breaks", function(){
                given( "I have an file with Windows '\n\r' line breaks", function(){
                    var testFile = "";
                    var winLineBreak = Chr(10) & Chr(13);
                    for(var i=0; i < 10; i++){
                        testFile &= 'foo' & winLineBreak;
                    }
                    when( "I check it's complexity", function(){
                        then( "it should return 10", function(){
                            var loc = variables.report.getNumberOfLines(testFile);
                                expect(loc).toBe(10);
                        });
                    });
                });
            });
        });

    }

}
