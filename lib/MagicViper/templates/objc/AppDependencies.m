//
//  <%= @project %>AppDependencies.m
//  <%= @project %>
//
//  Created by <%= @author %> on <%= @date %>.
//
//

#import "<%= @project %>AppDependencies.h"

#import "RootWireframe.h"

#import "HomeWireframe.h"
#import "HomePresenter.h"
#import "HomeDataManager.h"
#import "HomeInteractor.h"

@interface <%= @project %>AppDependencies ()

@end

@implementation <%= @project %>AppDependencies

- (id)initWithWindow:(UIWindow *)window
{
    if ((self = [super init]))
    {
        [self configureDependencies:window];
    }

    return self;
}

- (void)installRootViewController
{
    // *** present first wireframe here
}

- (void)configureDependencies:(UIWindow *)window
{
    // -----
    // root classes
    RootWireframe *rootWireframe = [[RootWireframe alloc] initWithWindow:window];
    // *** add datastore

    // *** module initialization
}


@end
