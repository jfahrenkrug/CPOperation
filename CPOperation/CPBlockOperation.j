/*
 * CPBlockOperation.j
 *
 * Created by Johannes Fahrenkrug.
 * Copyright 2009, Springenwerk.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

@import <Foundation/CPObject.j>
@import "CPOperation.j"


/*! 
    @class CPBlockOperation
    @brief Represents an operation using a JavaScript function that can be run in an CPOperationQueue
*/
@implementation CPBlockOperation : CPOperation {
    CPArray _blocks;
}


- (void)main {
    if (_blocks && [_blocks count] > 0) {
        var i = 0;
        
        for (i = 0; i < [_blocks count]; i++) {
            var block = [_blocks objectAtIndex:i];
            block();
        }
    }
}

- (id)init {
    if (self = [super init]) {
        _blocks = [];
    }
    return self;
}

/*!
    Adds the specified block (js function) to the receiver’s list of blocks to perform.
*/
- (void)addExecutionBlock:(JSObject)jsFunction {
    [_blocks addObject:jsFunction];
}

/*!
    Returns an array containing the blocks associated with the receiver.
*/
- (CPArray)executionBlocks {
    return _blocks;
}

/*!
    Creates and returns an NSBlockOperation object and adds the specified block to it.
*/
+ (id)blockOperationWithBlock:(JSObject)jsFunction {
    blockOp = [[CPBlockOperation alloc] init];
    [blockOp addExecutionBlock:jsFunction];
    
    return blockOp;
}

@end