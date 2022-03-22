//
//  SplashViewModel.swift
//  Habit
//
//  Created by Vitor Otero on 22/03/2022.
//

import SwiftUI

class SplashViewModel: ObservableObject {
    
    @Published var uiState: SplashUIState = .loading
    
    func onAppear()  {
        //faz algo assincrono e muda o estado da uiState
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            //aqui é chamado depois de 2 segundos
            self.uiState = .error("Erro de resposta do servidor")
        }
    }
}
