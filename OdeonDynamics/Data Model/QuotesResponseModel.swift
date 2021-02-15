//
//  QuotesResponseModel.swift
//  NomuraTest
//
//  Created by Akif Demirezen on 22.12.2020.
//  Copyright © 2020 Azure. All rights reserved.
//

import UIKit

// MARK: - QuotesModel
struct QuotesModel: Codable {
    let quoteResponse: QuoteResponse
}

// MARK: - QuoteResponse
struct QuoteResponse: Codable {
    let result: [Resultt]
    let error: String?
}

// MARK: - Result
struct Resultt: Codable {
    let language, region, quoteType, quoteSourceName: String
    let triggerable: Bool
    let quoteSummary: QuoteSummary
    let components: [String]
    let currency: String
    let firstTradeDateMilliseconds, priceHint, totalCash, floatShares: Int
    let ebitda: Int
    let shortRatio: Double
    let targetPriceHigh: Int
    let targetPriceLow, targetPriceMean: Double
    let targetPriceMedian: Int
    let heldPercentInsiders, heldPercentInstitutions, postMarketChangePercent: Double
    let postMarketTime: Int
    let postMarketPrice, postMarketChange, regularMarketChange, regularMarketChangePercent: Double
    let regularMarketTime: Int
    let regularMarketPrice, regularMarketDayHigh: Double
    let regularMarketDayRange: String
    let regularMarketDayLow: Double
    let regularMarketVolume, sharesShort, sharesShortPrevMonth: Int
    let shortPercentFloat, regularMarketPreviousClose, bid, ask: Double
    let bidSize, askSize: Int
    let exchange, market, messageBoardID, fullExchangeName: String
    let shortName, longName: String
    let regularMarketOpen: Double
    let averageDailyVolume3Month, averageDailyVolume10Day: Int
    let beta, fiftyTwoWeekLowChange, fiftyTwoWeekLowChangePercent: Double
    let fiftyTwoWeekRange: String
    let fiftyTwoWeekHighChange, fiftyTwoWeekHighChangePercent, fiftyTwoWeekLow, fiftyTwoWeekHigh: Double
    let exDividendDate, earningsTimestamp, earningsTimestampStart, earningsTimestampEnd: Int
    let trailingPE, pegRatio, dividendsPerShare: Double
    let revenue: Int
    let priceToSales: Double
    let marketState: String
    let epsTrailingTwelveMonths, epsForward, epsCurrentYear, epsNextQuarter: Double
    let priceEpsCurrentYear, priceEpsNextQuarter: Double
    let sharesOutstanding: Int
    let bookValue, fiftyDayAverage, fiftyDayAverageChange, fiftyDayAverageChangePercent: Double
    let twoHundredDayAverage, twoHundredDayAverageChange, twoHundredDayAverageChangePercent: Double
    let marketCap: Int
    let forwardPE, priceToBook: Double
    let sourceInterval, exchangeDataDelayedBy: Int
    let exchangeTimezoneName, exchangeTimezoneShortName: String
    let pageViews: PageViews
    let gmtOffSetMilliseconds: Int
    let esgPopulated, tradeable: Bool
    let symbol: String
    let dividendDate: Int?
    let trailingAnnualDividendRate, dividendRate, trailingAnnualDividendYield, dividendYield: Double?

    enum CodingKeys: String, CodingKey {
        case language, region, quoteType, quoteSourceName, triggerable, quoteSummary, components, currency, firstTradeDateMilliseconds, priceHint, totalCash, floatShares, ebitda, shortRatio, targetPriceHigh, targetPriceLow, targetPriceMean, targetPriceMedian, heldPercentInsiders, heldPercentInstitutions, postMarketChangePercent, postMarketTime, postMarketPrice, postMarketChange, regularMarketChange, regularMarketChangePercent, regularMarketTime, regularMarketPrice, regularMarketDayHigh, regularMarketDayRange, regularMarketDayLow, regularMarketVolume, sharesShort, sharesShortPrevMonth, shortPercentFloat, regularMarketPreviousClose, bid, ask, bidSize, askSize, exchange, market
        case messageBoardID = "messageBoardId"
        case fullExchangeName, shortName, longName, regularMarketOpen, averageDailyVolume3Month, averageDailyVolume10Day, beta, fiftyTwoWeekLowChange, fiftyTwoWeekLowChangePercent, fiftyTwoWeekRange, fiftyTwoWeekHighChange, fiftyTwoWeekHighChangePercent, fiftyTwoWeekLow, fiftyTwoWeekHigh, exDividendDate, earningsTimestamp, earningsTimestampStart, earningsTimestampEnd, trailingPE, pegRatio, dividendsPerShare, revenue, priceToSales, marketState, epsTrailingTwelveMonths, epsForward, epsCurrentYear, epsNextQuarter, priceEpsCurrentYear, priceEpsNextQuarter, sharesOutstanding, bookValue, fiftyDayAverage, fiftyDayAverageChange, fiftyDayAverageChangePercent, twoHundredDayAverage, twoHundredDayAverageChange, twoHundredDayAverageChangePercent, marketCap, forwardPE, priceToBook, sourceInterval, exchangeDataDelayedBy, exchangeTimezoneName, exchangeTimezoneShortName, pageViews, gmtOffSetMilliseconds, esgPopulated, tradeable, symbol, dividendDate, trailingAnnualDividendRate, dividendRate, trailingAnnualDividendYield, dividendYield
    }
}

// MARK: - PageViews
struct PageViews: Codable {
    let midTermTrend, longTermTrend, shortTermTrend: String
}

// MARK: - QuoteSummary
struct QuoteSummary: Codable {
    let earnings: Earnings
}

// MARK: - Earnings
struct Earnings: Codable {
    let maxAge: Int
    let earningsChart: EarningsChart
    let financialsChart: FinancialsChart
    let financialCurrency: String
}

// MARK: - EarningsChart
struct EarningsChart: Codable {
    let quarterly: [EarningsChartQuarterly]
    let currentQuarterEstimate: Double
    let currentQuarterEstimateDate: String
    let currentQuarterEstimateYear: Int
    let earningsDate: [Int]
}

// MARK: - EarningsChartQuarterly
struct EarningsChartQuarterly: Codable {
    let date: String
    let actual, estimate: Double
}

// MARK: - FinancialsChart
struct FinancialsChart: Codable {
    let yearly: [Yearly]
    let quarterly: [FinancialsChartQuarterly]
}

// MARK: - FinancialsChartQuarterly
struct FinancialsChartQuarterly: Codable {
    let date: String
    let revenue, earnings: Int
}

// MARK: - Yearly
struct Yearly: Codable {
    let date, revenue, earnings: Int
}
