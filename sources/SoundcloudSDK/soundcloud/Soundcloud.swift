//
//  SessionManager.swift
//  Soundcloud
//
//  Created by Benjamin Chrobot on 11/9/16.
//  Copyright (c) 2015 Kevin Delannoy. All rights reserved.
//

import Foundation

// MARK: Properties

/// Your Soundcloud app client identifier
public var clientIdentifier: String? {
get {
    return SessionManager.clientIdentifier
}
set {
    SessionManager.clientIdentifier = clientIdentifier
}
}

/// Your Soundcloud app client secret
public var clientSecret: String? {
get {
    return SessionManager.clientSecret
}
set {
    SessionManager.clientSecret = clientSecret
}
}

/// Your Soundcloud redirect URI
public var redirectURI: String? {
get {
    return SessionManager.redirectURI
}
set {
    SessionManager.redirectURI = redirectURI
}
}

/**
 Convience method to set Soundcloud app credentials

 - parameter clientIdentifier:  Your Soundcloud app client identifier
 - parameter clientSecret:      Your Soundcloud app client secret
 - parameter redirectURI:       Your Soundcloud redirect URI
 */
public func configure(clientIdentifier: String?, clientSecret: String?, redirectURI: String?) {
    SessionManager.clientIdentifier = clientIdentifier
    SessionManager.clientSecret = clientSecret
    SessionManager.redirectURI = redirectURI
}

// MARK: Session Management

/**
 Logs a user in. This method will present an UIViewController over `displayViewController`
 that will load a web view so that user is available to log in

 - parameter displayViewController: An UIViewController that is in the view hierarchy
 - parameter completion:            The closure that will be called when the user is logged in or upon error
 */
public func login(in displayViewController: ViewController, completion: @escaping (SimpleAPIResponse<Session>) -> Void) {
    SessionManager.login(in: displayViewController, completion: completion)
}

/// The session property is only set when a user has logged in.
public var session: Session? {
    return SessionManager.session
}

/**
 Logs out the current user. This is a straight-forward call.
 */
public func destroySession() {
    SessionManager.destroySession()
}

// MARK: Resolve

/// A resolve response can either be a/some User(s) or a/some Track(s) or a Playlist.
public typealias ResolveResponse = (users: [User]?, tracks: [Track]?, playlist: Playlist?)

/**
 Resolve allows you to lookup and access API resources when you only know the SoundCloud.com URL.

 - parameter URI:        The URI to lookup
 - parameter completion: The closure that will be called when the result is ready or upon error
 */
public func resolve(URI: String, completion: @escaping (SimpleAPIResponse<ResolveResponse>) -> Void) {
    SessionManager.resolve(URI: URI, completion: completion)
}
