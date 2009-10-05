@import "../CPOperation/CPBlockOperation.j"

@implementation SomeObject : CPObject {
    CPString result @accessors;
}

- (CPString)setAString:(CPString)someString {
    result = someString;
    return @"Done";
}

@end

@implementation CPBlockOperationTest : OJTestCase

- (void)test_run_invocation
{
    so = [[SomeObject alloc] init];
    
    var someVar = nil;
    
    blockOp = [CPBlockOperation blockOperationWithBlock:function() {[so setAString:@"Hello World"]}];
    [blockOp addExecutionBlock:function() {someVar = 'Soylent Green';}];
    [blockOp start];
    
    [self assert:@"Hello World" equals:[so result]];
    [self assert:@"Soylent Green" equals:someVar];                  
}


@end