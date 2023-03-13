import '../../domain/domain.dart';
import '../../infrastructure/infrastructure.dart';
import '../data.dart';
import '../mappers/stock_item_chart_data_mapper.dart';

abstract class IStockDatasource {
  Future<List<StockItemChartData>> getStockItemChart({required String symbol});
  Future<List<StockItem>> getTrendingStocks();
}

class StockDatasource implements IStockDatasource {
  final IHttpClient _client;

  StockDatasource({required IHttpClient client}) : _client = client;

  @override
  Future<List<StockItemChartData>> getStockItemChart({required String symbol}) async {
    final result = await _client.get('finance/chart/$symbol', apiVersion: 'v8', queryParameters: {
      'interval': '1d',
      'period1': DateTime.now().subtract(const Duration(days: 30)).secondsSinceEpoch,
      'period2': DateTime.now().secondsSinceEpoch
    });

    final int results = result.data['chart']['result'][0]['timestamp'].length;
    final List<StockItemChartData> dataPoints = [];
    for (var i = 0; i < results; i++) {
      dataPoints.add(StockItemChartDataMapper.fromJson(result.data['chart']['result'][0], index: i));
    }

    return dataPoints;
  }

  @override
  Future<List<StockItem>> getTrendingStocks() async {
    final result = await _client.post('finance/screener', apiVersion: 'v1', queryParameters: {
      'crumb': 'kE55tKvoLbk'
    }, headers: {
      'cookie':
          'GUC=AQEBCAFkD5VkPEIa1AQr&s=AQAAANn5E7dQ&g=ZA5PFg; A1=d=AQABBMV-NWMCEJCYcWPJrOqY4Rc6cYFJomEFEgEBCAGVD2Q8ZB4Ab2UB_eMBAAcIxX41Y4FJomE&S=AQAAAuz2Sf_c3SDopx7IH-8f1sM; A3=d=AQABBMV-NWMCEJCYcWPJrOqY4Rc6cYFJomEFEgEBCAGVD2Q8ZB4Ab2UB_eMBAAcIxX41Y4FJomE&S=AQAAAuz2Sf_c3SDopx7IH-8f1sM; A1S=d=AQABBMV-NWMCEJCYcWPJrOqY4Rc6cYFJomEFEgEBCAGVD2Q8ZB4Ab2UB_eMBAAcIxX41Y4FJomE&S=AQAAAuz2Sf_c3SDopx7IH-8f1sM&j=WORLD; PRF=newChartbetateaser^%^3D1^%^26t^%^3DBTC-USD^%^252BES^%^253DF; cmp=t=1678664227&j=0&u=1---'
    }, data: {
      "sortField": "dayvolume",
      "sortType": "DESC",
      "quoteType": "EQUITY",
      "query": {
        "operator": "AND",
        "operands": [
          {
            "operator": "or",
            "operands": [
              {
                "operator": "BTWN",
                "operands": ["intradaymarketcap", 2000000000, 10000000000]
              },
              {
                "operator": "BTWN",
                "operands": ["intradaymarketcap", 10000000000, 100000000000]
              },
              {
                "operator": "GT",
                "operands": ["intradaymarketcap", 100000000000]
              }
            ]
          },
          {
            "operator": "gt",
            "operands": ["dayvolume", 5000000]
          },
          {
            "operator": "or",
            "operands": [
              {
                "operator": "EQ",
                "operands": ["region", "br"]
              }
            ]
          }
        ]
      }
    });
    return List<StockItem>.from(
        result.data['finance']['result'][0]['quotes'].map((item) => StockItemMapper.fromJson(item)));
  }
}
