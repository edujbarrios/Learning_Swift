func esSecuenciaADNValida(secuencia: String) -> Bool {
    for i in 0..<secuencia.count-1 {
        let parDeLetras = String(secuencia[i]) + String(secuencia[i+1])
        if parDeLetras != "AT" && parDeLetras != "TA" && parDeLetras != "CG" && parDeLetras != "GC" {
            return false
        }
    }
    return true
}
