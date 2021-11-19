//
//  Connector.swift
//  CommuniMate
//
//  Created by Jarvis on 18/11/21.
//

import Foundation
import MultipeerConnectivity
import SwiftUI

enum Kind : Codable{
    case done
    case start
    case categories
    case talker
    case guest
}

class Message : Encodable, Decodable{
    var body = ""
    let kind : Kind
    var categories : [Int] = []
    
    init(kind: Kind){
        self.kind = kind
    }
    
}

class Connector : NSObject, ObservableObject{
    private let serviceType = "prova-mc2"
    private let myPeerId = MCPeerID(displayName: UIDevice.current.name)
    private let serviceAdvertiser: MCNearbyServiceAdvertiser
    private let serviceBrowser: MCNearbyServiceBrowser
    private let session: MCSession
    @Published var connectedPeers: [MCPeerID] = []
    @Published var currentMessage: Message? = nil
    @Published var isAccepted = false
    @Published var isStillInASession = false
    @Published var sessionInvited : [MCPeerID] = []
    @Published var invitee : [String] = []
    @Published var sessionAccepted : MCSession?
    @Published var isStarting : Bool = false
    @Published var chosenCategories : [Int] = []
    @Published var readyCounter : Int = 0
    @Published var turnList : [MCPeerID] = []
    @Published var isTalker : Bool = false
    
    override init() {
           session = MCSession(peer: myPeerId, securityIdentity: nil, encryptionPreference: .none)
           serviceAdvertiser = MCNearbyServiceAdvertiser(peer: myPeerId, discoveryInfo: nil, serviceType: serviceType)
           serviceBrowser = MCNearbyServiceBrowser(peer: myPeerId, serviceType: serviceType)

           super.init()

           session.delegate = self
           serviceAdvertiser.delegate = self
           serviceBrowser.delegate = self
        
        serviceBrowser.startBrowsingForPeers()
        
       }

       deinit {
           serviceAdvertiser.stopAdvertisingPeer()
           serviceBrowser.stopBrowsingForPeers()
       }
    
    
    
    func disconnect(){
        session.disconnect()
    }
    
    func askForInvite(peer: MCPeerID){
        serviceBrowser.invitePeer(peer, to: session, withContext: nil, timeout: 300)
    }
    func startAdvertising(){
        serviceAdvertiser.startAdvertisingPeer()

    }
    func stopAdvertising(){
        serviceAdvertiser.stopAdvertisingPeer()

    }
 func send(message: Message) {
     print("sendMessage: \(message.body) to \(self.session.connectedPeers.count) peers")
        

        if !session.connectedPeers.isEmpty {
            do {
                let data = try JSONEncoder().encode(message)
                try session.send(data, toPeers: session.connectedPeers, with: .reliable)
            } catch {
                print("Error for sending: \(String(describing: error))")
            }
        }
    }
    
    func sendReady(){
        let message = Message(kind: .start)
        if !session.connectedPeers.isEmpty{
            do {
                let data = try JSONEncoder().encode(message)
                try session.send(data, toPeers: session.connectedPeers, with: .reliable)
            } catch {
                print("Error for sending: \(String(describing: error))")
            }
        }
    }
    
    func sendCategories(Categories : [Int]){
        let message = Message(kind: .categories)
        message.categories = Categories
        if !session.connectedPeers.isEmpty{
            do {
                let data = try JSONEncoder().encode(message)
                try session.send(data, toPeers: session.connectedPeers, with: .reliable)
            } catch {
                print("Error for sending: \(String(describing: error))")
            }
        }
    }
    
    func sendTalker(to peer: MCPeerID){
        let message = Message(kind: .talker)
        if !session.connectedPeers.isEmpty{
            do {
                let data = try JSONEncoder().encode(message)
                try session.send(data, toPeers: [peer], with: .reliable)
            } catch {
                print("Error for sending: \(String(describing: error))")
            }
        }
    }
    
    func sendListener(to peers: [MCPeerID]){
        let message = Message(kind: .talker)
        if !session.connectedPeers.isEmpty{
            do {
                let data = try JSONEncoder().encode(message)
                try session.send(data, toPeers: peers, with: .reliable)
            } catch {
                print("Error for sending: \(String(describing: error))")
            }
        }
    }
    
    func sendDone(){
        let message = Message(kind: .done)
        self.readyCounter += 1
        if !session.connectedPeers.isEmpty{
            do {
                let data = try JSONEncoder().encode(message)
                try session.send(data, toPeers: session.connectedPeers, with: .reliable)
            } catch {
                print("Error for sending: \(String(describing: error))")
            }
        }
    }
   }
extension Connector : MCNearbyServiceAdvertiserDelegate{
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        print("didReceiveInvitationFromPeer \(peerID)")
        invitationHandler(true, session)
    }
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didNotStartAdvertisingPeer error: Error) {
           print("ServiceAdvertiser didNotStartAdvertisingPeer: \(String(describing: error))")
       }
}
extension Connector: MCNearbyServiceBrowserDelegate {
    func browser(_ browser: MCNearbyServiceBrowser, didNotStartBrowsingForPeers error: Error) {
        print("ServiceBrowser didNotStartBrowsingForPeers: \(String(describing: error))")
    }

    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String: String]?) {
       print("ServiceBrowser found peer: \(peerID)")
        self.invitee.append(peerID.displayName)
        self.sessionInvited.append(peerID)
    }

    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        print("ServiceBrowser lost peer: \(peerID)")
        let id = self.invitee.firstIndex(of: peerID.displayName)
        self.invitee.remove(at: id!)
        let iD = self.sessionInvited.firstIndex(of: peerID)
        self.sessionInvited.remove(at: iD!)
    }
}
extension Connector: MCSessionDelegate {
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        switch state {
        case .connected: print ("connected \(peerID.displayName)")
        case .connecting: print ("connecting \(peerID.displayName)")
        case .notConnected: print ("not connected \(peerID.displayName)")
           default: print("unknown status for \(peerID)")
         }
        DispatchQueue.main.async {
            self.connectedPeers = session.connectedPeers
       }
    }

    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        print("didReceive bytes \(data.count) bytes")
        guard let message = try? JSONDecoder()
            .decode(Message.self, from: data) else { return }
               DispatchQueue.main.async {
                   switch message.kind{
                   case .start:
                       print("Start")
                       self.isStarting = true
                   case .categories:
                       print("Categories")
                       self.chosenCategories.append(contentsOf: message.categories)
                   case .done:
                       print("Done")
                       self.readyCounter += 1
                   case .talker:
                       print("Talker")
                       self.isTalker = true
                   case .guest:
                       print("Guest")
                       self.isTalker = false
                   }
        }
        
    }

    public func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        print("Receiving streams is not supported")
    }

    public func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        print("Receiving resources is not supported")
    }

    public func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        print("Receiving resources is not supported")
    }
}

