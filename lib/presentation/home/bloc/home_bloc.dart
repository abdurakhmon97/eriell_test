import 'package:eriell/data/models/dummy_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());

  List<DummyData> get dummyData => _getDummyData();

  Map<String, double> get pieChartData => _getPieChartData();

  List<DummyData> _getDummyData() {
    return const <DummyData>[
      DummyData(
        platform: 'Facebook',
        revenue: '117.9 billion',
        activeUsers: '2958 million',
        originCountry: 'USA',
        ceo: 'Mark Zuckerberg',
      ),
      DummyData(
        platform: 'YouTube',
        revenue: '29.24 billion',
        activeUsers: '2514 million',
        originCountry: 'USA',
        ceo: 'Neal Mohan',
      ),
      DummyData(
        platform: 'WhatsApp',
        revenue: '790 million',
        activeUsers: '2000 million',
        originCountry: 'USA',
        ceo: 'Will Cathcart',
      ),
      DummyData(
        platform: 'Instagramm',
        revenue: '117.9 billion',
        activeUsers: '2000 million',
        originCountry: 'USA',
        ceo: 'Adam Mosseri',
      ),
      DummyData(
        platform: 'Telegram',
        revenue: '1.7 billion',
        activeUsers: '700 million',
        originCountry: 'Russia',
        ceo: 'Pavel Durov',
      ),
      DummyData(
        platform: 'TikTok',
        revenue: '11 billion',
        activeUsers: '1677 million',
        originCountry: 'China',
        ceo: 'Shou Zi Chew',
      ),
    ];
  }

  Map<String, double> _getPieChartData() {
    return {
      "Facebook": 2958,
      "YouTube": 2514,
      "WhatsApp": 2000,
      "Instagram": 2000,
    };
  }
}
