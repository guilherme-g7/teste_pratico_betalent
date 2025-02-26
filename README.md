# Teste Prático Betalent

## Sobre o Projeto

Este é um projeto Flutter desenvolvido como parte de um teste prático para a Betalent. O objetivo do projeto é gerenciar funcionários, utilizando diversas bibliotecas e ferramentas do ecossistema Flutter. O projeto inclui funcionalidades como exibição de listas de funcionários, busca, e exibição de detalhes.

## Pré-requisitos

Antes de começar, certifique-se de ter os seguintes pré-requisitos instalados:

- [Dart SDK](https://dart.dev/get-dart)
- [FVM (Flutter Version Management)](https://fvm.app/docs/getting_started/installation)
- [Flutter SDK](https://flutter.dev/docs/get-started/install)


## Instruções para Rodar a Aplicação

### Configuração Inicial

1. Clone o repositório do projeto:
   ```sh
   git clone https://github.com/guilherme-g7/teste_pratico_betalent.git
   cd teste_pratico_betalent
   ```

2. Instale as dependências do projeto utilizando o FVM:
   ```sh
   fvm install 3.29.0
   fvm use 3.29.0
   fvm flutter pub get
   ```

### Executando a API

Para rodar a API, siga os passos abaixo:

1. Navegue até o diretório `API`:
   ```sh
   cd API
   ```

2. Instale o json-server:
   ```sh
   npm install -g json-server
   ```

3. Inicie o servidor JSON:
   ```sh
   npx json-server --watch database.json
   ```

### Configuração do API Client

Para que o aplicativo possa se comunicar corretamente com a API, é necessário configurar o IP da máquina local no arquivo `api_client.dart`. Esta configuração é necessária para que o aplicativo consiga acessar as informações da API que está localizada na pasta `API`.

1. Abra o arquivo `api_client.dart` localizado no diretório `lib/utils/`.
2. Encontre a linha onde o host da API é definido:
   ```dart
   host = host ?? 'localhost'
   ```
3. Substitua 'localhost' pelo IP da sua máquina local.

    Por exemplo, se o IP da sua máquina for 192.168.1.100, altere a linha para:
   ```dart
   host = host ?? '192.168.1.100'
   ```

### Executando o Aplicativo
Para executar o aplicativo em um dispositivo ou emulador, utilize o comando:
```sh
fvm flutter run
```


### Executando Testes

Os testes estão localizados no diretório [`test`](test). Para executar os testes, utilize o comando:
```sh
fvm flutter test
```

## Estrutura do Projeto

A estrutura do projeto é a seguinte:

### Diretórios e Arquivos Principais

- **lib/**: Contém o código-fonte principal do aplicativo.
- **test/**: Contém os testes unitários e de integração.
- **android/**: Configurações específicas para a plataforma Android.
- **ios/**: Configurações específicas para a plataforma iOS.
- **assets/**: Contém recursos estáticos como imagens e fontes.
- **pubspec.yaml**: Arquivo de configuração do Dart que gerencia as dependências do projeto.

## Plugins Utilizados

Os plugins utilizados no projeto, conforme especificado no arquivo [`pubspec.yaml`](pubspec.yaml), são:

- `provider`
- `logging`
- `dio`
- `go_router`
- `logger`
- `intl`
- `brasil_fields`
- `build_runner`
- `mockito`
- `flutter_lints`
- `flutter_native_splash`
- `flutter_launcher_icons`

## Gerenciamento de Versões com FVM

Este projeto utiliza o Flutter Version Management (FVM) para gerenciar diferentes versões do Flutter SDK.

## Versões Utilizadas
- **FVM**: 3.2.1
- **Flutter**: 3.29.0
- **Dart**: 2.7.0

## Funcionalidades Implementadas

- Exibição de uma tabela com as colunas:
  - Imagem (thumbnail do usuário)
  - Nome
  - Cargo
  - Data de Admissão (formatada no frontend)
  - Telefone (formatado no frontend)
- Campo de pesquisa que permite filtrar por:
  - Nome
  - Cargo
  - Telefone

---

Esta documentação fornece uma visão geral do projeto, incluindo sua estrutura, dependências, configuração, execução, testes e contribuição.