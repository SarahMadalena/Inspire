import Foundation
// Declaro o valor da variável String para ela não inicializar vazia
var themeInput = "default"

print(menssage)
themeInput = readLine()! // "" reconhece como string vazia
// var page = readLine()
print(menssage2)

//Deixa o programa inteiro em um loop com uma condicional de saída
while true {
//Se o Int for um numero, ele é diferente de nil. Se for uma String(texto), ele vai ser igual a nil -> como se fosse uma String, assim como as aspas
    if Int(themeInput) != nil  || themeInput == "" {
        print("\n Por favor, digite um tema")
        themeInput = readLine()!
    } else {
        let theme = themeInput
        api(theme: theme)
        
    }
}


// pesquisar sobre json decoder pra converter a um array de fts com base no meu json
