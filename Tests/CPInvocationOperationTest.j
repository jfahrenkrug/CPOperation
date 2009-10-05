@import "../CPOperation/CPInvocationOperation.j"

@implementation SomeObject : CPObject {
    CPString result @accessors;
}

- (CPString)setAString:(CPString)someString {
    result = someString;
    return @"Done";
}

@end

@implementation CPInvocationOperationTest : OJTestCase

- (void)test_run_invocation
{
    so = [[SomeObject alloc] init];
    
    io = [[CPInvocationOperation alloc] initWithTarget:so selector:@selector(setAString:) object:@"Hello World"];
    [io start];
    
    [self assert:@"Hello World" equals:[so result]];
    [self assert:@"Done" equals:[io result]];                  
}


@end