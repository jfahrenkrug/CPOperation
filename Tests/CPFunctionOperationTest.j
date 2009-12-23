@import "../CPOperation/CPFunctionOperation.j"

@implementation SomeObject : CPObject {
    CPString result @accessors;
}

- (CPString)setAString:(CPString)someString {
    result = someString;
    return @"Done";
}

@end

@implementation CPFunctionOperationTest : OJTestCase

- (void)test_run_invocation
{
    so = [[SomeObject alloc] init];
    
    var someVar = nil;
    
    funcOp = [CPFunctionOperation functionOperationWithFunction:function() {[so setAString:@"Hello World"]}];
    [funcOp addExecutionFunction:function() {someVar = 'Soylent Green';}];
    [funcOp start];
    
    [self assert:@"Hello World" equals:[so result]];
    [self assert:@"Soylent Green" equals:someVar];                  
}


@end