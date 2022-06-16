import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeland/app/info/country/infrastrcture/model/country.dart';
import 'package:freeland/app/info/country/presentation/country_bloc/country_event.dart';
import 'package:freeland/app/info/country/presentation/country_bloc/country_state.dart';

import '../../../../../core/bloc_status.dart';
import '../../infrastrcture/repo/country_repository.dart';

class CountryBloc extends Bloc<CountryEvent,CountryState>{

 late final CountryRepo _countryRepo;

  CountryBloc(CountryRepo countryRepo) : super(CountryState()){
    _countryRepo=countryRepo;
    on<CountryEvent>((event, emit) async {
      if(event is GetAllCountryEvent){
        emit(state.copyWith(formState: BlocStatus.loading()));

        (await _countryRepo.fetchAllCountry()).fold(
                 (left) => emit(state.copyWith(formState: BlocStatus.fail(error: left))),
                (right) => {}
        );

      }
    });
  }


}