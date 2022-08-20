import 'package:either_dart/either.dart';
import 'package:freeland/app/profile/infrastructur/data_source/profile_remote.dart';
import 'package:freeland/app/profile/infrastructur/models/my_profile.dart';
import 'package:freeland/app/profile/infrastructur/models/sendConnectionParams.dart';
import 'package:freeland/common/network/error_handler.dart';

class ProfileRepoImpl {
  final ProfileRemote remote;

  ProfileRepoImpl(this.remote);

  Future<Either<String, MyProfile>> getMyProfile() async {
    return throwAppException<MyProfile>(() async {
      return await remote.getMyProfile();
    });
  }

  Future<Either<String, MyProfile>> getAnotherProfile(String id) async {
    return throwAppException<MyProfile>(() async {
      return await remote.getAnotherProfile(id);
    });
  }

  Future<Either<String, void>> sendConnect({required SendConnectionParam params}) {
    return throwAppException<void>(() async {
      await remote.sendConnect(param:params );
    });
  }
}
