import 'package:either_dart/either.dart';
import 'package:freeland/app/profile/infrastructur/data_source/profile_remote.dart';
import 'package:freeland/app/profile/infrastructur/models/my_profile.dart';
import 'package:freeland/common/network/error_handler.dart';

class ProfileRepoImpl {
  final ProfileRemote remote;

  ProfileRepoImpl(this.remote);

  Future<Either<String, MyProfile>> getMyProfile() async {
    return throwAppException<MyProfile>(() async {
      return await remote.getMyProfile();
    });
  }

  Future<Either<String, void>> sendConnect() {
    return throwAppException<void>(() async {
      await remote.sendConnect();
    });
  }
}
