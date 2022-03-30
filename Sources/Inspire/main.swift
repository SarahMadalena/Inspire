import Foundation
// Declaro o valor da variável String para ela não inicializar vazia
var themeInput = "default"

print(menssage)
themeInput = readLine()!
// var page = readLine()
print(menssage2)

//Deixa o programa inteiro em um loop com uma condicional de saída
while true {
    if let themeType = Int(themeInput) {
        print("\n Por favor, digite um tema")
        themeInput = readLine()!
    } else {
        let theme = themeInput
        api(theme: theme)
        
    }
}


// pesquisar sobre json decoder pra converter a um array de fts com base no meu json
