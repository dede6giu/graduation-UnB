# Eu Quero é Rock!

As melhores bandas do planeta sairão em turnê, e você foi contratado para a divulgação! A partir de um e-mail do produtor, estruture as informações para criar os pôsteres. Cuidado, cada produtor tem um estilo de escrita...

```
##################################
#            ARTISTA             #
##################################
#             TURNÊ              #
#           CIDADE-UF            #
#             LOCAL              #
#            DATA(S)             #
##################################
#              WWW               #
##################################
|      Ingressos: R$ PREÇO       |
|     Utilize o cupom CUPOM      |
+--------------------------------+
```

Cada pôster tem o mesmo formato, e note que as informações são centralizadas. Os dados são fornecidos em texto, da seguinte forma:

- O nome do(s) artista(s) é sempre apresentado entre aspas duplas.
- O nome da turnê é dada no mesmo período que o do(s) artista(s), após uma dessas palavras: "turnê", "espetáculo" ou "show", seguida imediatamente de algum símbolo de pontuação (`.,;!?`).
- Cidade e Unidade de Federação são sempre apresentadas uma após a outra, separadas por vírgula (e talvez espaço). É garantido que toda UF é fornecida como sua sigla, em letras maiúsculas, e nenhuma cidade tem nome composto.
- Datas são fornecidas no formato "dia/mês". Números sempre têm dois algarismos e, no caso de "mês" ser dado por extenso, é garantido que são usadas apenas as três primeiras letras do nome. Se houver mais de uma data, é garantido que todas seguem o mesmo formato.
- O local de realização do show é sempre apresentado entre aspas duplas e após a informação do nome do(s) artista(s).
- O endereço eletrônico para mais informações segue o formato padrão de uma URL na internet, 3 ou 4 grupos de (pelo menos 2) letras minúsculas separadas por ponto (`'.'`).
- O valor do ingresso é um número X dado como "R$ X" ou "X reais". Pode ou não haver casas decimais.
- O código para o cupom de desconto, se houver, será a única informação com pelo menos três símbolos em caixa alta.

## Entrada
A primeira linha fornece um valor inteiro com a quantidade `n` de linhas da mensagem. A seguir, são dadas `n` linhas contendo todas as informações da turnê listadas acima, de forma não estruturada.

## Saída
Para cada entrada, extraia as informações necessárias e monte o pôster no formato indicado acima (e conforme os exemplos). Note que o nome do artista deve estar em caixa alta; as datas devem ser listadas uma por linha, na ordem em que foram dadas; e que o preço do ingresso deve ser apresentado como valor real, com precisão de duas casas, precedido por "R$" e espaço.

## Observações
A formatação da saída é importante, saiba usar f-string.
