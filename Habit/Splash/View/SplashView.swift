//
//  SplashView.swift
//  Habit
//
//  Created by Vitor Otero on 22/03/2022.
//

import SwiftUI

struct SplashView: View {
    
    @ObservedObject var viewModel: SplashViewModel
    
    var body: some View {
        Group {
            switch viewModel.uiState {
            case .loading:
                loadingView()
            case .goToSignInScreen:
                Text("Carregar tela de login")
            case .goToHomeScreen:
                Text("Carregar tela principal")
            case .error(let msg):
                loadingView(error: msg)
                
            }
        }.onAppear(perform:  {
            viewModel.onAppear()
        })
    }
}

//1. Compartilhamento | Objetos
struct LoadingView: View {
    var body: some View {
        ZStack{
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(80)
                .background(Color.white)
                .ignoresSafeArea()
        }
    }
}

// 2. Variaveis em extensions
extension SplashView {
    var loading: some View  {
        ZStack{
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(80)
                .background(Color.white)
                .ignoresSafeArea()
        }
    }
}

//3. Funçoens em extensions
extension SplashView {
    func loadingView(error: String? = nil) -> some View {
        ZStack{
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(80)
                .background(Color.white)
                .ignoresSafeArea()
            
            if let error = error {
                Text("")
                    .alert(isPresented: .constant(true)) {
                        Alert(title: Text ("Habit"), message: Text(error), dismissButton: .default(Text("OK")) {
                            //Faz algo quando some o alerta
                        })
                    }
            }
        }
    }
}







struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SplashViewModel()
        SplashView(viewModel: viewModel)
        //SplashView(state: .loading)
        
    }
    
}
