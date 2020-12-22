# NomuraTest
This app demonstrate the usage of Yahoo Finance API stock records details information.

# Architecture & Design

This code is written in Swift 5 using MVVM design pattern. This project consists of Alamofire framework to consume webservices & also added the Unit test cases using OHHTTPStubs framework.

The UI calls the backend api through ViewModel to display the stocks records. The model has been implemented in Codable structure to consume the data of stocks. In every 30 seconds the UI will refresh the table of stock records by calling api webservice & will sync the latest information of stock records.

The code is consist of MVVM design pattern & auto-layout design pattern for below mentioned reasons:-

1. MVVM enables better experience of data abstraction & data binding
2. MVVM helps to get Unit Test each & every piece of code
3. MVVM reduces the code complexity & enables better experience of readability 
4. Auto-layout helps to design application in such a way, which can support different device resolutions


