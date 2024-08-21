# 🤖 Robot Framework Project - Guia de Instalação e Uso

## 🛠️ Pré-requisitos
1.**Instale o Python 🐍**

Você pode baixá-lo [aqui](https://www.python.org/ftp/python/3.12.5/python-3.12.5-amd64.exe). Durante a instalação, **não se esqueça de marcar a opção "Add Python to PATH"**.

2.**Instale a IDE Pycharm**

Para facilitar o desenvolvimento, você pode instalar a IDE PyCharm. Baixe a versão Community (gratuita) [aqui](https://www.jetbrains.com/pycharm/download/?section=windows/pycharm-community-2024.2.exe). 🖥️
**No link há 2 opções escolha a segunda opção da pagina**

## 🧰 Instalação do Ambiente
1.**Baixar o github**

Clique [aqui](https://github.com/git-for-windows/git/releases/download/v2.46.0.windows.1/Git-2.46.0-64-bit.exe) para baixar.

2.**Clone o repositório de automação:**    
    
    git clone https://github.com/repo.git
    cd repo
    

3.**Instale as dependências:**    
    
    pip install -r requirements.txt

## 🌐 Execução de Testes de API
1.**Execução dos testes de API:**

    robot -d output api\tests\cases\example_tests.robot

2.**Execução dos testes de API com Allure 📊:**    

    robot --listener allure_robotframework -d output api\tests\cases\example_tests.robot

## 🌍 Execução de Testes Web
1.**Execução local dos testes Web:**    

    robot -d output web/tests

2.**Execução dos testes Web no BrowserStack:**    

    
    browserstack-sdk robot web/tests
    
3.**Execução dos testes Web com Allure 📊 (local ou BrowserStack):**    
    -**Local:**        
        ```
        robot --listener allure_robotframework -d output web/tests
        allure serve output
        ```
    -**BrowserStack:**        
        ```
        browserstack-sdk robot --listener allure_robotframework -d output web/tests
        ```

4.**Gerar o relatório do Allure 📊:**    Após rodar os testes, gere o relatório com:

    allure serve output
