//
//  HomeView.swift
//  Expenses Tracker
//
//  Created by Viraj Fernando on 2023-09-25.
//

import SwiftUI
import SwiftUICharts

struct HomeView: View {
    
    @ObservedObject var financialDataService = FinancialDataService()
    
    var body: some View {
       
        VStack {
if let financialData = financialDataService.financialData {
                        Text("Income: $\(financialData.income)")
                        Text("Expenses: $\(financialData.expenses)")
                        Text("Savings: $\(financialData.savings)")
                        
//                        PieChart(dataPoints:
//                            ("Income", financialData.income),
//                            ("Expenses", financialData.expenses)
//                        , colors: Color)
                        
                        
                        
                        .aspectRatio(1, contentMode: .fit)
                        .padding()
                    } else {
                        Text("Loading financial data...")
                    }
                }
                .onAppear {
                    financialDataService.fetchData()
                }
            }
    }
struct PieChart: View {
    var dataPoints: [Double]
    var colors: [Color]

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<dataPoints.count, id: \.self) { index in
                    PieSlice(startAngle: angle(index), endAngle: angle(index + 1))
                        .fill(colors[index % colors.count])
                }
            }
            .aspectRatio(1, contentMode: .fit)
            .padding()
        }
    }

    private func angle(_ index: Int) -> Angle {
        let total = dataPoints.reduce(0, +)
        let startAngle = index == 0 ? .zero : angle(index - 1)
        let endAngle = startAngle + .radians(.pi * 2 * (dataPoints[index] / total))
        return endAngle
    }
}

struct PieSlice: Shape {
    var startAngle: Angle
    var endAngle: Angle

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        path.closeSubpath()
        return path
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
