import 'package:dio/dio.dart';
import 'package:alarmkeyword/dto/alarmDTO.dart';
import 'package:alarmkeyword/dto/noticeDTO.dart';
import 'package:retrofit/retrofit.dart';

import '../dto/savedNoticeDTO.dart';
import '../dto/userDTO.dart';

part 'rest_api_service.g.dart';

@RestApi(baseUrl: 'http://13.231.100.158:8080/services/alarm/api')
abstract class RestApiService {
  factory RestApiService(Dio dio, {String baseUrl}) = _RestApiService;

  @POST('/users')
  Future<UserDTO>  createUserToken(@Header("Authorization") String? token,
      @Body() UserDTO userDTO);


  @GET('/notices')
  Future<List<NoticeDTO>> getNotices(@Header("Authorization") String? token,
                                    @Query('userId') String userId);

  @PATCH('/notices/{id}')
  Future<void> updateNoticeVisiable(@Path("id") id,
                                    @Header("Authorization") String? token,
                                    @Body() NoticeDTO noticeDTO);

  @GET('/saved-notices')
  Future<List<SavedNoticeDTO>> getSavedNotice(@Header("Authorization") String? token,
                              @Query('userId') String userId);

  @POST('/saved-notices/{id}')
  Future<void> createSavedNotice(@Path("id") id,
                                @Header("Authorization") String? token);

  @DELETE('/saved-notices/{id}')
  Future<void> deleteSavedNotice(@Path("id") id,
      @Header("Authorization") String? token);




  @GET('/alarms')
  Future<List<AlarmDTO>> getAlarms(@Header("Authorization") String? token,
                                  @Query('userId') String userId);

  @POST('/alarms')
  Future<AlarmDTO>  createAlarm(@Header("Authorization") String? token,
                                @Body() AlarmDTO alarmDTO);

  @PATCH('/alarms/{id}')
  Future<void> updateAlarm(@Path("id") id,
                          @Header("Authorization") String? token,
                          @Body() AlarmDTO alarm);

  @DELETE('/alarms/{id}')
  Future<void> deleteAlarm(@Path("id") id,
                          @Header("Authorization") String? token);

}