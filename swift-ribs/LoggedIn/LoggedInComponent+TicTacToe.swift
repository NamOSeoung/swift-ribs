//
//  LoggedInComponent+TicTacToe.swift
//  swift-ribs
//
//  Created by OSeung Nam on 2021/07/12.
//

import RIBs

/// The dependencies needed from the parent scope of LoggedIn to provide for the TicTacToe scope.
// TODO: Update LoggedInDependency protocol to inherit this protocol.
protocol LoggedInDependencyTicTacToe: Dependency {

    // TODO: Declare dependencies needed from the parent scope of LoggedIn to provide dependencies
    // for the TicTacToe scope.
}

extension LoggedInComponent: TicTacToeDependency {

    // TODO: Implement properties to provide for TicTacToe scope.
}
