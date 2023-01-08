import NetworkExtension

class VPN: NEVPNManager {
    static let shared = VPN()
    
    func startVPN() {
        loadFromPreferences { (error) in
            if let error = error {
                print(error)
            }
            self.onDemand = true
            self.onDemandRules = [NEOnDemandRuleConnect()]
            self.saveToPreferences { (error) in
                if let error = error {
                    print(error)
                }
                self.connection.startVPNTunnel()
            }
        }
    }
    
    func stopVPN() {
        connection.stopVPNTunnel()
    }
}
